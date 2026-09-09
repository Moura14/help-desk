import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AbrirTicketPage extends StatefulWidget {
  const AbrirTicketPage({super.key});

  @override
  State<AbrirTicketPage> createState() => _AbrirTicketPageState();
}

class _AbrirTicketPageState extends State<AbrirTicketPage> {
  final tituloController = TextEditingController();
  final descricaoController = TextEditingController();
  final prioridadeController = TextEditingController();
  final categoriaController = TextEditingController();
  final anexoController = TextEditingController();


  File? imagemSelecionada;
  final ImagePicker _picker = ImagePicker();

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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Abrir Ticket", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
      ),
      body: Padding(
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
              if(imagemSelecionada != null)
                Image.file(imagemSelecionada!, height: 200, width: double.infinity, fit: BoxFit.cover,),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  final ticket = {
                    "titulo": tituloController.text,
                    "descricao": descricaoController.text,
                    "prioridade": prioridadeController.text,
                    "categoria": categoriaController.text,
                    "anexo_url": anexoController.text,
                  };

                  // Aqui você pode chamar seu Bloc ou API
                  print("Ticket criado: $ticket");

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Ticket aberto com sucesso!"),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                icon: const Icon(Icons.send),
                label: const Text("Abrir Ticket"),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
