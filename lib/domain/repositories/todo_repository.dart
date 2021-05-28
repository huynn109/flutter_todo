import 'package:flutter_todo_simple/domain/repositories/local/local_todo_repository.dart';
import 'package:flutter_todo_simple/domain/repositories/remote/remote_todo_repository.dart';

abstract class TodoRepository with LocalTodoRepository, RemoteTodoRepository {}
