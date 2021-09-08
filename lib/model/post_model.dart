class Post {
  int id;
  String number;
  String fullname;
  int userId;

  Post({this.id, this.number, this.fullname, this.userId});

  Post.fromJson(Map<String, dynamic> json)
      :
        number = json['number'],
        fullname = json['fullname'],
        userId = json['userId'];

  Map<String, dynamic> toJson() => {

    'number': number,
    'fullname': fullname,
    'userId': userId,
  };
}