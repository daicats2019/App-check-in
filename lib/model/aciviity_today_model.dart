class ActivityModelToday {
  String? status;
  String? checked_in_atstatus;
  String? late_reason;
  String? early_reason;
  String? checked_in_at;
  String? checked_out_at;
  bool? is_check_in_late;
  bool? is_check_out_early;
  Office? office;

  ActivityModelToday(
      {this.status,
      this.early_reason,
      this.late_reason,
      this.is_check_in_late,
      this.is_check_out_early,
      this.checked_in_at,
      this.checked_out_at,
      this.office});

  Map<String, dynamic> toJson() => {
        'status': status,
        'early_reason': early_reason,
        'late_reason': late_reason,
        'is_check_in_late': is_check_in_late,
        'is_check_out_early': is_check_out_early,
        'checked_in_at': checked_in_at,
        'checked_out_at': checked_out_at,
        'Office': office?.toJson()
      };

  static ActivityModelToday fromJson(Map<String, dynamic> json) =>
      ActivityModelToday(
          status: json['status'],
          early_reason: json['early_reason'],
          late_reason: json['late_reason'],
          is_check_in_late: json['is_check_in_late'],
          is_check_out_early: json['is_check_out_early'],
          checked_in_at: json['checked_in_at'],
          checked_out_at: json['checked_out_at'],
          office: Office.fromJson(json['Office'])
      );
}

class Office {
  num? id;
  String? created_at;
  String? updated_at;
  String? name;
  double? longitude;
  double? latitude;
  String? start_working_time;
  String? end_working_time;
  num? be_late_after;
  num? be_early_before;

  Office(
      {this.id,
      this.created_at,
      this.updated_at,
      this.name,
      this.longitude,
      this.latitude,
      this.start_working_time,
      this.end_working_time,
      this.be_early_before,
      this.be_late_after});

  Map<String, dynamic> toJson() => {
        'id': id,
        'created_at': created_at,
        'updated_at': updated_at,
        'name': name,
        'longitude': longitude,
        'latitude': latitude,
        'start_working_time': start_working_time,
        'end_working_time': end_working_time,
        'be_early_before': be_early_before,
        'be_late_after': be_late_after
      };

  static Office fromJson(Map<String, dynamic> json) => Office(
      id: json['id'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
      name: json['name'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      start_working_time: json['start_working_time'],
      end_working_time: json['end_working_time'],
      be_early_before: json['be_early_before'],
      be_late_after: json['be_late_after']);
}
