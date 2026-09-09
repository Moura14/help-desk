class TicketModel {
  final String titulo;
  final String descricao;
  final String prioridade;
  final String categoria;
  final String anexoUrl;

  TicketModel({
    required this.titulo,
    required this.descricao,
    required this.prioridade,
    required this.categoria,
    required this.anexoUrl,
  });

 
  factory TicketModel.fromJson(Map<String, dynamic> json) {
    return TicketModel(
      titulo: json['titulo'] ?? '',
      descricao: json['descricao'] ?? '',
      prioridade: json['prioridade'] ?? '',
      categoria: json['categoria'] ?? '',
      anexoUrl: json['anexo_url'] ?? '',
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'titulo': titulo,
      'descricao': descricao,
      'prioridade': prioridade,
      'categoria': categoria,
      'anexo_url': anexoUrl,
    };
  }
}
