class InfoResponseModel {
  final String nome;
  final String email;
  final String telefone;
  final int id;
  final DateTime criadoEm;

  InfoResponseModel({
    required this.nome,
    required this.email,
    required this.telefone,
    required this.id,
    required this.criadoEm,
  });

  factory InfoResponseModel.fromJson(Map<String, dynamic> json) {
    return InfoResponseModel(
      nome: json['nome'],
      email: json['email'],
      telefone: json['telefone'],
      id: json['id'],
      criadoEm: DateTime.parse(json['criado_em']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'email': email,
      'telefone': telefone,
      'id': id,
      'criado_em': criadoEm.toIso8601String(),
    };
  }
}
