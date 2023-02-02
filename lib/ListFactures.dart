import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_1/FilterFactures.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'Facture.dart';
import 'Util.dart';
import 'src/utils/extensions/index.dart';
part 'ListFactures.g.dart';

int _lastIndexUsed = 0;

@riverpod
class ListFactures extends _$ListFactures {
  int nextId() => _lastIndexUsed + 1;
  final initialFactures = const Iterable<Facture>.empty();
  @override
  Iterable<Facture> build() => initialFactures;

  void add(Facture facture) {
    state = [...state, facture];
    print(state);
    ref.read(filterFacturesProvider.notifier).filterFacture();
  }

  void remove(String factureId) {
    state = state
        .toList(growable: true)
        .deleteWhere((facture) => factureId == facture.id);
    ref.read(filterFacturesProvider.notifier).filterFacture();
  }

  Facture factory(int idx, String nom, int prix) {
    Facture facture = Facture(id: 'FCT-$idx', nomClient: nom, prix: prix);
    _lastIndexUsed++;
    return facture;
  }
}
