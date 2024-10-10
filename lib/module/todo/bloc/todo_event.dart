// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class LoadTodoEvent extends TodoEvent {
  final List<Todo> userTodos;

  const LoadTodoEvent({required this.userTodos});
}

class AddTodoEvent extends TodoEvent {
  final Todo todoData;
  final List<Todo> userTodos;

  const AddTodoEvent({
    required this.todoData,
    required this.userTodos,
  });
  @override
  List<Object> get props => [todoData, userTodos];
}

class DeleteTodoEvent extends TodoEvent {
  final Todo deleteTodoId;
  const DeleteTodoEvent({
    required this.deleteTodoId,
  });
  @override
  List<Object> get props => [deleteTodoId];
}

class EditTodoEvent extends TodoEvent {
  final Todo todoData;
  const EditTodoEvent({
    required this.todoData,
  });
  @override
  List<Object> get props => [todoData];
}
