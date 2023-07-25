class GetHelpModel {
  int? status;
  String? message;
  List<Help> help = [];

  GetHelpModel({this.status, this.message, required this.help});

  GetHelpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['help'] != null) {
      help = <Help>[];
      json['help'].forEach((element) {
        help.add(Help.fromJson(element));
      });
    }
  }
}

class Help {
  int? id;
  String? question;
  String? answer;

  Help({this.id, this.question, this.answer});

  Help.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    answer = json['answer'];
  }
}
