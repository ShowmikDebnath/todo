import '../Model/todo.dart';

class TodoController {
  List<Todo> todos = [];

  void addTodo(String title){
    todos.add(Todo(title: title));
  }

  void toggleTodoCompleted(int index){
    todos[index].toggleCompleted();
  }

  void deleteTodo(int index){
    todos.removeAt(index);
  }

}