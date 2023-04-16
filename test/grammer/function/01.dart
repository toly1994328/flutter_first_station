void main() {
  double toly = bmi(1.8, 70);
  double ls = bmi(1.79, 65);
  double wy = bmi(1.69, 50);

  print("===toly:$toly===ls:$ls===wy:$wy===");
}

// void main() {
//   double toly = 1.8 / (70 * 70);
//   double ls = 1.79 / (65 * 65);
//   double wy = 1.69 / (50 * 50);
//   print("===toly:$toly===ls:$ls===wy:$wy===");
// }

double bmi(double height, double wight) {
  // 具体算法
  double result = wight / (height * height);
  return result;
}
