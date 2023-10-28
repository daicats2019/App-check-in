import 'package:hive_flutter/hive_flutter.dart';

part 'timeData.g.dart';

@HiveType(typeId: 1)
class timaData  extends HiveObject{
  @HiveField(0)
  DateTime dateTime;


  timaData({
    required this.dateTime,

  });
}
