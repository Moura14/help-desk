import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import 'package:help_desk/features/login/data/datasource/login_datasource.dart';
import 'package:help_desk/features/login/data/repositories/login_respositores_data.dart';
import 'package:help_desk/features/login/domain/usecase/login_usecase.dart';
import 'package:help_desk/features/login/presentation/bloc/login_bloc.dart';
import 'package:help_desk/features/login/presentation/bloc/register_bloc.dart';
import 'package:help_desk/features/login/presentation/pages/login_page.dart';
import 'package:help_desk/features/ticket/data/datasource/ticket_datasource.dart';
import 'package:help_desk/features/ticket/data/repositories/ticket_repositorie.dart';
import 'package:help_desk/features/ticket/domain/usecase/ticket_usecase.dart';
import 'package:help_desk/features/ticket/presentation/bloc/ticket_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = Dio();

    // Datasource
    final loginDatasource = LoginDataSourceImpl(dio: dio);

    // Repositório
    final loginRepository = LoginRepositoriesDataImpl(
      loginDatasource: loginDatasource,
    );

    // Usecase (único para login e registro)
    final loginUsecase = LoginUsecase(
      loginRepositorieDomain: loginRepository,
    );

    final ticketDdatasource = TicketDataSourceImpl(dio: dio);

    final ticketRepository = TicketRepositoriesDataImpl(ticketDatasource: ticketDdatasource);

    final ticketUsecase = TicketUsecase(ticketRepositorieDomain:ticketRepository );

    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(loginUseCase: loginUsecase),
        ),
        BlocProvider<RegisterBloc>(
          create: (context) => RegisterBloc(loginUsecase),
        ),

        BlocProvider<TicketBloc>(create: (context) => TicketBloc(ticketUsecase))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const LoginPage(),
      ),
    );
  }
}
