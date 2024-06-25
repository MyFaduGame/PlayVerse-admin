import 'package:flutter/material.dart';
import 'package:playverseadmin/app/providers/auth_provider.dart';
import 'package:playverseadmin/app/theme/theme_constans.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late AuthProvider provider;
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    provider = Provider.of<AuthProvider>(context, listen: false);
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            // height: screenHeight / 3,
            width: screenWidth > 600 ? screenWidth / 3 : screenWidth / 1.2,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5,
                  blurStyle: BlurStyle.outer,
                ),
              ],
              borderRadius: BorderRadius.circular(10),
              // border: Border.all(color: Colors.grey),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(
                    color: AppColors.appBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                hs(),
                hs(),
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Mobile Number',
                    style: TextStyle(
                      color: AppColors.appBlack,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                hs(),
                TextFormField(
                  onFieldSubmitted: (value) {
                    provider.login(phoneController.text).then((value) {
                      if (value) {
                        // Navigator.push(context, MaterialPageRoute(
                        //   builder: (context) {
                        //     return const OtpScreen();
                        //   },
                        // ));
                        // context.go(OtpScreen.route);
                      }
                    });
                  },
                  controller: phoneController,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your Mobile Number',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                    ),
                  ),
                ),
                hs(),
                hs(),
                SizedBox(
                  height: 40,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      provider
                          .login(
                        phoneController.text,
                      )
                          .then((value) {
                        if (value) {
                          // Navigator.push(context, MaterialPageRoute(
                          //   builder: (context) {
                          //     return const OtpScreen();
                          //   },
                          // ));
                        }
                      });
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      "Generate OTP",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
