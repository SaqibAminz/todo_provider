import 'package:flutter/material.dart';

class TodoFormWidget extends StatelessWidget {
  final String title;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescripton;
  final VoidCallback onSavedTodo;

  const TodoFormWidget(
      {this.title = "",
      this.description = '',
      required this.onChangedDescripton,
      required this.onChangedTitle,
      required this.onSavedTodo,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        buildTitle(),
        const SizedBox(
          height: 10,
        ),
        buildDescription(),
        const SizedBox(
          height: 10,
        ),
        buildButton(),
      ]),
    );
  }

  Widget buildTitle() => TextFormField(
        maxLines: 1,
        initialValue: title,
        onChanged: onChangedTitle,
        validator: (title) {
          if (title!.isEmpty) {
            return "The title can't be empty";
          } else {
            return null;
          }
        },
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          label: Text('Title'),
        ),
      );

  Widget buildDescription() => TextFormField(
        maxLines: 3,
        initialValue: description,
        onChanged: onChangedDescripton,
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          label: Text('Descripton'),
        ),
      );

  Widget buildButton() => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black),
            ),
            onPressed: onSavedTodo,
            child: const Text('Save')),
      );
}
