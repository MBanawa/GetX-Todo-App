import 'package:flutter/material.dart';
import 'package:flutter_getx_todo_app/controllers/todo_controller.dart';
import 'package:flutter_getx_todo_app/models/todo.dart';
import 'package:get/get.dart';

class TodoScreen extends StatelessWidget {
  TodoScreen({this.index});
  final int index;
  final TodoController todoController = Get.find();

  @override
  Widget build(BuildContext context) {
    String text = '';
    if (!this.index.isNull) {
      text = todoController.todos[index].text;
    }
    TextEditingController textEditingController =
        TextEditingController(text: text);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                    hintText: 'What do you want to accomplish?',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none),
                style: TextStyle(fontSize: 25.0),
                keyboardType: TextInputType.multiline,
                maxLines: 999,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RaisedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text('Cancel'),
                  color: Colors.red,
                ),
                RaisedButton(
                  onPressed: () {
                    if (this.index.isNull) {
                      todoController.todos
                          .add(Todo(text: textEditingController.text));
                    } else {
                      var editedText = todoController.todos[index];
                      editedText.text = textEditingController.text;
                      todoController.todos[index] = editedText;
                    }
                    Get.back();
                  },
                  child: Text((this.index.isNull) ? 'Add' : 'Edit'),
                  color: Colors.green,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
