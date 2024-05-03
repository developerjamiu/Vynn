extension IterableX<T> on Iterable<T> {
  List<T> insertBetween(T item) => expand(
        (e) sync* {
          yield item;
          yield e;
        },
      ).skip(1).toList(growable: false);
}
