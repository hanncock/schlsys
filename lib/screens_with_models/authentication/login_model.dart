class User{
  final String id;
  final String fName;
  final String sName;
  final String idNo;
  final String email;
  final String phoneNum;

  User({
    required this.id,
    required this.fName,
    required this.sName,
    required this.idNo,
    required this.email,
    required this.phoneNum
  });

  // Map<String, dynamic>toJson(){
  //   final Map<String, dynamic> user = Map<String, dynamic>();
  //   user['id'] = id;
  //   user['fName:'] = fName;
  //   user['sName:'] = sName;
  //   user['idNo:'] = idNo;
  //   user['email:'] = email;
  //   user['phoneNum:'] = phoneNum;
  //   return user;
  // }

  factory User.fromJson(Map<dynamic, dynamic>json){
    return User(
        id: json['id'],
        fName: json['fName'],
        sName: json['sName'],
        idNo: json['id'],
        email: json['email'],
        phoneNum: json['phoneNum']
    );
  }

  // User.fromJson(Map json){
  //
  // }

  // var ci = new User.fromJson(myJson);

}