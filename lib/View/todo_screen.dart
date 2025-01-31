import 'package:flutter/material.dart';

import '../Model/todo.dart';

class TodoListView extends StatelessWidget {
  const TodoListView({super.key, required this.todos, required this.onTodoTap});

  final List<Todo> todos;
  final Function(int) onTodoTap;


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(todos[index].title),
          trailing: Icon(
            todos[index].isCompleted
                ? Icons.check_box
                : Icons.check_box_outline_blank
          ),
            onTap: () => onTodoTap(index),

        );
      }

    );




  }
}
