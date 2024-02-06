import 'package:e_ticket_ris/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_ticket_ris/src/config/color_constants.dart';
import 'package:e_ticket_ris/src/identity/auth_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> validationKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordVisibilityProvider = StateProvider<bool>((ref) => false);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool authIsLoading = ref.watch(authProvider).isLoading;
    void _submitLogin() async {
      bool loginSuccessful = await DatabaseHelper.instance
          .login(usernameController.text, passwordController.text);

      if (loginSuccessful) {
        // Navigate to the home page or dashboard

        SharedPreferences prefs = await SharedPreferences.getInstance();
        int userId = await prefs.getInt("userId") ?? -1;
        if (userId != -1) {
          String userRole =
              await DatabaseHelper.instance.getUserRoleById(userId);
          if (userRole == "admin") {
            Navigator.pushReplacementNamed(context, '/admindashboard');
            return null;
          }
        }
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        // Show an error message
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Neuspješna prijava. Pokušajte ponovo.')));
      }
    }

    void loginMock() {
      Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
    }

    return Scaffold(
        backgroundColor: hexToColor("#F5F5F5"),
        body: SingleChildScrollView(
          // Ensures the content is scrollable when keyboard is open or screen is small
          child: Form(
            key: validationKey,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    decoration: BoxDecoration(
                      color: hexToColor("#B4BCFF"),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                    ),
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceAround, // Adjust space distribution inside the column
                      crossAxisAlignment: CrossAxisAlignment
                          .center, // Center the children horizontally
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Image.asset(
                              'assets/buss_logo.png',
                              width: 120,
                              height: 120.0,
                              fit: BoxFit.fill,
                            )),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Prijavite se',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: TextFormField(
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        labelText: "Email",
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 182, 182, 182)),
                      ),
                      controller: usernameController,
                      autocorrect: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(context)!.required;
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                    child: Consumer(
                      builder: (context, ref, child) {
                        final isPasswordVisible =
                            ref.watch(passwordVisibilityProvider.state).state;
                        return TextFormField(
                          style: TextStyle(color: Colors.black),
                          obscureText: !isPasswordVisible,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            labelText: AppLocalizations.of(context)!.password,
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 182, 182, 182)),
                            suffixIcon: IconButton(
                              icon: Icon(
                                isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                ref
                                    .read(passwordVisibilityProvider.state)
                                    .state = !isPasswordVisible;
                              },
                            ),
                          ),
                          controller: passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.of(context)!.required;
                            }
                            return null;
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 100,
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF0C092E),
                          onPrimary: Colors.white,
                          side: BorderSide.none,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text(
                          "Prijavi se",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: _submitLogin),
                  ),
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFFB4BCFF),
                          onPrimary: Colors.white,
                          side: BorderSide.none,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text(
                          "Registruj se",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/register');
                        }),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
