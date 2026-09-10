import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_desk/features/home/presentation/bloc/home_bloc.dart';
import 'package:help_desk/features/home/presentation/bloc/home_event.dart';
import 'package:help_desk/features/home/presentation/bloc/home_state.dart';
import 'package:help_desk/features/ticket/presentation/bloc/ticket_bloc.dart';
import 'package:help_desk/features/ticket/presentation/bloc/ticket_event.dart';
import 'package:help_desk/features/ticket/presentation/bloc/ticket_state.dart';
import 'package:help_desk/features/ticket/presentation/pages/abrir_ticket.dart';

class HomePage extends StatefulWidget {


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void initState() {
    super.initState();
    // dispara o evento assim que a tela abre
    context.read<TicketListBloc>().add(FetchTickets());
    context.read<HomeBloc>().add(HomeInfo());
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state){
                if(state is HomeLoading){
                  return  DrawerHeader(
                    decoration: BoxDecoration(color: Colors.black),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),

                  );
                }else if (state is HomeSuccess){
                  final usuario = state.response;
                  return DrawerHeader(
                    decoration: BoxDecoration(color: Colors.black),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Olá, ${usuario.nome}', style: TextStyle(color: Colors.white, fontSize: 15)),
                        Text('Email: ${usuario.email}', style: TextStyle(color: Colors.white, fontSize: 15)),
                        Text('Telefone: ${usuario.telefone}', style: TextStyle(color: Colors.white, fontSize: 15)),
                        const SizedBox(height: 8),

                      ],
                    ),
                  );
                }else if (state is HomeFailure){
                  return const DrawerHeader(
                    decoration: BoxDecoration(color: Colors.black),
                    child: Text('Erro ao carregar usuário:', style: TextStyle(color: Colors.white)),
                  );
                }
                return const DrawerHeader(
                  decoration: BoxDecoration(color: Colors.black),
                  child: Text(
                    'Teste'
                  ),
                );
              },
              
        )],
        ),
      ),
      body: BlocBuilder<TicketListBloc, TicketListState>(
        builder: (context, state){
          if(state is TicketListLoading){
            return const Center(child: CircularProgressIndicator());
          }else if (state is TicketListSucess){
          return ListView.builder(
            itemCount: state.tickets.length,
            itemBuilder: (context, index){
              final ticket = state.tickets[index];
              return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: ChamadoCard(titulo: ticket.titulo, 
              descricao: ticket.descricao,
              status: ticket.status, 
              data: ticket.dataCriacao.toString()),
            ),
                    );
            },
          );
          }else if (state is TicketFailure){
           return const Center(child: Text('Erro ao listar ticket'));
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (_){
            return AbrirTicketPage();
          }));
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.add, color: Colors.white,),
        
        ),
    );
    
  }
}

class ChamadoCard extends StatelessWidget {
  final String titulo;
  final String descricao;
  final String status;
  final String data;

  const ChamadoCard({
    super.key,
    required this.titulo,
    required this.descricao,
    required this.status,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // título do chamado
            Text(
              titulo,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            // descrição
            Text(
              descricao,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 12),
            // status e data
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label: Text(status),
                  backgroundColor: status == "Aberto"
                      ? Colors.red[100]
                      : Colors.green[100],
                  labelStyle: TextStyle(
                    color: status == "Aberto" ? Colors.red : Colors.green,
                  ),
                ),
                Text(
                  data,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
