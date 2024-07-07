import 'package:get_it/get_it.dart';
import '../services/todo_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => TodoService());
}
