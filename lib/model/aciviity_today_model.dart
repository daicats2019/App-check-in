class ActivityModelToday {
  String? status;
  String? checked_in_atstatus;
  String? late_reason;
  String? early_reason;
  String? checked_in_at;
  String? checked_out_at;
  bool? is_check_in_late;
  bool? is_check_out_early;
  double? longitude;
  double? latitude;

  ActivityModelToday(
      {this.status,
      this.early_reason,
      this.late_reason,
      this.is_check_in_late,
      this.is_check_out_early,
      this.checked_in_at,
      this.checked_out_at,
      this.longitude,
      this.latitude
      });

  Map<String, dynamic> toJson() => {
        'status': status,
        'early_reason': early_reason,
        'late_reason': late_reason,
        'is_check_in_late': is_check_in_late,
        'is_check_out_early': is_check_out_early,
        'checked_in_at': checked_in_at,
        'checked_out_at': checked_out_at,
        'longitude': longitude,
        'latitude': latitude
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
          longitude: json['longitude'],
          latitude: json['latitude']
      );
}
