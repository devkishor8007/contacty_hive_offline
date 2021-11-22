import 'dart:io';

import 'package:contact_flutter2021/model/contact_model.dart';
import 'package:contact_flutter2021/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(directory.path);
  Hive.registerAdapter<Contact>(ContactAdapter());
  Hive.registerAdapter<Relation>(RelationAdapter());
  await Hive.openBox<Contact>('makecontactapps');
  await Hive.openBox<bool>('darkmodetheme');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box>(
        valueListenable: Hive.box<bool>('darkmodetheme').listenable(),
        builder: (context, Box box, widget) {
          final bool isDark = box.get('isdark', defaultValue: false);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.indigo,
            ),
            themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
            darkTheme: ThemeData.dark(),
            home: const HomePage(),
          );
        });
  }
}

// https://www.science.co.il/language/Locale-codes.php
// flutter packages pub run build_runner build 
// flutter packages pub run build_runner build --delete-conflicting-outputs