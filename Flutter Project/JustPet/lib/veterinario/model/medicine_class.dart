enum TipoMedicina { capsule, cream, drops,pills, syringe,syrunp }

class Medicine{

  String nome= '', descrizione = '';
  TipoMedicina tipoMedicina = TipoMedicina.capsule;
  String tipo = "Capsule";
  String image = "assets/dizionario/capsule.png";


  Medicine(String nome, String descrizione, TipoMedicina tipoMedicina)
  {
    this.nome =nome;
    this.descrizione = descrizione;
    this.tipoMedicina=tipoMedicina;
    if (tipoMedicina == TipoMedicina.capsule){
      this.tipo = "Capsule";
      this.image ="assets/dizionario/capsule.png";
    }else if(tipoMedicina == TipoMedicina.cream){
      this.tipo = "Crema";
      this.image ="assets/dizionario/cream.png";
    }else if(tipoMedicina == TipoMedicina.drops){
      this.tipo = "Sapone";
      this.image ="assets/dizionario/drops.png";
    }else if(tipoMedicina == TipoMedicina.pills){
      this.tipo = "Pillole";
      this.image ="assets/dizionario/pills.png";
    }else if(tipoMedicina == TipoMedicina.syringe){
      this.tipo = "Siringa";
      this.image ="assets/dizionario/syringe.png";
    }else if(tipoMedicina == TipoMedicina.syrunp){
      this.tipo = "Sciroppo";
      this.image ="assets/dizionario/syrunp.png";
    }

  }
}

List listaMedicine = [
  Medicine("Spintox", "La nebbia agli irti colli\r\nPiovigginando sale,\r\nE sotto il maestrale\r\nUrla e biancheggia il mar;\r\nMa per le vie del borgo\r\nDal ribollir de\u2019 tini\r\nVa l\u2019aspro odor de i vini\r\nL\u2019anime a rallegrar.\r\nGira su\u2019 ceppi accesi\r\nLo spiedo scoppiettando:\r\nSta il cacciator fischiando\r\nSu l\u2019uscio a rimirar\r\nTra le rossastre nubi\r\nStormi d\u2019uccelli neri,\r\nCom\u2019 esuli pensieri,\r\nNel vespero migrar",
      TipoMedicina.drops),
  Medicine("Spintox", "La nebbia agli irti colli\r\nPiovigginando sale,\r\nE sotto il maestrale\r\nUrla e biancheggia il mar;\r\nMa per le vie del borgo\r\nDal ribollir de\u2019 tini\r\nVa l\u2019aspro odor de i vini\r\nL\u2019anime a rallegrar.\r\nGira su\u2019 ceppi accesi\r\nLo spiedo scoppiettando:\r\nSta il cacciator fischiando\r\nSu l\u2019uscio a rimirar\r\nTra le rossastre nubi\r\nStormi d\u2019uccelli neri,\r\nCom\u2019 esuli pensieri,\r\nNel vespero migrar",
      TipoMedicina.cream),
  Medicine("Spintox", "La nebbia agli irti colli\r\nPiovigginando sale,\r\nE sotto il maestrale\r\nUrla e biancheggia il mar;\r\nMa per le vie del borgo\r\nDal ribollir de\u2019 tini\r\nVa l\u2019aspro odor de i vini\r\nL\u2019anime a rallegrar.\r\nGira su\u2019 ceppi accesi\r\nLo spiedo scoppiettando:\r\nSta il cacciator fischiando\r\nSu l\u2019uscio a rimirar\r\nTra le rossastre nubi\r\nStormi d\u2019uccelli neri,\r\nCom\u2019 esuli pensieri,\r\nNel vespero migrar",
      TipoMedicina.syringe),
  Medicine("Spintox", "La nebbia agli irti colli\r\nPiovigginando sale,\r\nE sotto il maestrale\r\nUrla e biancheggia il mar;\r\nMa per le vie del borgo\r\nDal ribollir de\u2019 tini\r\nVa l\u2019aspro odor de i vini\r\nL\u2019anime a rallegrar.\r\nGira su\u2019 ceppi accesi\r\nLo spiedo scoppiettando:\r\nSta il cacciator fischiando\r\nSu l\u2019uscio a rimirar\r\nTra le rossastre nubi\r\nStormi d\u2019uccelli neri,\r\nCom\u2019 esuli pensieri,\r\nNel vespero migrar",
      TipoMedicina.syrunp),
  Medicine("Spintox", "La nebbia agli irti colli\r\nPiovigginando sale,\r\nE sotto il maestrale\r\nUrla e biancheggia il mar;\r\nMa per le vie del borgo\r\nDal ribollir de\u2019 tini\r\nVa l\u2019aspro odor de i vini\r\nL\u2019anime a rallegrar.\r\nGira su\u2019 ceppi accesi\r\nLo spiedo scoppiettando:\r\nSta il cacciator fischiando\r\nSu l\u2019uscio a rimirar\r\nTra le rossastre nubi\r\nStormi d\u2019uccelli neri,\r\nCom\u2019 esuli pensieri,\r\nNel vespero migrar",
      TipoMedicina.drops),
];