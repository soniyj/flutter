
void main(List<String> args) {
  print('Hello World\n');
  //testfun();
  testMap();
}

testfun() {
  print('test func');
  //var list = [1,2,3];
  var list = ['a','b','c'];
  //list.forEach((E) => print(E));
  list.forEach(printElement);
}

printElement(dynamic x) {
  //print(x is int); //test type
  print(x);
}

testMap() {
  Map x = {
    'x': 'marco',
    2: 'mata'
  };
  printElement(x);
}

testClass() {
  test t = test();
  t._x=2;
  print('t');
  print(t._x);
  print(t._z);
}

class test {
  int _x;
  String _z;

  void ciccio() {
    this._x = 2;
  }
}