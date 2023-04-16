void main() {
  foo3();
}

void foo1() {
  Set<int> numSet = {1, 9, 9, 4};
  print(numSet);
}

void foo2() {
  Set<int> numSet = {1, 9, 4};
  numSet.add(10);
  numSet.remove(9);
  print(numSet);
}

void foo3() {
  Set<int> a = {1, 9, 4};
  Set<int> b = {1, 9, 3};
  print(a.difference(b));// 差集
  print(a.union(b)); // 并集
  print(a.intersection(b)); // 交集
}

void foo4() {
  Set<int> numSet = {1, 9, 4};
  for(int value in numSet){
    print("元素值:$value");
  }
}
