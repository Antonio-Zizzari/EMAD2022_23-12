class LuissClass {
  List razza;
  List score;

  LuissClass(this.razza, this.score);

  List getRazza() {
    return razza;
  }

  List getScore() {
    return score;
  }

  int getLenght() {
    if(razza.length==score.length) {
      return razza.length;
    }
    else{
      throw StateError('Liste con dimensioni differenti');
    }
  }

}