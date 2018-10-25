class User {
  String id = "";
  String name = "";

  User(this.id, this.name);

  User.fromJSON(String jsonString);
}
