import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProfileStudentModel {
  final String id;
  final String nameStudent;
  final String idStudent;
  final String pathAvatar;
  final String position;
  ProfileStudentModel({
    required this.id,
    required this.nameStudent,
    required this.idStudent,
    required this.pathAvatar,
    required this.position,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nameStudent': nameStudent,
      'idStudent': idStudent,
      'pathAvatar': pathAvatar,
      'position': position,
    };
  }

  factory ProfileStudentModel.fromMap(Map<String, dynamic> map) {
    return ProfileStudentModel(
      id: map['id'] as String,
      nameStudent: map['nameStudent'] as String,
      idStudent: map['idStudent'] as String,
      pathAvatar: map['pathAvatar'] as String,
      position: map['position'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileStudentModel.fromJson(String source) => ProfileStudentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
