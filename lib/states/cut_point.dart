// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:goodstudent/models/profile_student_model.dart';
import 'package:goodstudent/utility/my_constant.dart';
import 'package:goodstudent/utility/my_dialog.dart';
import 'package:goodstudent/widgets/show_button.dart';
import 'package:goodstudent/widgets/show_image.dart';
import 'package:goodstudent/widgets/show_text.dart';
import 'package:image_picker/image_picker.dart';

class CutPoint extends StatefulWidget {
  final String isTeacher;
  final ProfileStudentModel profileStudentModel;
  const CutPoint({
    Key? key,
    required this.isTeacher,
    required this.profileStudentModel,
  }) : super(key: key);

  @override
  State<CutPoint> createState() => _CutPointState();
}

class _CutPointState extends State<CutPoint> {
  String? idTeacher;
  ProfileStudentModel? profileStudentModel;
  String? dateTimeCutPoint;

  var wrongdoings = MyConstant.wrongdoings;
  var wrongPoints = MyConstant.wrongPoint;
  var indexDropdowns = <int>[];
  int? indexDropdown;
  File? file;

  @override
  void initState() {
    super.initState();
    idTeacher = widget.isTeacher;
    profileStudentModel = widget.profileStudentModel;

    DateTime dateTime = DateTime.now();
    dateTimeCutPoint = dateTime.toString();

    for (var i = 0; i < wrongdoings.length; i++) {
      indexDropdowns.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ShowText(
          text: profileStudentModel!.nameStudent,
          textStyle: MyConstant().h2WhiteStyle(),
        ),
        backgroundColor: MyConstant.primary,
      ),
      body: Center(
        child: Column(
          children: [
            newImage(),
            newTimes(),
            dropDownWrong(),
            buttonSaveCUtPoint(),
          ],
        ),
      ),
    );
  }

  ShowButton buttonSaveCUtPoint() {
    return ShowButton(
      label: 'Save Cut Point',
      pressFunc: () {
        if (file == null) {
          MyDialog(context: context).normalDialog(
              title: 'Non Image ?', subTitle: 'Please Take Photo');
        } else if (indexDropdown == null) {
          MyDialog(context: context).normalDialog(
              title: 'No Wrong ?', subTitle: 'Please Choose Dropdown Wrong');
        } else {}
      },
    );
  }

  DropdownButton<dynamic> dropDownWrong() {
    return DropdownButton<dynamic>(
      hint: ShowText(text: 'โปรดเลือกความผิด'),
      value: indexDropdown,
      items: indexDropdowns
          .map(
            (e) => DropdownMenuItem(
              child: ShowText(
                text: '${wrongdoings[e]}  ===>>> ${wrongPoints[e]}',
              ),
              value: e,
            ),
          )
          .toList(),
      onChanged: (value) {
        setState(() {
          indexDropdown = value;
        });
      },
    );
  }

  ShowText newTimes() {
    return ShowText(
      text: dateTimeCutPoint ?? '',
      textStyle: MyConstant().h2Style(),
    );
  }

  Container newImage() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      width: 250,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: file == null
                ? const ShowImage(
                    path: 'images/camera.png',
                  )
                : Image.file(file!),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: IconButton(
                onPressed: () {
                  processTakePhoto();
                },
                icon: Icon(
                  Icons.add_a_photo,
                  size: 36,
                  color: MyConstant.active,
                )),
          )
        ],
      ),
    );
  }

  Future<void> processTakePhoto() async {
    await ImagePicker()
        .pickImage(
      source: ImageSource.camera,
      maxWidth: 800,
      maxHeight: 800,
    )
        .then((value) {
      setState(() {
        file = File(value!.path);
      });
    });
  }
}
