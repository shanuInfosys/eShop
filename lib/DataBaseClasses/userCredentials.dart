class UserCredentials {
  late String username, password, type;
  UserCredentials(
      {required this.username, required this.password, required this.type});

  UserCredentials.fromMap(Map<String, dynamic> result)
      : username = result['username'],
        password = result['password'],
        type = result['type'];

  Map<String, Object?> toMap() {
    return {'username': username, 'password': password, 'type': type};
  }
}
