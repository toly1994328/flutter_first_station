class Human {
  String name = '';
  double weight = 0;
  double height = 0;

  Human(this.name, this.weight, this.height);

  String info() {
    return "Human: name{${name},weight:${weight}kg,height:${height}cm}";
  }
}

void main() {
  Human toly = Human("捷特", 70, 180);
  print(toly.info());

  Human ls = Human("龙少", 65, 179);
  print(ls.info());

  Human wy = Human("巫缨", 65, 179);
  print(wy.info());
}






























