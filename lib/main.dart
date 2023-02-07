// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_1/ListFactures.dart';
import 'package:riverpod_1/isFactureSelected.dart';

import 'Facture.dart';
import 'FilterFactures.dart';
import 'Util.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  build(_) {
    return MaterialApp(
      title: 'Facture exo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 153, 187, 246)),
      ),
      home: const MyHomePage(),
    );
  }
}

/// Display [Facture]
class FactureScreen extends ConsumerWidget {
  const FactureScreen({super.key});

  @override
  build(context, ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Facture exo SCUB'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: const Text("To do...."),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  build(context, ref) {
    final theme = Theme.of(context);

    final filterWatch = ref.watch(filterFacturesProvider);
    final facturesRead = ref.read(listFacturesProvider.notifier);
    final filterRead = ref.read(filterFacturesProvider.notifier);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Facture exo SCUB'),
          backgroundColor: theme.colorScheme.primary,
        ),
        body: Center(
          child: SizedBox(
              height: 400,
              child: ListView(children: [
                Row(children: [
                  FloatingActionButton(
                    heroTag: "btn1",
                    onPressed: () => facturesRead.add(
                        facturesRead.randomFactory(facturesRead.nextId,
                            Util.randomClient(), Util.randomPrix())),
                    child: const Icon(Icons.add),
                  ),
                  const SizedBox(width: 100),
                  SizedBox(
                    width: 20.0,
                    child: TextField(
                      maxLines: 1,
                      maxLength: 5,
                      keyboardType: TextInputType.number,
                      onChanged: (v) => filterRead.refreshMinimumPrice(v),
                    ),
                  ),
                ]),
                Column(
                  children: ref
                      .watch(filterFacturesProvider)
                      .map((e) =>
                          FactureCard(facture: e, facturesRead: facturesRead))
                      .toList(),
                )
              ])),
        ));
  }
}

class FactureCard extends ConsumerWidget {
  FactureCard({super.key, required this.facture, required this.facturesRead});

  final Facture facture;
  final ListFactures facturesRead;

  @override
  build(context, ref) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayLarge!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    final String nomClient = facture.nomClient;
    return Padding(
        padding: const EdgeInsets.all(0),
        child: Card(
            color: const Color.fromARGB(255, 163, 201, 232),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                InkWell(
                    child: Container(
                      width: 400,
                      alignment: Alignment.center,
                      child: Text(
                        nomClient,
                        style: style,
                        textDirection: TextDirection.ltr,
                      ),
                    ),
                    onTap: () =>
                        ref
                                .read(isFactureSelectedProvider(facture.id)
                                    .notifier)
                                .state =
                            !ref.read(isFactureSelectedProvider(facture.id))),
                FloatingActionButton(
                  heroTag: facture.id,
                  onPressed: () {
                    facturesRead.remove(facture.id);
                  },
                  child: const Icon(Icons.delete),
                ),
              ]),
              if (ref.watch(isFactureSelectedProvider(facture.id)))
                Card(child: DetailsFacture(facture: facture))
            ])));
  }
}

class DetailsFacture extends StatelessWidget {
  const DetailsFacture({super.key, required this.facture});
  final Facture facture;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(children: [const Text("Id_facture"), Text(facture.id)]),
        const SizedBox(width: 20),
        Column(children: [
          const Text("Nom_Client"),
          InkWell(
              child: Container(
                alignment: Alignment.center,
                child: Text(facture.nomClient),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FactureScreen()));
              })
        ]),
        const SizedBox(width: 20),
        Column(children: [const Text("Prix_facture"), Text('${facture.prix}')]),
      ],
    );
  }
}
