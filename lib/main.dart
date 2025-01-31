import 'package:coffee_card/Controller/todoController.dart';
import 'package:coffee_card/View/todo_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final TodoController _controller = TodoController();
  final TextEditingController _textEditingController = TextEditingController();

  void _addTodo(){
    if(_textEditingController.text.isNotEmpty){
      setState(() {
        _controller.addTodo(_textEditingController.text);
      });
    }

  }

  // void _toggleTodoCompleted(int index) {
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     setState(() {
  //       _controller.toggleTodoCompleted(index);
  //     });
  //   });
  // }
  // void _toggleTodoCompleted(int index) {
  //   setState(() {
  //     _controller.toggleTodoCompleted(index);
  //   });
  // }

  void _toggleTodoCompleted(int index) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          _controller.toggleTodoCompleted(index);
        });
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("MVC ToDo app"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  labelText: "New ToDo",
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: (){
                      _addTodo();
                      _textEditingController.clear();
                    },

                  )
                ),
              ),
            ),
            Expanded(
                child: TodoListView(
                  todos: _controller.todos,
                  onTodoTap: _toggleTodoCompleted,

                )
            )

          ],
        ),
      )
    );
  }
}
