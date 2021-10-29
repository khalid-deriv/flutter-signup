import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _firstName = "";
  String _lastName = "";
  String _email = "";
  String _password = "";
  String _confirmedPassword = "";
  String _gender = "Male";
  final List<String> _genders = ["Male", "Female", "Other"];
  bool _agreedToTOS = true;

  bool _submittable() {
    return _agreedToTOS &&
        _firstName != "" &&
        _lastName != "" &&
        _email != "" &&
        _password != "" &&
        _confirmedPassword != "";
  }

  void _submit() {
    _formKey.currentState?.validate();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Account created successfully!'),
        duration: Duration(seconds: 2)));
  }

  void _setAgreedToTOS(bool? newValue) {
    setState(() {
      _agreedToTOS = newValue ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: ListView(padding: const EdgeInsets.all(40), children: <Widget>[
            Container(
              child: const Text("Sign up",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF42A5F5)),
                  textAlign: TextAlign.center),
              width: double.infinity,
            ),
            const Image(
              image: const NetworkImage("https://i.imgur.com/654JtfO.png"),
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "First name",
                    ),
                    validator: (String? value) {
                      if (value != null) {
                        if (value.trim().isEmpty)
                          return "First name is required";
                      }
                    },
                    onChanged: (val) {
                      setState(() {
                        _firstName = val;
                      });
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Last name",
                    ),
                    validator: (String? value) {
                      if (value != null) {
                        if (value.trim().isEmpty)
                          return "Last name is required";
                      }
                    },
                    onChanged: (val) {
                      setState(() {
                        _lastName = val;
                      });
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Email",
                    ),
                    validator: (String? value) {
                      if (value != null) {
                        if (value.trim().isEmpty) return "Email is required";
                      }
                    },
                    onChanged: (val) {
                      setState(() {
                        _email = val;
                      });
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Password",
                    ),
                    validator: (String? value) {
                      if (value != null) {
                        if (value.trim().isEmpty) return "Password is required";
                      }
                    },
                    onChanged: (val) {
                      setState(() {
                        _password = val;
                      });
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Confirm password",
                    ),
                    validator: (String? value) {
                      if (value != null) {
                        if (value.trim().isEmpty)
                          return "Please confirm your password";
                      }
                    },
                    onChanged: (val) {
                      setState(() {
                        _confirmedPassword = val;
                      });
                    },
                  ),
                  DropdownButton<String>(
                    value: _gender,
                    items: _genders
                        .map((val) => DropdownMenuItem<String>(
                              child: Text(val),
                              value: val,
                            ))
                        .toList(),
                    onChanged: (String? value) {
                      setState(() {
                        _gender = value ?? "";
                      });
                    },
                    hint: Text("Gender"),
                    isExpanded: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      children: <Widget>[
                        Checkbox(
                          value: _agreedToTOS,
                          onChanged: _setAgreedToTOS,
                        ),
                        GestureDetector(
                          onTap: () => _setAgreedToTOS(!_agreedToTOS),
                          child: const Text(
                            'I agree',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(150, 30)),
                        onPressed: _submittable() ? _submit : null,
                        child: const Text('Sign Up'),
                      ))
                ],
              ),
            )
          ]),
        ));
  }
}
