import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> getItInjector() async {

  sl.registerSingletonAsync(
          () async => await SharedPreferences.getInstance());

}
