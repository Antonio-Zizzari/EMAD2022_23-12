class Veterinario {
  String immagine;
  String immagine_profilo;
  String nome;
  String indirizzo;
  String votazione;
  String descrizione;
  List<String> turni;

  Veterinario ({required this.immagine, required this.immagine_profilo, required this.nome, required this.indirizzo, required this.votazione, required this.descrizione, required this.turni});
}

final List<Veterinario> veterinari = [
  Veterinario(
      immagine: "veterinario1.jpg",
      immagine_profilo: "user_2.png",
      nome: "Dottor Mario Rossi",
      indirizzo: "Via Unità Italiana, 12",
      votazione: "4,5",
      descrizione: 'Il dottor Rossi vanta più di 10 anni di esperienza nel settore, grazie alla sua competenza acquisita negli anni e coltivata con il lavoro. Ha raggiunto la vetta dopo aver operato più di 75 animali, tutti con successo',
      turni: [
        '9:00',
        '9:15',
        '9:30',
        '9:45',
        '10:00',
        '10:15',
        '10:30',
        '10:45'
      ]),
  Veterinario(
      immagine: "veterinario2.jpg",
      immagine_profilo: "user_5.png",
      nome: "Dottoressa Alice Gialli",
      indirizzo: "Via Mazzini, 5",
      votazione: "4,8",
      descrizione: 'La dottoressa Gialli vanta più di 10 anni di esperienza nel settore, grazie alla sua competenza acquisita negli anni e coltivata con il lavoro. Ha raggiunto la vetta dopo aver operato più di 75 animali, tutti con successo',
      turni: ['12:30', '12:45', '13:00', '15:00', '13:30', '13:45']),
  Veterinario(
      immagine: "veterinario3.jpg",
      immagine_profilo: "user_3.png",
      nome: "Dottor Giovanni Verdi",
      indirizzo: "Via Colombo, 27",
      votazione: "4,2",
      descrizione: 'Il dottor Verdi vanta più di 10 anni di esperienza nel settore, grazie alla sua competenza acquisita negli anni e coltivata con il lavoro. Ha raggiunto la vetta dopo aver operato più di 75 animali, tutti con successo',
      turni: ['16:00', '16:15', '16:30', '16:45', '17:00', '17:15']),
];