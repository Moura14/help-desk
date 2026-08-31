import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import 'package:help_desk/features/login/data/datasource/login_datasource.dart';
import 'package:help_desk/features/login/data/repositories/login_respositores_data.dart';
import 'package:help_desk/features/login/domain/repositories/login_repositorie_domain.dart';
import 'package:help_desk/features/login/domain/usecase/login_usecase.dart';
import 'package:help_desk/features/login/presentation/bloc/login_bloc.dart';
import 'package:help_desk/features/login/presentation/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = Dio();

    // Criando o datasource com Dio
    final loginDatasource = LoginDataSourceImpl(dio: dio);

    // Criando o repositório com o datasource
    final loginRepository = LoginRepositoriesDataImpl(
      loginDatasource: loginDatasource,
    );

    // Criando o usecase com o repositório
    final loginUsecase = LoginUsecase(
      loginRepositorieDomain: loginRepository,
    );

    return BlocProvider(
      create: (context) => RegisterBloc(loginUsecase),
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
