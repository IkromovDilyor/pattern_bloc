
class Post {
  int id;
  String fullname;
  String number;
  int userId;

  Post({this.id, this.fullname, this.number, this.userId});

  Post.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        fullname = json['fullname'],
        number = json['number'],
        userId = json['userId'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'fullname': fullname,
    'number': number,
    'userId': userId,
  };
}