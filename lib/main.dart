import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/pages/home_page.dart';

void main() async {
  await Hive.initFlutter();

  var box = await Hive.openBox('myBox');

  runApp(const MyApp());
}

// var myTheme = ThemeData(
//   brightness: Brightness.light,
//   useMaterial3: true,
//   colorScheme:
//       ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 21, 162, 194)),
// );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
