void main() {
  foo3();
}

void foo1() {
  Map<int, String> numMap = {
    0: 'zero',
    1: 'one',
    2: 'two',
  };
  print(numMap);
  numMap.remove(1);
  print(numMap);
}

void foo2() {
  Map<int, String> numMap = {
    0: 'zero',
    1: 'one',
    2: 'two',
  };
  numMap[3] = 'three';
  numMap[4] = 'four';
  print(numMap);
}

void foo3() {
  Map<int, String> numMap = {
    0: 'zero',
    1: 'one',
    2: 'two',
  };
  numMap.forEach((key, value) {
    print("${key} = $value");
  });
}

