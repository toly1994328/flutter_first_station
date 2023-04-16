class Human {
  String name = '';
  double weight = 0;
  double height = 0;

  Human(this.name,this.weight,this.height);
}

void main(){
  Human toly = Human("捷特",70,180);
  print("Human: name{${toly.name},weight:${toly.weight}kg,height:${toly.height}cm}");
}