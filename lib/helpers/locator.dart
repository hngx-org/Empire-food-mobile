import 'package:get_it/get_it.dart';
import 'package:free_lunch_app/helpers/dialog_handler.dart';
GetIt locator = GetIt.instance;

///Register [DialogHandler] as a service locator
///so we can show dialogs anywhere in our app without BuildContext.
void setUpLocator() {
  locator.registerLazySingleton<DialogHandler>(() => DialogHandler());
}