import 'package:get_it/get_it.dart';
import 'localstorage_service.dart';

GetIt locator = GetIt();

Future setupLocator() async{
  var lsInstance = await LocalStorageService.getInstance();
//  var ssInstance = await SecureStorageService.getInstance();


  locator.registerSingleton<LocalStorageService>(lsInstance);
//  locator.registerSingleton<FlutterSecureStorage>(ssInstance);

//  locator.registerSingleton(UserService());
//  locator.registerFactory<LoginService>(() => LoginService());
}

// Usage:
//import 'package:my_project/service_locator.dart';
//
//var userService = locator<UserService>();