class Question {
  final String id;
  final String title; //the Question itself
  final Map<String, bool> option;

  Question({
    required this.id,
    required this.title,
    required this.option,
  });
  @override
  String toString() {
    return 'Question(id:$id title:$title option:$option)';
  }
}
