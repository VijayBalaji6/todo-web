import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_todo/module/todo/bloc/todo_bloc.dart';
import 'package:simple_todo/module/todo/model/todo.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        return Scaffold(
          body: (state is TodoLoading)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : (state is TodoLoaded)
                  ? Column(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              _showMyDialog(context, state.todos);
                            },
                            child: const Icon(Icons.add)),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.todos.length,
                            itemBuilder: (BuildContext context, int index) {
                              final Todo currentTodo = state.todos[index];
                              return ListTile(
                                title: Text(currentTodo.todoTitle),
                                subtitle: Text(currentTodo.todoDes),
                              );
                            }),
                      ],
                    )
                  : (state is TodoFailed)
                      ? const Center(child: Text('Error'))
                      : Container(),
        );
      },
    );
  }
}

Future<void> _showMyDialog(BuildContext context, List<Todo> todos) async {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController subTitleController = TextEditingController();
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('AlertDialog Title'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              const Text('Add Todo'),
              TextFormField(
                controller: titleController,
              ),
              TextFormField(
                controller: subTitleController,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Add Todo'),
            onPressed: () {
              if (titleController.text.isNotEmpty &&
                  subTitleController.text.isNotEmpty) {
                context.read<TodoBloc>().add(AddTodoEvent(
                    todoData: Todo(
                        todoTitle: titleController.text,
                        todoDes: subTitleController.text,
                        todoId: titleController.text,
                        isCompleted: false),
                    userTodos: todos));
              }

              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
