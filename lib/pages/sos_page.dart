// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../routes/app_routes.dart';

class SosPage extends StatefulWidget {

  @override
  State<SosPage> createState() => _SosPageState();
}

class _SosPageState extends State<SosPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          SizedBox(
            height: 44,
          ),
          Center(
            child: Text(
              'SOS',
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.w900,

              ),
            ),
          ),
          SizedBox(
            height: 52,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 71.0, right: 72.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Container(
                    child: Image.asset('assets/images/BreakDown.png'),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Color(0xFFE20606),
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  onTap: () async{
                    Uri phoneno = Uri.parse('tel:9840119746');
                    if (await launchUrl(phoneno)) {

                    } else {
                      throw 'Could not launch $phoneno';
                    }

                  },
                ),
                GestureDetector(
                  child: Container(
                    height: 100,
                    child: Image.asset('assets/images/Medical.png', scale: 1.0),
                    width: 100,
                    decoration: BoxDecoration(
                        color: Color(0xFF16ADE1),
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  onTap: () async{
                    Uri phoneno = Uri.parse('tel:108');
                    if (await launchUrl(phoneno)) {

                    } else {
                    throw 'Could not launch $phoneno';
                    }
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 71.0, right: 72.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text(
                    'BREAKDOWN',
                    style: GoogleFonts.inter(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Text(
                    'MEDICAL',
                    style: GoogleFonts.inter(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 71.0, right: 72.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(
                    'EMERGENCY',
                    style: GoogleFonts.inter(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: Text(
                    'EMERGENCY',
                    style: GoogleFonts.inter(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          )
        ]),
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
                  Navigator.pushReplacementNamed(context, AppRoutes.busListPage);
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
                  Navigator.pushReplacementNamed(context, AppRoutes.settingsPage);
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
    );
  }
}
