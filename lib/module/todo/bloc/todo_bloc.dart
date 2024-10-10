import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simple_todo/module/todo/model/todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoLoading()) {
    on<LoadTodoEvent>(_onLoadTodoEvent);
    on<AddTodoEvent>(_onAddTodoEvent);
    on<EditTodoEvent>(_onEditTodoEvent);
    on<DeleteTodoEvent>(_onDeleteTodoEvent);
  }

  _onLoadTodoEvent(LoadTodoEvent event, Emitter<TodoState> emit) {
    emit(TodoLoading());
    final todos = event.userTodos;
    emit(TodoLoaded(todos: todos));
  }

  _onAddTodoEvent(AddTodoEvent event, Emitter<TodoState> emit) {
    emit(TodoLoading());
    final todo = event.todoData;
    final userTodo = event.userTodos;
    emit(TodoLoaded(todos: [...userTodo, todo]));
  }

  _onEditTodoEvent(EditTodoEvent event, Emitter<TodoState> emit) {
    emit(TodoLoading());
    emit(const TodoLoaded(todos: []));
  }

  _onDeleteTodoEvent(DeleteTodoEvent event, Emitter<TodoState> emit) {
    emit(TodoLoading());
    emit(const TodoLoaded(todos: []));
  }
}
