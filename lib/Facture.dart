import 'package:freezed_annotation/freezed_annotation.dart';
part 'Facture.freezed.dart';

@freezed
class Facture with _$Facture {
  factory Facture({
    @Default("") String id,
    @Default("") String nomClient,
    @Default(0) int prix,
  }) = _Facture;

  // static Facture factureFactory(int idx, String nom, int prix) {
  //   Facture facture = Facture(id: 'FCT-$idx', nomClient: nom, prix: prix);
  //   lastIndexUsed++;
  //   return facture;
  // }
}
