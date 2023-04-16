class Human {
  String name = '';
  double weight = 0;
  double height = 0;

  Human(this.name, this.weight, this.height);

  double bmi() {
    double result = weight / ((height/100) * (height/100));
    return result;
  }

  String info() {
    return "Human: name{${name},weight:${weight}kg,height:${height}cm}";
  }
}

class Student extends Human {
  final String school;

  Student(
    super.name,
    super.weight,
    super.height, {
    required this.school,
  });

  @override
  String info() {
    String info = super.info() + "school: $school ";
    return info;
  }

}

void main() {
  Student toly = Student("捷特", 70, 180,school: "安徽建筑大学");
  print(toly.bmi());
  print(toly.info());
}
