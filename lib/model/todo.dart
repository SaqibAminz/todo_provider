class TodoField {
  static const createdTime = "Created Time";
}

class Todo {
  late DateTime createdTime;
  String title = '';
  String description = '';
  String id = '';
  bool isDone = false;

  Todo({
    required this.createdTime,
    required this.title,
    this.description = '',
    this.id = "",
    this.isDone = false,
  });
}
