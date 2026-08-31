// lib/features/auth/presentation/pages/register_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_desk/features/login/data/models/register_model.dart';
import 'package:help_desk/features/login/presentation/bloc/login_bloc.dart';
import 'package:help_desk/features/login/presentation/bloc/login_event.dart';
import 'package:help_desk/features/login/presentation/bloc/login_state.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final telefone = TextEditingController();
  final senha = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state){
          if(state is RegisterSuccess){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Usuário registrado: ${state.response.criado}'))
            );


          }else if(state is RegisterFailure){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Erro: ${state.message}'))
            );
          }
        },
        builder: (context, state){
          if(state is RegisterLoading){
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
                  const SizedBox(height: 20),
                  Icon(
                    Icons.person_add_alt_1_outlined,
                    size: 80,
                    color: Colors.blue,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Criar Conta',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Preencha os dados abaixo para se cadastrar',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
        
                  // Campo de Nome Completo
                  TextFormField(
                    controller: nomeController,
                    decoration: InputDecoration(
                      labelText: 'Nome Completo',
                      hintText: 'Digite seu nome completo',
                      prefixIcon: const Icon(Icons.person_outline),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.grey[50],
                    ),
                  ),
                  const SizedBox(height: 16),
        
                  // Campo de E-mail
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'E-mail',
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
                    controller: telefone,
                    decoration: InputDecoration(
                      labelText: 'Telefone',
                      hintText: 'Digite seu telefone',
                      prefixIcon: const Icon(Icons.phone),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        
                      ),
                      filled: true,
                      fillColor: Colors.grey[50],
                    ),
                  ),

                   const SizedBox(height: 16),
        
                  // Campo de Senha
                  TextFormField(
                    controller: senha,
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
                  const SizedBox(height: 16),
        
                  // Campo de Confirmar Senha
              
          
        
                  // Termos e condições
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                        activeColor: Colors.blue,
                      ),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                            children: [
                              const TextSpan(text: 'Li e concordo com os '),
                              TextSpan(
                                text: 'Termos de Uso',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const TextSpan(text: ' e '),
                              TextSpan(
                                text: 'Política de Privacidade',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
        
                  const SizedBox(height: 16),
        
                  // Botão Registrar
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        final registro = RegisterModel(
                          nome: nomeController.text, 
                          email: emailController.text, 
                          senha: senha.text,  
                          telefone: telefone.text, );



                          context.read<RegisterBloc>().add(RegisterButtonPressed(registro));

                          print(registro);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text(
                        'Cadastrar',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
        
                  // Já tem conta?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Já tem uma conta?',
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Fazer Login',
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
          
        },
  
      ),
    );
  }
}