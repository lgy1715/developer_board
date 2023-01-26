class FeedModel{
  int?id;
  String?name;
  int?imageId;
  String?content;
  DateTime?createAt;
  bool? isMe;

  FeedModel.parse(Map m){
    id = m['id'];
    content = m['content'];
    createAt = DateTime.parse(m['createAt']);
    name = m['user_name'];
    imageId = m['image_id'];
    isMe = m['is_me'];

  }



}