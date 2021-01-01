import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quicklink/colors.dart';
import 'package:quicklink/logic/link_controller.dart';
import 'package:quicklink/screens/contactme.dart';
import 'screens/home.dart';


main(List<String> args) {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider.value(
        value: Links(),
      ),
    ], child: MyApp()),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
    );

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: ThemeColor.mainColor,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarDividerColor: Colors.transparent,
    ));
    return MaterialApp(
      title: "Quick Links",
      theme: ThemeData(
        primaryColor: ThemeColor.mainColor,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        "/": (context) => Home(),
        "/contact": (context) => ContactPage()
      },
    );
  }
}
