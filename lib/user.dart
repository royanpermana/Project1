class User {
  final String picture;
  final int age;
  final String name;
  final String gender;
  final String email;
  final String phone;
  final String address;
  final double latitude;
  final double longitude;
  final String greeting;
  final String favoriteFruit;
  final List<Friends> friends;

  User(
      {this.picture,
      this.age,
      this.name,
      this.gender,
      this.email,
      this.phone,
      this.address,
      this.latitude,
      this.longitude,
      this.greeting,
      this.favoriteFruit,
      this.friends});

  factory User.fromJson(Map<String, dynamic> json) {
    var list = json["friends"] as List;
    List<Friends> friendsList = list.map((i) => Friends.fromJson(i)).toList();

    return User(
        picture: json["picture"],
        age: json["age"],
        name: json["name"],
        gender: json["gender"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        greeting: json["greeting"],
        favoriteFruit: json["favoriteFruit"],
        friends: friendsList
        // (json["friends"] as List).map((i) => Friends.fromJson(i)).toList(),
        );
  }
}

class Friends {
  final int id;
  final String name;

  Friends({this.id, this.name});

  factory Friends.fromJson(Map<String, dynamic> json) {
    return Friends(id: json["id"], name: json["name"]);
  }
}
