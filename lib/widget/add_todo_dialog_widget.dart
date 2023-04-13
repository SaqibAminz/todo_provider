import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/provider/todos.dart';
import 'package:todo_app/widget/todo_form_widget.dart';

class AddTodoDialogWidget extends StatefulWidget {
  const AddTodoDialogWidget({super.key}); // fixed super.key

  @override
  State<AddTodoDialogWidget> createState() => _AddTodoDialogWidgetState();
}

class _AddTodoDialogWidgetState extends State<AddTodoDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Todo App',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 8),
            TodoFormWidget(
              onChangedTitle: (title) => setState(() => this.title = title),
              onChangedDescripton: (description) => setState(() =>
                  this.description = description), // fixed onChangedDescription
              onSavedTodo: addTodo, // fixed onSavedTodo
            ),
          ],
        ),
      ),
    );
  }

  void addTodo() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final todo = Todo(
          createdTime: DateTime.now(),
          title: title,
          id: DateTime.now().toString(),
          description: description);

      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.addTodo(todo);

      Navigator.of(context).pop();
    }
  }
}
