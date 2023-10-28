

import 'package:hive/hive.dart';

import '../model/timeData.dart';

class AppDataBase{

  // Save Server area
  Future<Box<timaData>> openTimeDataBox() async {
    print('OKOKOK4 openTimeDataBox');
    return await Hive.openBox<timaData>('server_history');

  }

  Future<void> saveTime(timaData testResult) async {
    print('OKOKOK5 SaveServer');
    final historyBox = await openTimeDataBox();
    await historyBox.add(testResult);
  }
  Future<List<timaData>> getTime() async {
    print('OKOKOK6 GetServer');
    final historyBox = await openTimeDataBox();
    return historyBox.values.toList();
  }
  Future<void> deleteAllTime() async {
    final historyBox = await openTimeDataBox();
    await historyBox.clear();
  }

  Future<void> deleteTimeAtIndex(int index) async {
    final historyBox = await openTimeDataBox();
    await historyBox.deleteAt(index);
  }
}