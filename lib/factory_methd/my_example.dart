// implement with dart lang

class Person {
  final String name;
  final int age;

  Person({required this.name, required this.age});

  factory Person.eighteen({required name}) {
    return Person(name: name, age: 18);
  }

  factory Person.ten({required name}) {
    return Person(name: name, age: 10);
  }
}
