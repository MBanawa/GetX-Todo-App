import 'package:flutter/material.dart';
import 'package:flutter_getx_todo_app/controllers/todo_controller.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Get.put(TodoController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: Container(
        child: Obx(
          () => ListView.separated(
            itemBuilder: (context, index) => ListTile(
              title: Text(
                todoController.todos[index].text,
                style: (todoController.todos[index].done)
                    ? TextStyle(
                        color: Colors.red,
                        decoration: TextDecoration.lineThrough)
                    : TextStyle(
                        color: Theme.of(context).textTheme.bodyText1.color),
              ),
              onTap: () {},
              trailing: Checkbox(
                value: todoController.todos[index].done,
                onChanged: (v) {
                  var changed = todoController.todos[index];
                  changed.done = v;
                  todoController.todos[index] = changed;
                },
              ),
            ),
            separatorBuilder: (_, __) => Divider(),
            itemCount: todoController.todos.length,
          ),
        ),
      ),
    );
  }
}
