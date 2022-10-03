class SignupScreenModel{

  int? userId;
  String? email;
  String? password;
  String? name;


  SignupScreenModel({this.userId,this.name,this.email, this.password});

  SignupScreenModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['user_id'] = userId;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}