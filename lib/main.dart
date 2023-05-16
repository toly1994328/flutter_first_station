import 'package:flutter/material.dart';

import 'counter/counter_page.dart';
import 'guess/guess_page.dart';
import 'muyu/muyu_page.dart';
import 'navigation/app_navigation.dart';
import 'paper/paper.dart';
import 'storage/db_storage/db_storage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DbStorage.instance.open();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AppNavigation(),
    );
  }
}

