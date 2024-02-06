import 'package:e_ticket_ris/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:e_ticket_ris/src/config/color_constants.dart';
// Import other necessary packages

class RegisterScreen extends ConsumerWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> validationKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordVisibilityProvider = StateProvider<bool>((ref) => false);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void _registerUser() async {
      bool registerSuccess = await DatabaseHelper.instance.register(
        nameController.text,
        surnameController.text,
        emailController.text,
        passwordController.text,
      );

      if (registerSuccess) {
        // Registration successful
        Navigator.pushReplacementNamed(context, '/auth');
      } else {
        // Registration failed
        // Show an error message
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Neuspješna registracija. Pokušajte ponovo.')));
      }
    }

    return Scaffold(
      backgroundColor: hexToColor("#F5F5F5"),
      body: SingleChildScrollView(
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

                // Name field
                buildTextField(context, nameController, "Ime", false),

                // Surname field
                buildTextField(context, surnameController, "Prezime", false),

                // Phone field
                buildTextField(
                    context, phoneController, "Broj Telefona", false),

                // Email field
                buildTextField(context, emailController, "Email", false),

                // Password field
                Consumer(
                  builder: (context, ref, child) {
                    final isPasswordVisible =
                        ref.watch(passwordVisibilityProvider.state).state;
                    return buildTextField(
                        context,
                        passwordController,
                        AppLocalizations.of(context)!.password,
                        !isPasswordVisible,
                        suffixIcon: IconButton(
                          icon: Icon(
                            isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            ref.read(passwordVisibilityProvider.state).state =
                                !isPasswordVisible;
                          },
                        ));
                  },
                ),

                SizedBox(height: 20),

                // Register button
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 100, // Adjust height as needed
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFB4BCFF), // Button color
                      onPrimary: Colors.white, // Text color
                      side: BorderSide.none,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: _registerUser,
                    child: Text(
                      "Registruj se",
                      style: TextStyle(color: Colors.white, fontSize: 20),
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

  Widget buildTextField(BuildContext context, TextEditingController controller,
      String labelText, bool obscureText,
      {Widget? suffixIcon}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 15),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          labelText: labelText,
          labelStyle: TextStyle(color: Color.fromARGB(255, 182, 182, 182)),
          suffixIcon: suffixIcon,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Field cannot be empty'; // Replace with proper validation message
          }
          return null;
        },
      ),
    );
  }
}
