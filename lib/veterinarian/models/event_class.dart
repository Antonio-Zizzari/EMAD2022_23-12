enum TipoOperazione { operazione, visita }

class Evento extends Object{

  String nome_cliente = '', razza_animale = '';
  String mese= "1",giorno= "1",anno ="2022", ora="00", minuto="00";
  TipoOperazione tipoOperazione =TipoOperazione.visita;
  String durata  = '15m';

  Evento(String nome_cliente, String razza_animale, String anno, String mese, String giorno, String ora, String minuto, TipoOperazione tipoOperazione)
  {
    this.nome_cliente = nome_cliente;
    this.razza_animale = razza_animale;
    this.anno= anno;
    this.mese = mese;
    this.giorno = giorno;
    this.ora = ora;
    this.minuto = minuto;
    this.tipoOperazione = tipoOperazione;
    if (tipoOperazione == TipoOperazione.visita){
      this.durata = "15m";
    }else{
      this.durata = "1h";
    }

  }

  @override
  String toString() {
    return "${this.nome_cliente} | ore $ora:$minuto -> $razza_animale";
  }
}



List listaEventi = [
  Evento(
    "Mario Rossi",
    "Gatto",
    "2022",
    "11",
    "22",
    "17",
    "30",
    TipoOperazione.operazione,
  ),
  Evento(
    "Serena Gialli",
    "Pappagallo",
    "2022",
    "11",
    "22",
    "11",
    "00",
    TipoOperazione.visita,
  ),
  Evento(
    "Giovanni Verdi",
    "Gatto",
    "2022",
    "11",
    "22",
    "18",
    "15",
    TipoOperazione.operazione,
  ),

];