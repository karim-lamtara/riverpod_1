import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'Facture.dart';
import 'Util.dart';
import 'src/utils/extensions/index.dart';
part 'ListFactures.g.dart';

@riverpod
class ListFactures extends _$ListFactures {
  int nextId() => Facture.lastIndexUsed + 1;
  final initialFactures = Iterable<Facture>.generate(
      3,
      (index) => Facture.factureFactory(
          index, Util.randomClient(), Util.randomPrix()));
  @override
  Iterable<Facture> build() => initialFactures;

  void add(Facture facture) {
    state = [...state, facture];
  }

  void remove(String factureId) {
    state = state
        .toList(growable: true)
        .deleteWhere((facture) => factureId == facture.id);
  }
}
