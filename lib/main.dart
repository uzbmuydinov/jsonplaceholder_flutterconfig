import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';

import 'package:get/get.dart';
import 'package:jsonplaceholder_flutterconfig/services/binding.dart';

import 'pages/create_page.dart';
import 'pages/home_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      initialBinding: ControllersBinding(),
      getPages: [
        GetPage(name: "/HomePage", page: () => const HomePage()),
        GetPage(name: "/CreatePage", page: () => const CreatePage())
      ],
    );
  }
}

