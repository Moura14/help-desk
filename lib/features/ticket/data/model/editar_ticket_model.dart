class EditarTicketModel {
  final String titulo;
  final String descricao;
  final String prioridade;
  final String categoria;
  final String status;

  EditarTicketModel({
    required this.titulo,
    required this.descricao,
    required this.prioridade,
    required this.categoria,
    required this.status,
  });

  // Construtor a partir de JSON
  factory EditarTicketModel.fromJson(Map<String, dynamic> json) {
    return EditarTicketModel(
      titulo: json['titulo'] ?? '',
      descricao: json['descricao'] ?? '',
      prioridade: json['prioridade'] ?? '',
      categoria: json['categoria'] ?? '',
      status: json['status'] ?? '',
    );
  }

  // Converter para JSON
  Map<String, dynamic> toJson() {
    return {
      'titulo': titulo,
      'descricao': descricao,
      'prioridade': prioridade,
      'categoria': categoria,
      'status': status,
    };
  }
}
