import 'package:flutter/material.dart';
import 'package:health_tracker_app/auth/signup.dart';
import 'package:health_tracker_app/services/userServices.dart' show UserService;
import 'package:health_tracker_app/services/local_storage.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  
 final usernameController = TextEditingController();
 final passwordController = TextEditingController();
  final _userService = UserService();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Padding(padding: EdgeInsets.all(16.0),
      child: Center(
        child: SizedBox(
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  final username = usernameController.text.trim();
                  final password = passwordController.text;

                  if (username.isEmpty || password.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please enter username and password')),
                    );
                    return;
                  }

                  final user = await _userService.getUserByUsername(username);
                  if (user != null && user['password'] == password) {
                    // Save username locally (for now using SharedPreferences)
                    await LocalStorage.saveUser(username);
                    // Navigate to the Dashboard placeholder
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => Scaffold(
                        appBar: AppBar(title: Text('Dashboard')),
                        body: Center(child: Text('Welcome, $username')),
                      )),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Invalid credentials')),
                    );
                  }
                },
                child: Text('Login'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => SignupPage()),
                  );
                },
                child: Text('"Don’t have an account? Signup"'),
              ),
            ],
          ),
        ),
      ),
      ),
      
    );
  }
  
  
}