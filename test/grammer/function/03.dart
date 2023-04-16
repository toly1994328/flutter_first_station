void main() {
  double toly = bmi(70, 1.8);
  double ls = bmi();
  double wy = bmi(1.69);

  print("===toly:$toly===ls:$ls===wy:$wy===");
}

// void main() {
//   double toly = 1.8 / (70 * 70);
//   double ls = 1.79 / (65 * 65);
//   double wy = 1.69 / (50 * 50);
//   print("===toly:$toly===ls:$ls===wy:$wy===");
// }

double bmi([double height = 1.79, double weight = 65]) {
  // 具体算法
  double result = weight / (height * height);
  return result;
}
