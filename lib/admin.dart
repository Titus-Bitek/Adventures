import 'package:flutter/material.dart';

class AdminPanelScreen extends StatefulWidget {
  @override
  _AdminPanelScreenState createState() => _AdminPanelScreenState();
}

class _AdminPanelScreenState extends State<AdminPanelScreen> {
  bool isFeatureEnabled = false;
  bool isAdminLoggedIn = false;
  String adminUsername = 'admin';
  String adminPassword = 'admin123';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Panel'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isAdminLoggedIn)
              Column(
                children: [
                  Text(
                    ' With Great Honor Welcome, Admin!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Perform admin action, such as sending notifications
                      // or performing data management tasks
                      _performAdminAction();
                    },
                    child: Text('Perform Admin Action'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isAdminLoggedIn = false;
                      });
                    },
                    child: Text('Log Out'),
                  ),
                ],
              )
            else
              Column(
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Username'),
                    onChanged: (value) {
                      adminUsername = value;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Password'),
                    onChanged: (value) {
                      adminPassword = value;
                    },
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _loginAsAdmin();
                    },
                    child: Text('Log In as Admin'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  void _loginAsAdmin() {
    // Simulate admin login with a hardcoded username and password
    if (adminUsername == 'admin' && adminPassword == 'admin123') {
      setState(() {
        isAdminLoggedIn = true;
      });
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Login Failed'),
            content: Text('Invalid username or password.'),
            actions: [
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
  }

  void _performAdminAction() {
    // Add your admin-specific logic here
    // For example, sending notifications, managing data, etc.
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Admin Action'),
          content: Text('Admin action has been performed.'),
          actions: [
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
}
