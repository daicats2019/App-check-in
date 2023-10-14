class userModel {
      final String? id;
      final String? email;
      final String? password;
      final bool? checkin;
      final String? timeIn;
      final String? timeOut;

      userModel({ this.id,this.email, this.password, this.checkin, this.timeIn, this.timeOut});

      Map<String, dynamic> toJson() => {
            'id':id,
            'email': email,
            'password': password,
            'checkin': checkin,
            'timeIn': timeIn,
            'timeOut': timeOut,
      };

      static userModel fromJson(Map<String,dynamic> json) => userModel(
            id: json['id'],
            email: json['email'],
            password: json['password'],
            checkin: json['checkin'],
            timeIn: json['timeIn'],
            timeOut: json['timeOut'],
      );
}

List<userModel> mockData = [
      userModel(email: 'viet1@gmail.com', password: 'viet123456', checkin: true, timeIn:'08:00 AM', timeOut: '05:00 PM'),
      userModel(email: 'viet12@gmail.com', password: 'viet123456',checkin: false, timeIn:'07:00 AM', timeOut: '04:00 PM'),
      userModel(email: 'viet13@gmail.com', password: 'viet123456',checkin: false, timeIn:'09:00 AM', timeOut: '06:00 PM'),

];