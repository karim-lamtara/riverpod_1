import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'Facture.dart';
import 'ListFactures.dart';
import 'Util.dart';
import 'src/utils/extensions/index.dart';
part 'FilterFactures.g.dart';

@riverpod
class FilterFactures extends _$FilterFactures {
  final sortedFactures = const Iterable<Facture>.empty();
  @override
  Iterable<Facture> build() => sortedFactures;
  int minimunPrice = 0;

  void filterFacture() {
    //print(ref.read(listFacturesProvider));
    state = ref
        .watch(listFacturesProvider)
        .toList()
        .deleteWhere((facture) => facture.prix < minimunPrice);
  }

  void refreshMinimumPrice(String value) {
    try {
      minimunPrice = int.parse(value);
    } catch (e) {
      minimunPrice = 0;
    }
    filterFacture();
  }
}
