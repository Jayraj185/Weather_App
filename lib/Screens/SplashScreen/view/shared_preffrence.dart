import 'package:shared_preferences/shared_preferences.dart';

void CreateData(bool start)async
{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setBool("start", start);
}
Future<bool?> ReadData()async
{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getBool("start");
}