abstract class TodoMapper<E, M> {
  M fromEntity(E from);
  E toEntity(M from);
}
