import 'package:flutter_todo_simple/domain/repositories/local/local_category_repository.dart';
import 'package:flutter_todo_simple/domain/repositories/remote/remote_category_repository.dart';

abstract class CategoryRepository
    with LocalCategoryRepository, RemoteCategoryRepository {}
