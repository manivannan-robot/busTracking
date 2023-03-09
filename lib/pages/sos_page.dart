
import 'package:flutter/material.dart';

import '../routes/app_routes.dart';

class SosPage extends StatefulWidget {

  @override
  State<SosPage> createState() => _SosPageState();
}

class _SosPageState extends State<SosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Custom Navigation Bar
      bottomNavigationBar: Container(
        height: 93.68,
        color: Color(0xFF4885ED),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Home Button
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.busListPage);
              },
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
                Navigator.pushNamed(context, AppRoutes.settingsPage);
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
    );
  }
}
