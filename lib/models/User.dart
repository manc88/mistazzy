class User {
  String id = "init";
  String name = "init";

  User(this.id, this.name);

  User.fromJSON(String jsonString);
}
