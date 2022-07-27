import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:task_crud/utils/utils.dart';
import 'package:task_crud/view/home_screen.dart';

import 'models/cat_facts/cat_facts_object.dart';

Future<void> main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(CatsFactsObjectAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Utils.getProviders(),
      child: const MaterialApp(
          debugShowCheckedModeBanner: kDebugMode, home: HomeScreen()),
    );
  }
}
