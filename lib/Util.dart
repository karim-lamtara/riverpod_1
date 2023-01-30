import 'dart:math';

// extension Remove<E> on List<E> {
//   List<E> deleteWhere(bool Function(E element) test) => this..removeWhere(test);
// }

class Util {
  static String randomClient() => "client${Random().nextInt(100)}";
  static int randomPrix() => Random().nextInt(100);
}
