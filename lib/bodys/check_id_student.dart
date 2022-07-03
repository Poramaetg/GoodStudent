// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:goodstudent/models/profile_student_model.dart';
import 'package:goodstudent/states/cut_point.dart';
import 'package:goodstudent/utility/my_constant.dart';
import 'package:goodstudent/utility/my_dialog.dart';
import 'package:goodstudent/widgets/show_button.dart';
import 'package:goodstudent/widgets/show_form.dart';
import 'package:goodstudent/widgets/show_text.dart';

class CheckIdStudent extends StatefulWidget {
  final String idTeacher;
  const CheckIdStudent({
    Key? key,
    required this.idTeacher,
  }) : super(key: key);

  @override
  State<CheckIdStudent> createState() => _CheckIdStudentState();
}

class _CheckIdStudentState extends State<CheckIdStudent> {
  String? idStudent;
  ProfileStudentModel? profileStudentModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            newTitle(),
            formidStudent(),
            profileStudentModel == null
                ? const SizedBox()
                : Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 16),
                        width: 250,
                        height: 250,
                        child: Image.network(profileStudentModel!.pathAvatar),
                      ),
                      ShowText(
                        text: profileStudentModel!.nameStudent,
                        textStyle: MyConstant().h2Style(),
                      ),
                      ShowText(
                        text: profileStudentModel!.position,
                        textStyle: MyConstant().h3ActiveStyle(),
                      ),
                      ShowButton(
                        label: 'Process cus Point',
                        pressFunc: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CutPoint(
                                    isTeacher: widget.idTeacher,
                                    profileStudentModel: profileStudentModel!),
                              ));
                        },
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Container formidStudent() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      width: 250,
      child: ShowForm(
        pressFunc: () {
          if (idStudent?.isEmpty ?? true) {
            MyDialog(context: context).normalDialog(
                title: 'No ID Student', subTitle: 'Please Fill ID Student');
          } else {
            processCheckIdStudent();
          }
        },
        hint: 'ID Student',
        iconData: Icons.search,
        changFunc: (String string) {
          idStudent = string.trim();
        },
      ),
    );
  }

  ShowText newTitle() {
    return ShowText(
      text: 'This is Check id Student',
      textStyle: MyConstant().h2Style(),
    );
  }

  Future<void> processCheckIdStudent() async {
    String path =
        'https://www.androidthai.in.th/goodstd/getStudentWhereIdStudentGame.php?isAdd=true&idStudent=$idStudent';
    await Dio().get(path).then((value) {
      if (value.toString() == 'null') {
        MyDialog(context: context).normalDialog(
            title: 'ID Student False',
            subTitle: 'No $idStudent in my Database');

        profileStudentModel = null;
      } else {
        for (var element in json.decode(value.data)) {
          profileStudentModel = ProfileStudentModel.fromMap(element);
        }
      }

      setState(() {});
    });
  }
}
