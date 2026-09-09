import 'package:flutter/material.dart';
import 'package:help_desk/features/ticket/presentation/pages/abrir_ticket.dart';

class HomePage extends StatefulWidget {
 

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.black),
              child: Text(
                'Olá, fulano de tal', style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            ListTile(
          leading: const Icon(Icons.home),
          title: const Text("Início"),
          onTap: () {
            Navigator.pushNamed(context, "/home");
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text("Sair"),
          onTap: () {
            Navigator.pushNamed(context, "/home");
          },
        ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ChamadoCard(titulo: 'Pc não funciona', 
              descricao: 'Meu pc não funcion de jeito nenhum', 
              status: 'Aberto', 
              data: '14 de maio'),
              ChamadoCard(titulo: 'Teclado', 
              descricao: 'Troca de teclado', 
              status: 'Aberto', 
              data: '05 de junho'),
              
            ],
          ),
        ),
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
