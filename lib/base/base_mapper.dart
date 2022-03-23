abstract class BaseMapper<T, V> {
  V map(T t);

  T reverseMap(V v);
}
