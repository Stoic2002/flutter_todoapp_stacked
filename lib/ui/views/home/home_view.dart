import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../models/todo.dart';
import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(title: Text('Todo App')),
        body: ListView.builder(
          itemCount: model.todos.length,
          itemBuilder: (context, index) {
            final todo = model.todos[index];
            return ListTile(
              title: Text(
                todo.title,
                style: TextStyle(
                  decoration:
                      todo.isCompleted ? TextDecoration.lineThrough : null,
                ),
              ),
              leading: Checkbox(
                value: todo.isCompleted,
                onChanged: (_) => model.toggleTodoCompletion(todo),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) =>
                            UpdateTodoDialog(model: model, todo: todo),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => model.deleteTodo(todo),
                  ),
                ],
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AddTodoDialog(model: model),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class AddTodoDialog extends StatelessWidget {
  final HomeViewModel model;
  final TextEditingController _controller = TextEditingController();

  AddTodoDialog({required this.model});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Todo'),
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(hintText: 'Enter todo title'),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (_controller.text.isNotEmpty) {
              model.addTodo(_controller.text);
              Navigator.pop(context);
            }
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}

class UpdateTodoDialog extends StatelessWidget {
  final HomeViewModel model;
  final Todo todo;
  final TextEditingController _controller;

  UpdateTodoDialog({required this.model, required this.todo})
      : _controller = TextEditingController(text: todo.title);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Update Todo'),
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(hintText: 'Enter new todo title'),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (_controller.text.isNotEmpty) {
              model.updateTodo(todo, _controller.text);
              Navigator.pop(context);
            }
          },
          child: Text('Update'),
        ),
      ],
    );
  }
}
