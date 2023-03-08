// ignore_for_file: prefer_const_constructors

import 'package:azep_bus_app/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SchoolSelectPage extends StatefulWidget {
  const SchoolSelectPage({super.key});

  @override
  State<SchoolSelectPage> createState() => _SchoolSelectPageState();
}

class _SchoolSelectPageState extends State<SchoolSelectPage> {
  String dropdownValue = 'One';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 130,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 145.0,
                ),
                child: Row(
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(
                          0xFF4885ED,
                        ),
                      ),
                      child: Center(
                        child: TextButton(
                          child: Text(
                            '1',
                            style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xFFAEAEAE),
                        ),
                        child: Center(
                          child: TextButton(
                            child: Text(
                              '2',
                              style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700),
                            ),
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                                ((route) => route.isFirst),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 220,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 48.0),
                    child: Text(
                      'Select School',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: Color(0xFF939393),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 48.0, right: 48.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFF939393),
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: dropdownValue,
                      icon: Icon(Icons.arrow_drop_down_rounded),
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF939393),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          dropdownValue = value!;
                        });
                      },
                      items: const [
                        DropdownMenuItem<String>(
                          value: 'One',
                          child: Text('Islamia. Mat. Hr. Sec  School'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Two',
                          child: Text('Cresent. Mat. Hr. Sec School'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Three',
                          child: Text('Mushraf. Mat. Hr. Sec School'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Four',
                          child: Text('Althaf Alluma. Arab School'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Next',
                      style: GoogleFonts.inter(
                          fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
