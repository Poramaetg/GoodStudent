import 'package:flutter/material.dart';
import 'package:goodstudent/utility/my_constant.dart';
import 'package:goodstudent/utility/my_dialog.dart';
import 'package:goodstudent/widgets/show_button.dart';
import 'package:goodstudent/widgets/show_form.dart';
import 'package:goodstudent/widgets/show_image.dart';
import 'package:goodstudent/widgets/show_text.dart';

class Authen extends StatefulWidget {
  const Authen({Key? key}) : super(key: key);

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  String? user, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            newlogo(),
            newTitle(),
            formUser(),
            formPassword(),
            buttonLogin(),
          ],
        ),
      ),
    );
  }

  Container buttonLogin() {
    return Container(
      width: 250,
      margin: const EdgeInsets.only(top: 8),
      child: ShowButton(
        label: 'login',
        pressFunc: () {
          if ((user?.isEmpty ?? true) || (password?.isEmpty ?? true)) {
            MyDialog(context: context).normalDialog(
                title: 'Have Space ?', subTitle: 'Please Fill Every Blank');
          } else {}
        },
      ),
    );
  }

  Container formPassword() {
    return Container(
      width: 250,
      margin: const EdgeInsets.only(top: 16),
      child: ShowForm(
        hint: 'Password',
        iconData: Icons.lock_outline,
        changFunc: (String string) {
          password = string.trim();
        },
      ),
    );
  }

  Container formUser() {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      width: 250,
      child: ShowForm(
        hint: 'User :',
        iconData: Icons.perm_identity,
        changFunc: (String string) {
          user = string.trim();
        },
      ),
    );
  }

  ShowText newTitle() {
    return ShowText(
      text: 'Logo: 12345',
      textStyle: MyConstant().h2Style(),
    );
  }

  SizedBox newlogo() {
    return const SizedBox(
      width: 80,
      child: ShowImage(),
    );
  }
}
