class EnumMapper<E, T> {
  late Map<E, T> _map;
  late Map<T, E> _reverseMap;

  EnumMapper(List<E> values, T Function(E value) mapper) {
    _map = {}..addEntries(
        values.map(
          (v) => MapEntry(v, mapper(v)),
        ),
      );
    _reverseMap = {}..addEntries(
        values.map(
          (v) => MapEntry(mapper(v), v),
        ),
      );
  }

  T fromEnum(E value) => _map[value]!;
  E toEnum(T value) => _reverseMap[value] as E;
}
