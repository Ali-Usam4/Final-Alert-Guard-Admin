import 'package:firebase_core/firebase_core.dart';

import '../../config/environment.dart';
import '../../firebase_options.dart';
import '../di/service_locator.dart';

Future<void> initApp(Environment env) async {
  setupLocator(env);
  await sl.allReady();
}

Future<void> initFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
