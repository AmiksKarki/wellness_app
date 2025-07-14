import 'package:flutter/material.dart';
import 'package:my_wellness_app/core/route_config/route_name.dart';
import 'package:my_wellness_app/screens/dashboard_screen.dart';
import 'package:my_wellness_app/screens/login_screen.dart';
import 'package:my_wellness_app/screens/signup_screen.dart';
import 'package:my_wellness_app/screens/forgot_password_screen.dart';
import 'package:my_wellness_app/screens/change_password_screen.dart';
import 'package:my_wellness_app/screens/profile_screen_new.dart';
import 'package:my_wellness_app/screens/products/product_screen.dart';
import 'package:my_wellness_app/screens/admin_dashboard_screen.dart';
import 'package:my_wellness_app/screens/add_category_screen.dart';
import 'package:my_wellness_app/screens/add_quote_screen.dart';
import 'package:my_wellness_app/screens/add_health_tip_screen.dart';
import 'package:my_wellness_app/screens/auth_wrapper.dart';
import 'package:my_wellness_app/screens/user_preference_screen.dart';
import 'package:my_wellness_app/screens/content_preferences_screen.dart';


class RouteConfig{

  RouteConfig._();
  static Route<dynamic> generateRoute(RouteSettings settings) {

    final String? screenName = settings.name;
    switch(screenName){
      case RoutesName.dashboardScreen:
      return MaterialPageRoute(
          builder: (_)=>
              DashboardScreen(),
      );
      case RoutesName.loginScreen:
        return MaterialPageRoute(builder: (_)=>
            LoginScreen()
        );
      case RoutesName.signUpScreen:
        return MaterialPageRoute(builder: (_)=>
            SignUpScreen()
        );
      case RoutesName.forgotPasswordScreen:
        return MaterialPageRoute(builder: (_)=>
            ForgotPasswordScreen()
        );
      case RoutesName.changePasswordScreen:
        return MaterialPageRoute(builder: (_)=>
            ChangePasswordScreen()
        );
      case RoutesName.profileScreen:
        return MaterialPageRoute(builder: (_)=>
            ProfileScreen()
        );
      case RoutesName.productScreen:
        return MaterialPageRoute(builder: (_)=>
            ProductScreen()
        );
      case RoutesName.adminDashboardScreen:
        return MaterialPageRoute(builder: (_)=>
            AdminDashboardScreen()
        );
      case RoutesName.addCategoryScreen:
        return MaterialPageRoute(builder: (_)=>
            AddCategoryScreen()
        );
      case RoutesName.addQuoteScreen:
        return MaterialPageRoute(builder: (_)=>
            AddQuoteScreen()
        );
      case RoutesName.addHealthTipScreen:
        return MaterialPageRoute(builder: (_)=>
            AddHealthTipScreen()
        );
      case RoutesName.userPreferenceScreen:
        return MaterialPageRoute(builder: (_)=>
            UserPreferenceScreen()
        );
      case RoutesName.contentPreferencesScreen:
        return MaterialPageRoute(builder: (_)=>
            ContentPreferencesScreen()
        );
      case RoutesName.defaultScreen:
      default:
        return MaterialPageRoute(builder: (_)=> AuthWrapper());


    }

  }
}