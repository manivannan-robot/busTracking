

import 'package:azep_bus_app/pages/password_fields.dart';
import 'package:azep_bus_app/pages/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordPage extends StatefulWidget {

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  var backpressedTime;
  final PasswordControllerOld = TextEditingController();
  final PaswordControllerNew = TextEditingController();
  final PasswordControllerReEnter = TextEditingController();
  final PasswordControllerTFF = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            SizedBox(
              height: 260,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 48.0, right: 48.0),
              child: MyTextField(
                  controller: PasswordControllerOld,
                  hintText: 'Old Password',
                  obscureText: true),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 48.0, right: 48.0),
              child: MyTextField(
                  controller: PaswordControllerNew,
                  hintText: 'New Password',
                  obscureText: true),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 48.0, right: 48.0),
              child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFF939393),
                    ),
                  ),
                  child: MyPasswordField(
                    controller: PasswordControllerTFF,
                    hintText: 'Confirm Password',
                  )),
            ),
            SizedBox(
              height: 33,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 48.0, right: 48.0),
              child: SizedBox(
                width: size.width,
                height: 39,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF4885ED),
                  ),
                  onPressed: () {

                  },
                  child: Text(
                    'Save',
                    style: GoogleFonts.inter(
                        fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }



}
