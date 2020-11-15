import 'package:flutter_getx_todo_app/models/todo.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  var todos = List<Todo>().obs;
}
