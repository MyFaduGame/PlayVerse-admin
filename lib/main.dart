import 'package:flutter/material.dart';
import 'package:playverseadmin/app/providers/auth_provider.dart';
import 'package:playverseadmin/app/screens/auth_screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PlayVerse',
        theme: ThemeData(
          useMaterial3: false,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
