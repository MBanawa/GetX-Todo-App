import 'package:flutter/material.dart';
import 'package:flutter_getx_todo_app/controllers/todo_controller.dart';
import 'package:flutter_getx_todo_app/screens/todo_screen.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Get.put(TodoController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(TodoScreen());
        },
      ),
      body: Container(
        child: Obx(
          () => ListView.separated(
            itemBuilder: (context, index) => Dismissible(
              key: UniqueKey(),
              onDismissed: (_) {
                var remove = todoController.todos[index];
                todoController.todos.removeAt(index);
                Get.snackbar(
                  'Removed Todo',
                  '${remove.text} was successfully deleted',
                  mainButton: FlatButton(
                    onPressed: () {
                      if (remove.isNull) {
                        return;
                      }
                      todoController.todos.insert(index, remove);
                      remove = null;
                      if (Get.isSnackbarOpen) {
                        Get.back();
                      }
                    },
                    child: Text('Undo'),
                  ),
                );
              },
              child: ListTile(
                title: Text(
                  todoController.todos[index].text,
                  style: (todoController.todos[index].done)
                      ? TextStyle(
                          color: Colors.red,
                          decoration: TextDecoration.lineThrough)
                      : TextStyle(
                          color: Theme.of(context).textTheme.bodyText1.color),
                ),
                onTap: () {
                  Get.to(TodoScreen(
                    index: index,
                  ));
                },
                leading: Checkbox(
                  value: todoController.todos[index].done,
                  onChanged: (v) {
                    var changed = todoController.todos[index];
                    changed.done = v;
                    todoController.todos[index] = changed;
                  },
                ),
                trailing: Icon(Icons.chevron_right),
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
