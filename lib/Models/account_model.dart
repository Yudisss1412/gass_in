class AccountsModel {
  String id;
  String name;
  String email;
  String password;
  AccountsModel({
    this.id = '',
    required this.name,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {"id": id, "nama": name, "email": email, "password": password,};

  static AccountsModel fromJson(Map<String, dynamic> json) => AccountsModel(id: json["id"], name: json["nama"], email: json["email"], password: json["password"]);
}
