import 'dart:convert';

class Todo {
  String todoTitle;
  String todoDes;
  String todoId;
  bool isCompleted;
  Todo({
    required this.todoTitle,
    required this.todoDes,
    required this.todoId,
    required this.isCompleted,
  });

  Todo copyWith({
    String? todoTitle,
    String? todoDes,
    String? todoId,
    bool? isCompleted,
  }) {
    return Todo(
      todoTitle: todoTitle ?? this.todoTitle,
      todoDes: todoDes ?? this.todoDes,
      todoId: todoId ?? this.todoId,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'todoTitle': todoTitle,
      'todoDes': todoDes,
      'todoId': todoId,
      'isCompleted': isCompleted,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      todoTitle: map['todoTitle'] as String,
      todoDes: map['todoDes'] as String,
      todoId: map['todoId'] as String,
      isCompleted: map['isCompleted'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Todo.fromJson(String source) =>
      Todo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Todo(todoTitle: $todoTitle, todoDes: $todoDes, todoId: $todoId, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(covariant Todo other) {
    if (identical(this, other)) return true;

    return other.todoTitle == todoTitle &&
        other.todoDes == todoDes &&
        other.todoId == todoId &&
        other.isCompleted == isCompleted;
  }

  @override
  int get hashCode {
    return todoTitle.hashCode ^
        todoDes.hashCode ^
        todoId.hashCode ^
        isCompleted.hashCode;
  }
}
