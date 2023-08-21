class UserModel{
  late String? id,email,password,name, phone;

  UserModel({this.email,this.name,this.password,this.id, this.phone});

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      id: json['_id'],
      email: json['email'],
      password: json['password'],
      name: json['name'],
      phone: json['phone']
    );
  }
}