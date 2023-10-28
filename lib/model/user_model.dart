class UserModel {
  String? id;
  String? name;
  String? sex;
  String? address;
  String? phone;

  UserModel({this.id,this.name,this.sex,this.address,this.phone});

  Map<String, dynamic> toJson() =>{
    'id' : id,
    'name' : name,
    'sex' : sex,
    'address' : address,
    'phone' : phone,
  };

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'],
    name: json['name'],
    sex: json['sex'],
    address: json['address'],
    phone: json['phone'],
  );

}