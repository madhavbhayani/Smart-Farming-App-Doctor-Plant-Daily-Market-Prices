import 'package:doctorplant/firebase_options.dart';
import 'package:doctorplant/screens/homepage.dart';
import 'package:doctorplant/screens/splashscrn.dart';
import 'package:doctorplant/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? isViewed;
void main() async {
  const SystemUiOverlayStyle(statusBarColor: Colors.white);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt("splashscrn");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeAnimationCurve: Curves.linear,
      debugShowCheckedModeBanner: false,
      title: 'Doctor Plant',
      theme: AppTheme.lightTheme(context),
      home: isViewed != 0 ? const SplashScreen() : const Homepage(),
    );
  }
}
