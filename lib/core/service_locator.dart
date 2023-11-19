 import 'package:get_it/get_it.dart';
import 'package:quiz_app/core/firebase_service.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
   getIt.registerSingleton<DBConnect>(DBConnect());
}
