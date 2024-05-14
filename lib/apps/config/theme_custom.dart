import 'package:flutter/material.dart';

// nếu mở rộng thì có thể làm 2 chế độ dark , light
class TheCustom {
  static ThemeData themeLight = ThemeData.light().copyWith(
      scaffoldBackgroundColor: Colors.transparent,
      // tạo hẳn 1 file này sau nếu cần chỉnh thì sẽ chỉnh cả app luôn
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      textTheme: const TextTheme());
}
