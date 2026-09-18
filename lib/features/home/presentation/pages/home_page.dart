import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_desk/features/home/presentation/bloc/home_bloc.dart';
import 'package:help_desk/features/home/presentation/bloc/home_event.dart';
import 'package:help_desk/features/home/presentation/bloc/home_state.dart';
import 'package:help_desk/features/ticket/data/model/editar_ticket_model.dart';
import 'package:help_desk/features/ticket/data/model/ticket_response_model.dart';
import 'package:help_desk/features/ticket/presentation/bloc/ticket_bloc.dart';
import 'package:help_desk/features/ticket/presentation/bloc/ticket_event.dart';
import 'package:help_desk/features/ticket/presentation/bloc/ticket_state.dart';
import 'package:help_desk/features/ticket/presentation/pages/abrir_ticket.dart';
import 'package:help_desk/features/ticket/presentation/pages/editar_ticket.dart';

class HomePage extends StatefulWidget {
 


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  void initState() {
    super.initState();
    
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
    child: Column(
    children: [
      Expanded(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading) {
                  return const DrawerHeader(
                    decoration: BoxDecoration(color: Colors.black),
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else if (state is HomeSuccess) {
                  final usuario = state.response;
                  return UserAccountsDrawerHeader(
                    accountName: Text(usuario.nome),
                    accountEmail: Text(usuario.email),
                    currentAccountPicture: const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Text('M'),
                    ),
                    decoration: const BoxDecoration(color: Colors.black),
                  );
                } else if (state is HomeFailure) {
                  return const DrawerHeader(
                    decoration: BoxDecoration(color: Colors.black),
                    child: Text('Erro ao carregar usuário',
                        style: TextStyle(color: Colors.white)),
                  );
                }
                return const DrawerHeader(
                  decoration: BoxDecoration(color: Colors.black),
                  child: Text('Teste'),
                );
              },
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(20),
        child: ListTile(
          leading: const Icon(Icons.logout, color: Colors.black),
          title: const Text("Sair"),
          onTap: () {
            // lógica de logout aqui
            Navigator.pop(context); // fecha o Drawer
          },
        ),
      ),
    ],
  ),
),

      body: BlocBuilder<TicketListBloc, TicketListState>(
        builder: (context, state){
          print("Estado atual do TicketListBloc: $state");
          if(state is TicketListLoading){
            return const Center(child: CircularProgressIndicator());
          }else if (state is TicketListSucess){
            if(state.tickets.isEmpty){
              print(state.tickets);
              return const Center(child: Text('Nenhum ticket encontrado'));
            }
          return ListView.builder(
            itemCount: state.tickets.length,
            itemBuilder: (context, index){
              final ticket = state.tickets[index];
              print(ticket);
              return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: ChamadoCard(ticketResponse: ticket),
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

          context.read<TicketListBloc>().add(FetchTickets());
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.add, color: Colors.white,),
        
        ),
    );
    
  }
}

class ChamadoCard extends StatelessWidget {
  
  final TicketResponseModel ticketResponse;

  const ChamadoCard({
    super.key,
    required this.ticketResponse,
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
              ticketResponse.titulo,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            // descrição
            Text(
              ticketResponse.descricao,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 12),
            // status e data
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_){
                  return EditarTicketPage(ticket: ticketResponse);
                }));
              }, 
              icon: Icon(Icons.edit)),
              IconButton(
                onPressed: (){
                  showDialog(context: context, 
                  builder: (context){
                    return AlertDialog(
                      title: const Text('Confirmação'),
                      content: const Text('Deseja realmente exluir esse item?'),
                      actions: [
                        TextButton(
                          onPressed: (){
                            Navigator.pop(context);
                          }, 
                          child: Text('Cancelar')),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red
                            ),
                            onPressed: (){}, 
                            child: Text('Confirmar', style: TextStyle(color: Colors.white)))
                      ],
                    );
                  });
                }, 
                icon: Icon(Icons.delete))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
