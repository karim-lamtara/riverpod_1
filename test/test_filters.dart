import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_1/Facture.dart';
import 'package:riverpod_1/FilterFactures.dart';
import 'package:riverpod_1/ListFactures.dart';

/// Test filtres des factures [FilterFactures]
void main() {
  group('$FilterFactures', () {
    final container = ProviderContainer();
    final setup = [
      Facture(id: 't1', nomClient: 'client1', prix: 20),
      Facture(id: 't2', nomClient: 'client2', prix: 40),
      Facture(id: 't3', nomClient: 'client2', prix: 10),
      Facture(id: 't4', nomClient: 'client2', prix: 30),
      Facture(id: 't5', nomClient: 'client2', prix: 50),
      Facture(id: 't6', nomClient: 'client2', prix: 80),
      Facture(id: 't7', nomClient: 'client2', prix: 30),
      Facture(id: 't8', nomClient: 'client2', prix: 20),
    ];

    test('$FilterFactures return only facture with price >= 50', () {
      final container = ProviderContainer(
        overrides: [
          listFacturesProvider.overrideWith(() => ListFactures(setup)),
        ],
      );

      //test de la liste de facture simulée
      expect(container.read(listFacturesProvider.notifier).state.length,
          equals(8));

      container.read(filterFacturesProvider.notifier).minimunPrice = 50;
      container.read(filterFacturesProvider.notifier).filterFacture();
      int resultTest = 0;
      for (final facture in container.read(filterFacturesProvider)) {
        resultTest = resultTest + facture.prix;
      }
      //test filterFacture
      expect(resultTest, equals(130));
    });
  });
}
