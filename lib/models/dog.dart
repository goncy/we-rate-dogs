class Dog {
  final String name;
  final String location;
  final String description;
  final String image;

  int rating = 10;

  Dog(this.name, this.location, this.description, this.image);

  static fromJsonList(dynamic dogs) =>
      List<Dog>.from(dogs.map((dog) => Dog.fromJson(dog)));

  static fromJson(Map<String, dynamic> dog) => Dog(
        dog['name'],
        dog['location'],
        dog['description'],
        dog['image'],
      );
}
