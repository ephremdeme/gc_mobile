class User {
  final int id;
  final String username;
  final String phone;
  final String password;
  
  User({
    this.id,
    this.username,
    this.password,
    this.phone
  });

  factory User.fromJson(Map<String, dynamic> data) {
    return User(
      id: data['id'],
      username: data['username'],
      phone: data['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "username": username,
      "phone": phone,
      "password": password
    };
  }
}
