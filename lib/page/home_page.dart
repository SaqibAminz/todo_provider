import 'package:flutter/material.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/widget/add_todo_dialog_widget.dart';
import 'package:todo_app/widget/todo_list_widget.dart';
import 'package:todo_app/widget/completed_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      const TodoListWidget(),
      const CompletedListWidget(),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text(MyApp.title)),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined),
            label: 'Todos',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.done,
              size: 28,
            ),
            label: 'Completed',
          ),
        ],
      ),
      body: tabs[selectedIndex],
      floatingActionButton:
          selectedIndex == 0 // Show FAB only for TodoListWidget
              ? FloatingActionButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  backgroundColor: Colors.black,
                  onPressed: () => showDialog(
                    builder: (context) => const AddTodoDialogWidget(),
                    context: context,
                    // barrierDismissible: false,
                  ),
                  child: const Icon(Icons.add),
                )
              : null,
    );
  }
}
