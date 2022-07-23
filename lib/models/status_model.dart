class StatusModel {
  StatusModel({
    this.id,
    required this.name,
    this.v,
  });

  String? id;
  String name;
  int? v;

  factory StatusModel.fromJson(Map<String, dynamic> json) => StatusModel(
        id: json["_id"],
        name: json["name"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "__v": v,
      };
}
