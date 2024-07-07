import 'package:stacked/stacked.dart';
import '../../../app/locator.dart';
import '../../../models/todo.dart';
import '../../../services/todo_service.dart';

class HomeViewModel extends BaseViewModel {
  final TodoService _todoService = locator<TodoService>();

  List<Todo> get todos => _todoService.getAllTodos();

  Future<void> addTodo(String title) async {
    final todo = Todo(id: DateTime.now().toString(), title: title);
    await _todoService.addTodo(todo);
    notifyListeners();
  }

  Future<void> toggleTodoCompletion(Todo todo) async {
    todo.isCompleted = !todo.isCompleted;
    await _todoService.updateTodo(todo);
    notifyListeners();
  }

  Future<void> deleteTodo(Todo todo) async {
    await _todoService.deleteTodo(todo);
    notifyListeners();
  }

  Future<void> updateTodo(Todo todo, String newTitle) async {
    todo.title = newTitle;
    await _todoService.updateTodo(todo);
    notifyListeners();
  }
}
