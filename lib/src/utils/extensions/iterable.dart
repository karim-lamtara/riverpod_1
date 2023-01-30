extension Remove<E> on List<E> {
  List<E> deleteWhere(bool Function(E element) test) => this..removeWhere(test);
}
