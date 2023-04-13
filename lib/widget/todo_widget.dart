import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/provider/todos.dart';
import 'package:todo_app/Utils.dart';
import 'package:todo_app/page/edit_todo_page.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;

  const TodoWidget({
    required this.todo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: Slidable(
        startActionPane: ActionPane(
          motion: const StretchMotion(),
          key: Key(todo.id),
          children: [
            SlidableAction(
              backgroundColor: Colors.green,
              label: 'Edit',
              icon: Icons.edit,
              onPressed: (context) => editTodo(context, todo),
            )
          ],
        ),
        endActionPane: ActionPane(
          motion: const BehindMotion(),
          key: Key(todo.id),
          children: [
            SlidableAction(
              backgroundColor: Colors.red,
              label: 'Delete',
              icon: Icons.delete,
              onPressed: (context) => deleteTodo(context, todo),
            )
          ],
        ),
        child: buildTodo(context),
      ),
    );
  }

  Widget buildTodo(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Checkbox(
            activeColor: Theme.of(context).primaryColor,
            checkColor: Colors.white,
            value: todo.isDone,
            onChanged: (_) {
              final provider =
                  Provider.of<TodosProvider>(context, listen: false);
              final isDone = provider.toggleTodoStatus(todo);

              Utils.showSnackBar(
                  context, isDone ? 'Task Completed' : 'Incomplete Task');
            },
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  todo.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                    fontSize: 22,
                  ),
                ),
                if (todo.description.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    child: Text(
                      todo.description,
                      style: const TextStyle(fontSize: 20, height: 1.5),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void deleteTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(todo);

    Utils.showSnackBar(context, 'Todo Deleted ! ');
  }

  void editTodo(BuildContext context, Todo todo) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (BuildContext context) {
        return EditTodoPage(todo: todo);
      },
    ),
  );
}

}
