import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static SharedPreferences? _prefs;

  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static setGoal(int goal) async {
    _prefs!.setInt("goal", goal);
  }

  static Future<int?> getGoal() async {
    // ignore: await_only_futures
    return await _prefs!.getInt("goal");
  }

  static setLastDrinkWaterDate(int dateAsMilliSeconds) {
    _prefs!.setInt("lastDrinkWaterDate", dateAsMilliSeconds);
  }

  static Future<int?> getLastDrinkWaterDate() async {
    // ignore: await_only_futures
    return await _prefs!.getInt("lastDrinkWaterDate") ?? 0;
  }

  static increaseTodayDrinks() async {
    int? currentTodayDrink = await getTodayDrinks();
    print(currentTodayDrink);
    _prefs!.setInt("todayDrinks", currentTodayDrink! + 1);
  }

  static resetTodayDrinks() async {
    _prefs!.setInt("todayDrinks", 0);
  }

  static Future<int?> getTodayDrinks() async {
    // ignore: await_only_futures
    return await _prefs!.getInt("todayDrinks") ?? 0;
  }

  static isGoalReached() async {
    int? todayDrinks = await getTodayDrinks();
    int? goal = await getGoal();
    if (todayDrinks != null && goal != null)
      return goal >= todayDrinks;
    else
      return false;
  }
}
