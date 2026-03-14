import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'config/config_supabase.dart';
import 'pages/home_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  await SupabaseConfig.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Data Alat Musik',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(), // WAJIB ADA INI
    );
  }
}