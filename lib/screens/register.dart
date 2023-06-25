import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameTextEditingController = TextEditingController();
  final emailTextEditingController = TextEditingController();
  final phoneTextEditingController = TextEditingController();
  final addressTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final confirmTextEditingController = TextEditingController();

  bool _passwordVisible = false;

  //Declare a GlobalKey
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool darkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            Column(
              children: [
                Image.asset(darkTheme
                    ? "assets/images/city_dark.jpeg"
                    : "assets/images/city_dark.jpeg"),
                const SizedBox(height: 20),
                Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.amber.shade400,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Form(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextFormField(
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(50)
                              ],
                              decoration: InputDecoration(
                                hintText: 'Name',
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                ),
                                filled: true,
                                fillColor: Colors.black45,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: const BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.amber.shade400,
                                ),
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Name can't be empty";
                                }
                                if (value.length < 2) {
                                  return "Please enter a valid name";
                                }
                                if (value.length > 49) {
                                  return "Please name can't be more than 50";
                                }
                                return null;
                              },
                              onChanged: (value) => setState(() {
                                nameTextEditingController.text = value;
                              }),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(50)
                              ],
                              decoration: InputDecoration(
                                hintText: 'Email',
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                ),
                                filled: true,
                                fillColor: Colors.black45,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: const BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.amber.shade400,
                                ),
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Email can't be empty";
                                }
                                if (value.length < 2 ||
                                    EmailValidator.validate(value) == false) {
                                  return "Please enter a valid email";
                                }
                                if (value.length > 49) {
                                  return "Please email can't be more than 50";
                                }
                                return null;
                              },
                              onChanged: (value) => setState(() {
                                emailTextEditingController.text = value;
                              }),
                            ),
                            const SizedBox(height: 10),
                            IntlPhoneField(
                              showCountryFlag: false,
                              dropdownIcon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.amber.shade400,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Phone',
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                ),
                                filled: true,
                                fillColor: Colors.black45,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: const BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                              ),
                              initialCountryCode: 'CM',
                              disableLengthCheck: true,
                              onChanged: (value) => setState(() {
                                phoneTextEditingController.text =
                                    value.completeNumber;
                              }),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(50)
                              ],
                              decoration: InputDecoration(
                                hintText: 'Address',
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                ),
                                filled: true,
                                fillColor: Colors.black45,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: const BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.map,
                                  color: Colors.amber.shade400,
                                ),
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Address can't be empty";
                                }
                                if (value.length < 2) {
                                  return "Please enter a valid address";
                                }
                                if (value.length > 49) {
                                  return "Please address can't be more than 50";
                                }
                                return null;
                              },
                              onChanged: (value) => setState(() {
                                addressTextEditingController.text = value;
                              }),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              obscureText: !_passwordVisible,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(50)
                              ],
                              decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                ),
                                filled: true,
                                fillColor: Colors.black45,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: const BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.amber.shade400,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.amber.shade400,
                                  ),
                                  onPressed: () {
                                    //update the state i.e toggle the state of passwordVisibility value
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                ),
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Password can't be empty";
                                }
                                if (value.length < 6) {
                                  return "Please enter a valid password";
                                }
                                if (value.length > 49) {
                                  return "Please password can't be more than 50";
                                }
                                return null;
                              },
                              onChanged: (value) => setState(() {
                                passwordTextEditingController.text = value;
                              }),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              obscureText: true,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(50)
                              ],
                              decoration: InputDecoration(
                                hintText: 'Confirm',
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                ),
                                filled: true,
                                fillColor: Colors.black45,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: const BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: Colors.amber.shade400,
                                ),
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Password can't be empty";
                                }
                                if (value.length < 6) {
                                  return "Please enter a valid password";
                                }
                                if (value !=
                                    passwordTextEditingController.text) {
                                  return "Password do not match !";
                                }
                                if (value.length > 49) {
                                  return "Please password can't be more than 50";
                                }
                                return null;
                              },
                              onChanged: (value) => setState(() {
                                confirmTextEditingController.text = value;
                              }),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  backgroundColor: Colors.amber.shade400,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  minimumSize: const Size(double.infinity, 50)),
                              child: const Text(
                                "Register",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              onPressed: () {},
                            ),
                            const SizedBox(height: 20),
                            GestureDetector(
                              child: Text(
                                "Forgot password ?",
                                style: TextStyle(color: Colors.amber.shade400),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
