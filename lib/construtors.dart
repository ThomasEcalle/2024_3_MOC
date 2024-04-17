class User {
  final String lastName;
  final String name;
  final String pseudo;
  final int age;
  final String? address;

  const User(
    this.lastName, {
    required this.name,
    this.pseudo = 'toto',
    required this.age,
    this.address,
  });
}

void main() {
  final toto = User('test', name: 'toto', age: 42);
  final tata = User('test', name: 'toto', age: 42, address: 'Rue machin', pseudo: 'tata');

  print(toto.pseudo);
  print(tata.pseudo);

  const user1 = User('user2', name: 'toto', age: 42);
  const user2 = User('user1', name: 'toto', age: 42);

  print(user1 == user2);
}
