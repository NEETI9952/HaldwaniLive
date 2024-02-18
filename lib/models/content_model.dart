// class ContentModel {
//   String? rendered;
//
//   ContentModel({this.rendered});
// }


//     val `protected`: Boolean,
//     val rendered: String

class ContentModel {
  String rendered;

  ContentModel({required this.rendered});

  factory ContentModel.fromJson(Map<String, dynamic> json) {
    return ContentModel(
      rendered: json['rendered'],
    );
  }
}