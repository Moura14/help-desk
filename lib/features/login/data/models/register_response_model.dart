class RegisterResponseModel {
  final String nome;
  final String email;
  final String telefone;
  final int id;
  final String criado;

  RegisterResponseModel({
    required this.nome,
    required this.email,
    required this.telefone,
    required this.id,
    required this.criado
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      nome: json['nome'] ?? '',
      email: json['email'] ?? '',
      telefone: json['telefone'] ?? '',
       id: json['id'] is int ? json['id'] : int.tryParse(json['id'].toString()) ?? 0,
      criado: json['criado'] ?? ''
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'email': email,
      'telefone': telefone,
      'id': id,
      'criado': criado
    };
  }
}