class TaskModel{
  late String? id, owner, category, title,tenggatWaktu, waktuSelesai;
  late bool? completed;

  TaskModel({this.id, this.completed, this.category,this.owner,this.tenggatWaktu,this.waktuSelesai, this.title});
  factory TaskModel.FromJSON(Map<String,dynamic>json){
    return TaskModel(
      id: json['_id'],
      owner: json['owner'],
      category: json['category'],
      title: json['title'],
      tenggatWaktu: json['tenggatWaktu'],
      waktuSelesai: json['waktuSelesai'],
      completed: json['completed']
    );
  }

  static fromJson(taskData) {}
}