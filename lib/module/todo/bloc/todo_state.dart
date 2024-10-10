part of 'todo_bloc.dart';

sealed class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

final class TodoLoading extends TodoState {}

final class TodoLoaded extends TodoState {
  final List<Todo> todos;
  const TodoLoaded({required this.todos});
}

final class TodoFailed extends TodoState {}
