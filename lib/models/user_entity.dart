class User {
  int userId;
  int id;
  String title;
  String body;

  User(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: int.parse(json['userId'].toString()),
      id: int.parse(json['id'].toString()),
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
