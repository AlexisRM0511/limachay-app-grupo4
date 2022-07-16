import 'package:limachayapp/services/model/model_status.dart';

class Response {
  Response({
    required this.status,
    required this.data,
  });

  String status;
  List<StatusModel> data;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        status: json["status"],
        data: List<StatusModel>.from(
            json["data"].map((x) => StatusModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
