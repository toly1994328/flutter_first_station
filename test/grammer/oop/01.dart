class Human {
  String name = '';
  double weight = 0;
  double height = 0;
}

void main(){
  Human toly = Human();
  toly.name = "捷特";
  toly.weight = 70;
  toly.height = 180;

  print("Human: name{${toly.name},weight:${toly.weight}kg,height:${toly.height}cm}");
}