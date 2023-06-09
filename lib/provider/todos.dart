import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';

class TodosProvider extends ChangeNotifier {
  final List<Todo> _todos = [
    Todo(
        createdTime: DateTime.now(),
        title: 'Breakfast Today',
        description: '- Eggs\n -Milk \n-Bread\n-Water'),
    Todo(
        createdTime: DateTime.now(),
        title: 'Plan a family trip',
        description: '- Rent a car\n -Rent a Hotel \n-Packing'),
    Todo(
        createdTime: DateTime.now(),
        title: 'Dog walking around',
        description: '- Eggs\n -Milk \n-Bread\n-Water'),
  ];

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();
  List<Todo> get todosCompleted =>
      _todos.where((todo) => todo.isDone == true).toList();

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  bool toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();

    return todo.isDone;
  }

  void updateTodo(Todo todo, String title, String description) {
    todo.title = title;
    todo.description = description;

    notifyListeners();
  }
}
