import 'package:flutter/material.dart';
import 'package:playverseadmin/app.dart';
import 'package:playverseadmin/app/screens/auth_screens/login_screen.dart';
import 'package:playverseadmin/app/theme/app_assets.dart';
import 'package:playverseadmin/app/utils/my_sharepreferences.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    MySharedPreferences.instance.getStringValue('access_token').then(
          (value) => value == null
              ? Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginScreen();
                    },
                  ),
                  (route) => false,
                )
              : Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const App();
                    },
                  ),
                  (route) => false,
                ),
        );
    // context.go(LoginScreen.route) :
    // context.go(App.route));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.grey,
          child: Image.asset(AppLogos.logo, height: 100),
        ),
      ),
    );
  }
}
