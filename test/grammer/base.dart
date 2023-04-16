void main() {
  // ---->[break情景]----
  for (int i = 0; i < 10; i++) {
    if (i % 3 == 2) {
      break; //直接跳出循环
    }
    print("i:$i"); //打印了0，1
  }

  // ---->[continue情景]----
  for (int i = 0; i < 10; i++) {
    if (i % 3 == 2) {
      continue; //跳出本次循环，将进入下次循环
    }
    print("i:$i"); //打印了 0，1，3，4，6，7，9
  }
}

void main13() {
  int sum = 0;
  int i = 0;
  do {
    sum += i;
    print("第 $i 次执行,sum = $sum");
    i = i + 1;
  } while (i < 5);
}

void main12() {
  int sum = 0;
  int i = 0;
  while (i < 5) {
    sum += i;
    print("第 $i 次执行,sum = $sum");
    i = i + 1;
  }
}

void main11() {
  int sum = 0;
  for (int i = 0; i < 5; i = i + 1) {
    sum += i;
    print("第 $i 次执行,sum = $sum");
  }
}

void main10() {
  String mark = 'A';
  switch (mark) {
    case 'A':
      print("优秀");
      break;
    case 'B':
      print("良好");
      break;
    case 'C':
      print("普通");
      break;
    case 'D':
      print("较差");
      break;
    case 'E':
      print("极差");
      break;
    default:
      print("未知等级");
  }
}

void main9() {
  double height = 1.18;
  // 布尔值可以通过运算获得
  bool free = height < 1.2;
  if (free) {
    print("可免费入园");
  } else {
    print("请购买门票");
  }
}

// 逻辑运算符
void main8() {
  // 公园是否开放
  bool open = true;
  // 公园是否开放
  bool free = false;

  // 公园是否免费开放
  bool freeEnter = open && free;
}

// 算术运算符
void main7() {
  print(1 > 2); //false   大于
  print(1 < 2); //true    小于
  print(1 == 2); //false  等于
  print(1 != 2); //true   不等
  print(10 >= 3); //true  大于等于
  print(10 <= 3); //false 小于等于
}

// 比较运算符
void main6() {
  print(1 + 2); //3    加
  print(1 - 2); //-1   减
  print(1 * 2); //2    乘
  print(1 / 2); //0.5  除
  print(10 % 3); //1   余
  print(10 ~/ 3); //3  商
}

void main5() {
  // 直接赋值
  bool enable = true;
  double height = 1.18;
  // 布尔值可以通过运算获得
  bool free = height < 1.2;
}

void main4() {
  double a = 2.3;
  double b = 4.5;
  double c = 2.5;

  double avg = (a + b + c) / 3;
  String output = '$a,$b,$c 的平均值是$avg';
  // String output = '$a,$b,$c 的平均值是${(a + b + c) / 3}';
  print(output);
}

void main3() {
  String hello1 = 'Hello, World!';
  String hello2 = "Hello, Flutter!";
  print(hello1 + hello2);
}

void main0() {
  int age = 2;
  double weight = 4.5;
}

void main1() {
  double a = 2.3;
  double b = 4.5;
  double c = 2.5;

  double avg = (a + b + c) / 3;
  print(avg);
}
