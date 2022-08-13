class Task{
  static const String collectionName = 'task';
  String? id;
  String? title;
  String? content;
  DateTime? dateTime;
  bool? isDone;
  Task({this.id,this.title,this.content,this.dateTime,this.isDone});

  Task.fromFireStore(Map<String,dynamic> data):
      this(
        id: data['id'],
        title: data['title'],
        content: data['content'],
        dateTime: DateTime.fromMillisecondsSinceEpoch(data['dateTime']),
        isDone: data['isDone']
      );
  Map<String,dynamic> toFireStore(){
    return {
      'id' :id,
      'title':title,
      'content':content,
      'isDone':isDone,
      'dateTime':dateTime?.millisecondsSinceEpoch
    };
  }
}