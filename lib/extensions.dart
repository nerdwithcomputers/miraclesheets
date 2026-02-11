extension StringParse on String {
  int parseInt(){
    return int.parse(this);
  }
  bool validInt(){
    var val = int.tryParse(this);
    if(val==null){
      return false;
    } else {
      return true;
    }
  }
}

extension CalcMod on int {
  String parseModString(){
    // rounding sucks.
    var diff = this - 10;
    var sign = diff >= 0 ? "+" : "-";
    if(((diff%2) != 0) && (sign=="-")){
      diff -= 1;
    }
    var mod = diff.abs() ~/ 2;
    var modifier = "$sign$mod";
    return modifier;
  }
  
  int parseModInt(){
    // rounding sucks slightly less.
    var diff = this - 10;
    var sign = diff >= 0 ? 1 : -1;
    if(((diff%2) != 0) && (sign==-1)){
      diff -= 1;
    }
    var mod = (diff.abs() ~/ 2)*sign;
    return mod;
  }
}
