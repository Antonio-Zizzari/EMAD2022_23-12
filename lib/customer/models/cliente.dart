class Cliente{
  String email, nome, cognome;

  Cliente({
    required this.email,
    required this.nome,
    required this.cognome
  });

  Map<String, dynamic> toJson() => {
    'email': email,
    'name': nome,
    'cognome': cognome
  };

  static Cliente fromJson(Map<String, dynamic> json) => Cliente(
    email: json['email'],
    nome: json['nome'],
    cognome: json['cognome']
  );
}