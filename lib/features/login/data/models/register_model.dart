class RegisterModel {
  final String nome;
  final String email;
  final String telefone;
  final String senha;

  RegisterModel({
    required this.nome,
    required this.email,
    required this.telefone,
    required this.senha,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      nome: json['nome'] ?? '',
      email: json['email'] ?? '',
      telefone: json['telefone'] ?? '',
      senha: json['senha'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'email': email,
      'telefone': telefone,
      'senha': senha,
    };
  }
}