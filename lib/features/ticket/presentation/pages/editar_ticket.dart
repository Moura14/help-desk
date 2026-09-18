import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_desk/features/ticket/data/model/editar_ticket_model.dart';
import 'package:help_desk/features/ticket/data/model/ticket_response_model.dart';
import 'package:help_desk/features/ticket/presentation/bloc/ticket_bloc.dart';
import 'package:help_desk/features/ticket/presentation/bloc/ticket_event.dart';
import 'package:help_desk/features/ticket/presentation/bloc/ticket_state.dart';
import 'package:image_picker/image_picker.dart';


class EditarTicketPage extends StatefulWidget {
  final TicketResponseModel ticket;

  const EditarTicketPage({super.key, required this.ticket});

  @override
  State<EditarTicketPage> createState() => _EditarTicketPageState();
}

class _EditarTicketPageState extends State<EditarTicketPage> {
  late TextEditingController tituloController;
  late TextEditingController descricaoController;
  late TextEditingController prioridadeController;
  late TextEditingController categoriaController;
  late TextEditingController anexoController;

  File? imagemSelecionada;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    // Inicializa os controllers com os valores atuais
    tituloController = TextEditingController(text: widget.ticket.titulo);
    descricaoController = TextEditingController(text: widget.ticket.descricao);
    prioridadeController = TextEditingController(text: widget.ticket.prioridade);
    categoriaController = TextEditingController(text: widget.ticket.categoria);
    anexoController = TextEditingController(text: widget.ticket.anexoUrl);
  }

  @override
  void dispose() {
    tituloController.dispose();
    descricaoController.dispose();
    prioridadeController.dispose();
    categoriaController.dispose();
    super.dispose();
  }

  Future<void> _selecionarImagem(ImageSource source) async {
    final XFile? imagem = await _picker.pickImage(source: source);
    if (imagem != null) {
      setState(() {
        imagemSelecionada = File(imagem.path);
        anexoController.text = imagem.path; // preenche o campo com o caminho
      });
    }
  }

   void _abrirOpcoesAnexo() {
    showModalBottomSheet(
      context: context,
      builder: (_) => Wrap(
        children: [
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text("Tirar foto"),
            onTap: () {
              Navigator.pop(context);
              _selecionarImagem(ImageSource.camera);
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text("Escolher da galeria"),
            onTap: () {
              Navigator.pop(context);
              _selecionarImagem(ImageSource.gallery);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
  appBar: AppBar(title: const Text("Editar Ticket")),
  body: BlocListener<TicketBloc, TicketState>(
    listener: (context, state) {
      if (state is TicketEditSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Ticket atualizado com sucesso')),
        );
        Navigator.of(context).pop();
      } else if (state is TicketEditFailure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro: ${state.message}')),
        );
      }
    },
    child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: tituloController,
                decoration: const InputDecoration(
                  labelText: "Título",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: descricaoController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: "Descrição",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: prioridadeController,
                decoration: const InputDecoration(
                  labelText: "Prioridade",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: categoriaController,
                decoration: const InputDecoration(
                  labelText: "Categoria",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: anexoController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Anexo",
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.attach_file),
                    onPressed: _abrirOpcoesAnexo,
                  ),
                ),
              ),
              if (imagemSelecionada != null)
                Image.file(
                  imagemSelecionada!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {

                    final editarTicket = EditarTicketModel(
                      titulo: tituloController.text.trim(), 
                      descricao: descricaoController.text.trim(), 
                      prioridade: prioridadeController.text.trim(), 
                      categoria: categoriaController.text.trim(), 
                      status: widget.ticket.status);
                 
                   context.read<TicketBloc>().add(EditarTicketPressed(widget.ticket.id, editarTicket));
                 
                },
                icon: const Icon(Icons.save),
                label: const Text("Salvar Alterações"),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      )
    ));
    }


  }

