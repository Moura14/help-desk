class TicketResponse {
  final int id;
  final String titulo;
  final String descricao;
  final String prioridade;
  final String categoria;
  final String anexoUrl;
  final String status;
  final int criadoPor;
  final String criadorNome;
  final int? tecnicoResponsavelId;
  final String? tecnicoNome;
  final DateTime dataCriacao;
  final DateTime dataAtualizacao;
  final DateTime? dataResolucao;

  TicketResponse({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.prioridade,
    required this.categoria,
    required this.anexoUrl,
    required this.status,
    required this.criadoPor,
    required this.criadorNome,
    this.tecnicoResponsavelId,
    this.tecnicoNome,
    required this.dataCriacao,
    required this.dataAtualizacao,
    this.dataResolucao,
  });


  factory TicketResponse.fromJson(Map<String, dynamic> json) {
    return TicketResponse(
      id: json['id'],
      titulo: json['titulo'],
      descricao: json['descricao'],
      prioridade: json['prioridade'],
      categoria: json['categoria'],
      anexoUrl: json['anexo_url'],
      status: json['status'],
      criadoPor: json['criado_por'],
      criadorNome: json['criador_nome'],
      tecnicoResponsavelId: json['tecnico_responsavel_id'],
      tecnicoNome: json['tecnico_nome'],
      dataCriacao: DateTime.parse(json['data_criacao']),
      dataAtualizacao: DateTime.parse(json['data_atualizacao']),
      dataResolucao: json['data_resolucao'] != null
          ? DateTime.parse(json['data_resolucao'])
          : null,
    );
  }


  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "titulo": titulo,
      "descricao": descricao,
      "prioridade": prioridade,
      "categoria": categoria,
      "anexo_url": anexoUrl,
      "status": status,
      "criado_por": criadoPor,
      "criador_nome": criadorNome,
      "tecnico_responsavel_id": tecnicoResponsavelId,
      "tecnico_nome": tecnicoNome,
      "data_criacao": dataCriacao.toIso8601String(),
      "data_atualizacao": dataAtualizacao.toIso8601String(),
      "data_resolucao": dataResolucao?.toIso8601String(),
    };
  }
}
