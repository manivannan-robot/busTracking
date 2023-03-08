import 'package:flutter/material.dart';

class MyPasswordField extends StatefulWidget {
  final controller;
  final String hintText;
  const MyPasswordField({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  State<MyPasswordField> createState() => _MyPasswordFieldState();
}

@override
class _MyPasswordFieldState extends State<MyPasswordField> {
  bool _pwdVisible = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: TextFormField(
        obscureText: !_pwdVisible,
        controller: widget.controller,
        decoration: InputDecoration(
            labelText: 'Confirm Password',
            suffixIcon: IconButton(
              icon: Icon(
                // Based on passwordVisible state choose the icon
                _pwdVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.black,
              ),
              onPressed: () {
                // Update the state i.e. toogle the state of passwordVisible variable
                setState(() {
                  _pwdVisible = !_pwdVisible;
                });
              },
            ),
            focusColor: Color(0xFF4885ED)),
      ),
    );
  }
}
