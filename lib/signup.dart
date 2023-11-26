import 'dart:convert';

import 'package:ceyloneguide/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  // final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String _selectedRole = 'Traveler'; // Default value
  String? _confirmPasswordError; // Store confirmation password error message
  bool? regStatus;
  void _handleRegistration(context) async {
    const baseUrl = "http://localhost:2000/";
    if (_formKey.currentState!.validate()) {
      final Map<String, dynamic> data = {
        "uemail": _emailController.text,
        "upass": _passwordController.text,
        "utype": _selectedRole,
      };

      var url = Uri.parse("${baseUrl}Signup");
      try {
        final res = await http.post(url, body: data);
        print(res.body);
        if (res.statusCode == 200) {
          var data = jsonDecode(res.body.toString());
          print(data);
          _showSuccessDialog(context);
        } else {
          print("Fail:  ${res.statusCode} : ${res.body}");
          _showErrorDialog(context);
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Registration Successful'),
          content: Text('Your registration was successful! Please login'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Something went wrong'),
          content: Text('Please try again'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 69, 214, 207),
        title: const Text(
          "SIGN UP",
          style: TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 84, 247, 250),
              Color.fromARGB(255, 170, 248, 225),
            ],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            stops: [0.4, 0.7],
            tileMode: TileMode.repeated,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset('assets/signup.png'),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email address.';
                    }
                    if (!RegExp(r'^[\w-\.]+@[\w-\.]+\.[a-z]{2,}$')
                        .hasMatch(value)) {
                      return 'Please enter a valid email address.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password.';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters long.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _confirmPasswordController,
                  decoration: const InputDecoration(
                    labelText: 'Confirm Password',
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value != _passwordController.text) {
                      _confirmPasswordError = 'Passwords do not match.';
                    } else {
                      _confirmPasswordError = null;
                    }
                    return null;
                  },
                ),
                if (_confirmPasswordError != null)
                  Text(
                    _confirmPasswordError!,
                    style: TextStyle(color: Colors.red),
                  ),
                DropdownButtonFormField<String>(
                  value: _selectedRole,
                  items: const [
                    DropdownMenuItem(
                        child: Text('Traveler'), value: 'Traveler'),
                    DropdownMenuItem(
                        child: Text('Equipment Supplier'),
                        value: 'Equipment Supplier'),
                    DropdownMenuItem(child: Text('Guide'), value: 'Guide'),
                    DropdownMenuItem(
                        child: Text('Taxi Driver'), value: 'Taxi Driver'),
                    DropdownMenuItem(
                        child: Text('Hotel Manager'), value: 'Hotel Manager'),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedRole = value!;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    _handleRegistration(context);
                  },
                  child: Text("create"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
