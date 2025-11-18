import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  
 final usernameController = TextEditingController();
 final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Padding(padding: EdgeInsets.all(16.0),
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
            onPressed: () {
              // Handle login logic here
            },
            child: Text('Login'),
          ),
        ],
      ),
      ),
      
    );
  }
  
  
}