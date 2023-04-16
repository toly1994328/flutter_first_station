void main() {
  foo4();
}

void foo1() {
  List<int> numList = [1, 9, 9, 4, 3, 2, 8];
  int second = numList[1];
  print(second);
  numList[3] = 6;
  print(numList);
}

void foo2() {
  List<int> numList = [1, 9, 9, 4, 3, 2, 8];
  numList.add(10);
  numList.insert(0, 49);
  print(numList);
}

void foo3() {
  List<int> numList = [1, 9, 9, 4, 3, 2, 8];
  numList.removeAt(2);
  numList.remove(3);
  numList.removeLast();
  print(numList);
}

void foo4() {
  List<int> numList = [1, 9, 9, 4,];
  for (int i = 0; i < numList.length; i++) {
    int value = numList[i];
    print("索引:$i, 元素值:$value");
  }

  for(int value in numList){
    print("元素值:$value");
  }
}
