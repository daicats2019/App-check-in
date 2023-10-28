class ActivityModelToday{

  String? status;

  ActivityModelToday({this.status});


  Map<String, dynamic> toJson() =>{
    'status':status,
  };

  static ActivityModelToday fromJson(Map<String, dynamic> json) => ActivityModelToday(
    status: json['status'],
  );
}