class ActivityModelToday{

  String? status;
  bool is_check_in;
  String? reason;

  ActivityModelToday({this.status,required this.is_check_in,this.reason});


  Map<String, dynamic> toJson() =>{
    'status':status,
    'is_check_in':is_check_in,
    'reason':reason
  };

  static ActivityModelToday fromJson(Map<String, dynamic> json) => ActivityModelToday(
    status: json['status'],
    is_check_in: json['is_check_in'],
    reason: json['reason']
  );
}