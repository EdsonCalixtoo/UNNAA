class ClientModel {
  String id;
  String fullName;
  String email;
  String password;

  ClientModel({this.id, this.fullName, this.email, this.password});

  ClientModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
