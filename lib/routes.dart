import 'package:flutter/material.dart';
import 'package:help_desk/features/home/presentation/pages/home_page.dart';
import 'package:help_desk/features/login/presentation/pages/login_page.dart';
import 'package:help_desk/features/login/presentation/pages/register_page.dart';
import 'package:help_desk/features/ticket/presentation/pages/abrir_ticket.dart';

class Routes {
  

  static const String initial = '/home';
  static const String login = '/login';
  static const String register = '/register';
  static const String ticket = '/ticket';


  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(builder: (_) =>  LoginPage());
      case Routes.initial:
        return MaterialPageRoute(builder: (_) =>  HomePage());
      case Routes.register:
        return MaterialPageRoute(builder: (_) =>  RegisterPage());
      case Routes.ticket:
        return MaterialPageRoute(builder: (_) =>  AbrirTicketPage());
      
      default:
        return null;
    }
  }
}