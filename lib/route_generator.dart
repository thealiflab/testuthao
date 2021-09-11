import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/book_taxi/location_information/where_to/where_to_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/book_taxi/ongoing_trip/ratting/ratting_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/common/location_from_map/location_from_map_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/free_rides/free_rides_how_work_details_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/help_support/contact_us/contact_us_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/help_support/feedback/feedback_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/help_support/help_support_questions/help_support_questions_ans_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/help_support/help_support_questions/help_support_questions_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/home_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/loyalty_program/loyalty_program_details_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/payment/add_payment_method/add_payment_method_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/payment/apple_pay/apple_pay_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/payment/cash/cash_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/payment/credit_card/credit_card_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/payment/gpay/g_pay_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/profile/change_password_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/settings/fav_driver/fav_driver_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/loginsignup/login/login_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/loginsignup/reset_password/forgot/forgot_password_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/loginsignup/reset_password/otp/otp_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/loginsignup/reset_password/reset/reset_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/loginsignup/signup/signup_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/onboard/onboard_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case OnBoardScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => OnBoardScreen(),
        );

      case LoginScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );

      case ForgotPasswordScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => ForgotPasswordScreen(),
        );

      case OTPScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => OTPScreen(),
        );

      case ResetPassScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => ResetPassScreen(),
        );

      /*case HomeScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );*/

      case HomeScreen.routeName:
        return PageRouteBuilder(
            pageBuilder: (context, animation, Animation secondaryAnimation) =>
                HomeScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return ScaleTransition(
                scale: Tween<double>(
                  begin: 0.0,
                  end: 1.0,
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: Curves.fastOutSlowIn,
                  ),
                ),
                child: child,
              );
            });

      case LoyaltyProgramDetailsScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => LoyaltyProgramDetailsScreen(),
        );

      case FreeRidesHowWorkDetailsScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => FreeRidesHowWorkDetailsScreen(),
        );

      case CashScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => CashScreen(),
        );

      case CreditCardScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => CreditCardScreen(),
        );

      case CreditCardScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => CreditCardScreen(),
        );

      case ApplePayScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => ApplePayScreen(),
        );

      case GPayScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => GPayScreen(),
        );

      case AddPaymentMethodScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => AddPaymentMethodScreen(),
        );

      case SignupScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => SignupScreen(),
        );

      case FavDriverScreen.routeName:
        return CupertinoPageRoute(
          builder: (_) => FavDriverScreen(),
        );

      case ContactUsScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => ContactUsScreen(),
        );

      case FeedBackScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => FeedBackScreen(),
        );

      case HelpSupportQuestionsScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => HelpSupportQuestionsScreen(),
        );

      // If args is not of the correct type, return an error page.
      // You can also throw an exception while in development.

      case HelpSupportQuestionAnswerScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => HelpSupportQuestionAnswerScreen(),
        );

      case ChangePasswordScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => ChangePasswordScreen(),
        );

        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        return _errorRoute();

      case LocationFromMapScreen.routeName:
        // Validation of correct data type
        if (args is LocationFromMapScreenArguments) {
          return MaterialPageRoute(
            builder: (_) => LocationFromMapScreen(
              arguments: args,
            ),
          );
        }
        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        return _errorRoute();

      case WhereToScreen.routeName:
        // Validation of correct data type
        if (args is WhereToScreenArguments) {
          return MaterialPageRoute(
            builder: (_) => WhereToScreen(
              arguments: args,
            ),
          );
        }
        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        return _errorRoute();

        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        return _errorRoute();
      case RattingScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => RattingScreen(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Error'),
          ),
          body: Center(
            child: Text('ERROR'),
          ),
        ),
      );
    });
  }
}
