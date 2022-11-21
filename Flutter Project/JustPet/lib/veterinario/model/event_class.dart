enum TipoOperazione { operazione, visita }

class Evento{

  String orario_inizio = '',nome_cliente = '', razza_animale = '';
  int mese= 1,giorno= 1,anno =2022;
  TipoOperazione tipoOperazione =TipoOperazione.visita;
  String durata  = '15m';

  Evento(String orario_inizio,String nome_cliente, String razza_animale, int anno, int mese, int giorno, TipoOperazione tipoOperazione)
  {
    this.orario_inizio = orario_inizio;
    this.nome_cliente = nome_cliente;
    this.razza_animale = razza_animale;
    this.anno= anno;
    this.mese = mese;
    this.giorno = giorno;
    this.tipoOperazione = tipoOperazione;
    if (tipoOperazione == TipoOperazione.visita){
      this.durata = "15m";
    }else{
      this.durata = "1h";
    }

  }
}

List listaEventi = [
  Evento(
    "09:00",
    "Mario Rossi",
    "Gatto",
    2022,
    11,
    22,
    TipoOperazione.operazione,
  ),
  Evento(
    "10:00",
    "Mario Rossi",
    "Pappagallo",
    2022,
    11,
    22,
    TipoOperazione.visita,
  ),
  Evento(
    "11:00",
    "Mario Rossi",
    "Gatto",
    2022,
    11,
    22,
    TipoOperazione.operazione,
  ),

];