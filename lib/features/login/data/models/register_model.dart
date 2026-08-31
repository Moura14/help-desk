class RegisterModel {
  final String nome;
  final String email;
  final String senha;
  final String telefone;
  

  RegisterModel({
    required this.nome,
    required this.email,
    required this.senha,
     required this.telefone,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      nome: json['nome'] ?? '',
      email: json['email'] ?? '',
      senha: json['senha'] ?? '',
      telefone: json['telefone'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'email': email,
      'senha': senha,
      'telefone': telefone,
    };
  }
}