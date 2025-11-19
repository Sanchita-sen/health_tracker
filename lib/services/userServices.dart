class UserService {
  final Map<String, String> _users = {};

  Future<Map<String, String>?> getUserByUsername(String username) async {
    if (_users.containsKey(username)) {
      return {'username': username, 'password': _users[username]!};
    }
    return null;
  }

  Future<void> createUser(String username, String password, String email) async {
    final existing = await getUserByUsername(username);
    if (existing != null) {
      throw Exception('Username already exists');
    }

    // final newUser = {
    //   'username': username,
    //   'password': password,
    //   'email': email,
    // };
    // Here you would typically send this data to your backend or database
    await Future.delayed(Duration(seconds: 1));
    _users[username] = password; // Storing user in a mock database
  }
}