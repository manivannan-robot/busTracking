// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BusLists extends StatefulWidget {
  const BusLists({super.key});

  @override
  State<BusLists> createState() => _BusListsState();
}

class _BusListsState extends State<BusLists> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body:

            //Custom AppBar
            Column(
          children: [
            Container(
              height: 100,
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                color: Color(0xFF4885ED),
              ),

              //School Name
              child: Center(
                child: Text(
                  'ISLAMIYA SCHOOL',
                  style: GoogleFonts.inter(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 13.93,
            ),

            //PlaceHolder Cards

            Padding(
              padding: const EdgeInsets.only(right: 11.0, left: 11.0),
              child: Container(
                height: 48.68,
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(5)),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 11.0, left: 11.0),
              child: Container(
                height: 48.68,
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(5)),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 11.0, left: 11.0),
              child: Container(
                height: 48.68,
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(5)),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 11.0, left: 11.0),
              child: Container(
                height: 48.68,
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(5)),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 11.0, left: 11.0),
              child: Container(
                height: 48.68,
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(5)),
              ),
            ),
            SizedBox(
              height: 12,
            ),
          ],
        ),

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


