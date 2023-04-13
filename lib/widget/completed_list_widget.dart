import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todos.dart';
import 'package:todo_app/widget/todo_widget.dart';

class CompletedListWidget extends StatelessWidget {
  const CompletedListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    final todos = provider.todosCompleted;

    return todos.isEmpty
        ? const Center(
            child: Text(
              'Not Completed Task here !',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.pink,
                  fontWeight: FontWeight.bold),
            ),
          )
        : ListView.separated(
            padding: const EdgeInsets.all(16),
            physics: const BouncingScrollPhysics(),
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return TodoWidget(todo: todo);
            },
            separatorBuilder: (context, index) {
              return const Divider(); // Return a Divider as the separator
            },
          );
  }
}
