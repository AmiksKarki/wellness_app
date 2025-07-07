import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/user_preference_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/quotes_detail_screen.dart';

void main() {
  runApp(const WellnessApp());
}

class WellnessApp extends StatelessWidget {
  const WellnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Wellness App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Poppins',
            scaffoldBackgroundColor: Colors.black,
            colorScheme: const ColorScheme.dark(secondary: Color(0xFF262626)),
            iconButtonTheme: IconButtonThemeData(
              style: ButtonStyle(
                iconColor: WidgetStateProperty.all(Colors.white),
              ),
            ),
            iconTheme: const IconThemeData(color: Colors.white),
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.black,
              titleTextStyle: TextStyle(fontSize: 20, color: Colors.white),
            ),
            bottomSheetTheme: const BottomSheetThemeData(
              backgroundColor: Colors.black,
              elevation: 3,
            ),
            inputDecorationTheme: const InputDecorationTheme(
              filled: true,
              fillColor: Color(0xFF1E1E1E),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              hintStyle: TextStyle(color: Colors.grey),
            ),
            timePickerTheme: TimePickerThemeData(
              backgroundColor: const Color(0xFF1E1E1E),
              hourMinuteTextColor: const Color(0xFF1E1E1E),
              hourMinuteColor: Colors.grey,
              dayPeriodTextColor: Colors.white70,
              dialBackgroundColor: Colors.black,
              dialHandColor: Colors.white,
              dialTextColor: Colors.white,
              entryModeIconColor: Colors.white,
              helpTextStyle: const TextStyle(color: Colors.white),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(24)),
              ),
            ),
            textTheme: const TextTheme(
              bodyMedium: TextStyle(color: Colors.white),
            ),
            hoverColor: Colors.transparent,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => const LoginScreen(),
            '/signup': (context) => const SignUpScreen(),
            '/preferences': (context) => const UserPreferenceScreen(),
            '/dashboard': (context) => const DashboardScreen(),
            '/profile': (context) => const ProfileScreen(),
            '/quotes': (context) => const QuotesDetailScreen(),
          },
        );
      },
    );
  }
}