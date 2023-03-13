// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        color: Color(0xFF4885ED),
        height: 93.68,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Home Button
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.home_filled,
                    size: 35,
                    color: Color(0xFFF8F8F8),
                  ),
                ),
                SizedBox(
                  width: 65,
                ),

                //Settings Button
                IconButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, AppRoutes.settingsPage);
                  },
                  icon: Icon(
                    Icons.settings,
                    size: 35,
                    color: Color(0xFFF8F8F8),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
