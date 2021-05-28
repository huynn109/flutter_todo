mixin CategoryMapper<E, M> {
  M fromEntity(E from);
  E toEntity(M from);
}
