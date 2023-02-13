
class Chat {
  final String name, lastMessage, image, time;
  //final bool isActive;

  Chat({
    this.name = '',
    this.lastMessage = '',
    this.image = '',
    this.time = '',
    //this.isActive = false,
  });
}

List chatsData = [
  Chat(
    name: "Maria Rossi",
    lastMessage: "Grazie Dottore!",
    image: "assets/images/user_5.png",
    time: "8 minuti fa",
  ),
  Chat(
    name: "Giovanni Verdi",
    lastMessage: "Salve, ha qualche novità?",
    image: "assets/images/user_4.png",
    time: "5 giorni fa",
  ),
  Chat(
    name: "Serena Gialli",
    lastMessage: "Non c'è di ché!",
    image: "assets/images/user_5.png",
    time: "5 giorni fa",
  ),
  Chat(
    name: "Alberto Gilardino",
    lastMessage: "Grazie Dottore",
    image: "assets/images/user_2.png",
    time: "2 settimane fa",
  ),
  Chat(
    name: "Andrea Neri",
    lastMessage: "A presto!",
    image: "assets/images/user_3.png",
    time: "3 mesi fa",
  ),
  Chat(
    name: "Simone Viola",
    lastMessage: "Salve! La contatto per...",
    image: "assets/images/user_4.png",
    time: "8 mesi fa",
  ),
  Chat(
    name: "Vittorio Rossi",
    lastMessage: "Buonasera",
    image: "assets/images/user_6.png",
    time: "Più di un anno fa",
  ),
  Chat(
    name: "Antonio Arancio",
    lastMessage: "Ci sono novità?",
    image: "assets/images/userMain.png",
    time: "Più di un anno fa",
  ),
  /*Chat(
    name: "Ralph Edwards",
    lastMessage: "Do you have update...",
    image: "assets/images/user_6.png",
    time: "5d ago",
  ),
  Chat(
    name: "Ralph Edwards",
    lastMessage: "Do you have update...",
    image: "assets/images/user_2.png",
    time: "5d ago",
  ),
  Chat(
    name: "Ralph Edwards",
    lastMessage: "Do you have update...",
    image: "assets/images/user_2.png",
    time: "5d ago",
  ),*/
];