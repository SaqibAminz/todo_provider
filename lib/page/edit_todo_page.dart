import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo_app/provider/todos.dart';
import 'package:todo_app/widget/todo_form_widget.dart';

class EditTodoPage extends StatefulWidget {
  const EditTodoPage({super.key});

  @override
  State<EditTodoPage> createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  String title="";
  String Description="";
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
