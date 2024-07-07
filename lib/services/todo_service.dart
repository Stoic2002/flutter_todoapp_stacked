import 'package:hive/hive.dart';
import '../models/todo.dart';

class TodoService {
  late Box<Todo> _todoBox;

  Future<void> init() async {
    _todoBox = await Hive.openBox<Todo>('todos');
  }

  List<Todo> getAllTodos() {
    return _todoBox.values.toList();
  }

  Future<void> addTodo(Todo todo) async {
    await _todoBox.put(todo.id, todo);
  }

  Future<void> updateTodo(Todo todo) async {
    await _todoBox.put(todo.id, todo);
  }

  Future<void> deleteTodo(Todo todo) async {
    await todo.delete();
  }
}
