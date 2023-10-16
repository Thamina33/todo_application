class Todo {
  String title;
  String details;
  DateTime createdDateTime, updatedDateTime;
  String status;
  Todo({
    required this.title,
    required this.details,
    required this.createdDateTime,
    required this.updatedDateTime,
    this.status = 'pending',
  });
}