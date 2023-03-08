import 'package:azep_bus_app/settings_page.dart';
import 'package:flutter/material.dart';

class SosPage extends StatelessWidget {
  const SosPage({super.key});

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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsPage(),
                  ),
                );
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
