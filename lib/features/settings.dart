import 'package:flutter/material.dart';

class settings extends StatefulWidget {
  const settings({Key? key}) : super(key: key);

  @override
  _settingsState createState() => _settingsState();
}
class _settingsState extends State<settings> {
  bool _notificationsEnabled = true;
  String _theme = 'Light';

  void _toggleNotifications(bool value) {
    setState(() {
      _notificationsEnabled = value;
    });
  }

  void _changeTheme(String? value) {
    setState(() {
      if (value != null) {
        _theme = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SwitchListTile(
              title: Text('Enable Notifications'),
              value: _notificationsEnabled,
              onChanged: _toggleNotifications,
            ),
            SizedBox(height: 20),
            Text('Select Theme:', style: TextStyle(fontSize: 16)),
            DropdownButton<String>(
              value: _theme,
              items: ['Light', 'Dark', 'System Default']
                  .map((theme) => DropdownMenuItem(
                        value: theme,
                        child: Text(theme),
                      ))
                  .toList(),
              onChanged: _changeTheme,
            ),
          ],
        ),
      ),
    );
  }
}