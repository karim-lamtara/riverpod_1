import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_1/ListFactures.dart';

import 'Facture.dart';
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
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Facture exo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 153, 187, 246)),
      ),
      home: const MyHomePage(),
      // routes: {
      //   'facture': (context) => const FactureScreen(),
      // },
    );
  }
}

class FactureScreen extends ConsumerWidget {
  const FactureScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Facture exo SCUB'),
        backgroundColor: theme.colorScheme.primary,
      ),
      body: Text("To do...."),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  build(context, ref) {
    final theme = Theme.of(context);
    Iterable<Facture> factures = ref.watch(listFacturesProvider);
    final facturesRead = ref.read(listFacturesProvider.notifier);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Facture exo SCUB'),
          backgroundColor: theme.colorScheme.primary,
        ),
        body:
            //Padding(
            //     padding: const EdgeInsets.all(0),
            // child:
            Center(
          child: SizedBox(
              height: 500,
              child: ListView(children: [
                FloatingActionButton(
                  heroTag: "btn1",
                  onPressed: () => facturesRead.add(Facture.factureFactory(
                      facturesRead.nextId(),
                      Util.randomClient(),
                      Util.randomPrix())),
                  child: const Icon(Icons.add),
                ),
                Column(
                  children: factures
                      .map((e) =>
                          FactureCard(facture: e, facturesRead: facturesRead))
                      .toList(),
                )
              ])),
        ));
  }
}

class FactureCard extends StatefulWidget {
  FactureCard({super.key, required this.facture, required this.facturesRead});

  final Facture facture;
  final ListFactures facturesRead;
  bool isFactureSelected = false;

  @override
  _FactureCard createState() => _FactureCard();
}

class _FactureCard extends State<FactureCard> {
  @override
  build(context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayLarge!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    final String nomClient = super.widget.facture.nomClient;
    return Padding(
        padding: const EdgeInsets.all(0),
        child: Card(
            color: Color.fromARGB(255, 163, 201, 232),
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
                    onTap: () {
                      setState(() =>
                          widget.isFactureSelected = !widget.isFactureSelected);
                    }),
                FloatingActionButton(
                  heroTag: widget.facture.id,
                  onPressed: () {
                    widget.facturesRead.remove(widget.facture.id);
                  },
                  child: const Icon(Icons.delete),
                ),
              ]),
              if (widget.isFactureSelected)
                Card(child: DetailsFacture(facture: widget.facture))
            ])));
  }
}

class DetailsFacture extends StatelessWidget {
  const DetailsFacture({super.key, required this.facture});
  final Facture facture;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Column(children: [const Text("Id_facture"), Text(facture.id)]),
      SizedBox(width: 20),
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
      SizedBox(width: 20),
      Column(children: [const Text("Prix_facture"), Text('${facture.prix}')]),
    ]);
  }
}
