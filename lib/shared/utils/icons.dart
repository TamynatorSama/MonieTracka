class CustomIcons {
  static String logo = 'logo'.isvg();
  static String eyeSlash = "eye-slash".isvg();
  static String eyeOpen = "eye".isvg();
  static String home = "home".isvg();
  static String budget = "list".isvg();
  static String savings = "piggybank".isvg();
  static String payments = "payments".isvg();
  static String profile = "profile".isvg();
  static String notification = "notification".isvg();
  static String add = "add".isvg();
  static String send = "send".isvg();
  static String phone = "phone".isvg();
  static String data = "data".isvg();
  static String bills = "bills".isvg();
  static String electricity = "electricity".isvg();
  static String tv = "tv".isvg();
  static String cards = "card".isvg();
  static String cashBack = "cash-back".isvg();
  static String groupBudget = "budget".isvg();
  static String contribution = "contrib".isvg();
  static String more = "more".isvg();
  static String filledCircle = "filled-add".isvg();
  static String downArrow = "down".isvg();
}

extension on String {
  String isvg() => 'assets/icons/$this.svg';
}
