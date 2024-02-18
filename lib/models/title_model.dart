// class TitleModel {
//   String? rendered;
//   TitleModel({this.rendered});
// }
class TitleModel {
  String rendered;

  TitleModel({required this.rendered});

  factory TitleModel.fromJson(Map<String, dynamic> json) {
    return TitleModel(
      rendered: json['rendered'],
    );
  }
}
