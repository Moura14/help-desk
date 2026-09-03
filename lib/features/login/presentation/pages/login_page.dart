
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_desk/features/login/presentation/bloc/login_bloc.dart';
import 'package:help_desk/features/login/presentation/bloc/login_event.dart';
import 'package:help_desk/features/login/presentation/bloc/login_state.dart';
import 'package:help_desk/features/login/presentation/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  final emailController = TextEditingController();
  final senhaController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }else if(state is LoginSuccess){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Login bem-sucedido!'),
                backgroundColor: Colors.green,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is LoginLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Header
                  const SizedBox(height: 40),
                  Icon(
                    Icons.lock_outline,
                    size: 80,
                    color: Colors.blue,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Bem-vindo de volta',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Faça login para continuar',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
        
                 
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Digite seu e-mail',
                      prefixIcon: const Icon(Icons.email_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.grey[50],
                    ),
                  ),
                  const SizedBox(height: 16),
        
                 
                  TextFormField(
                    controller: senhaController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      hintText: 'Digite sua senha',
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.visibility_off),
                        onPressed: () {},
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.grey[50],
                    ),
                  ),
                  const SizedBox(height: 8),
        
               
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text('Esqueceu a senha?'),
                    ),
                  ),
                  const SizedBox(height: 24),
        
                  
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<LoginBloc>().add(LoginButtonPressed(email: emailController.text, senha: senhaController.text));
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text(
                        'Entrar',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
        
                
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Não tem uma conta?',
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                              return RegisterPage();
                          }));
                        },
                        child: const Text(
                          'Cadastre-se',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
  })
    );
  }
}