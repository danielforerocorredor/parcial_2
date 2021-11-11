import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/svg.dart';

class clima extends StatelessWidget {
  @override
  final String nombre;
  final String codigo;
  final String temperatura;
  final String velocidad_viento;
  final String humedad;
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Clima"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.search,
            size: 30,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
      body: Container(
          child: Stack(
        children: [
          Image.asset(
            "assets/night.jpg",
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
              padding: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 120,
                              ),
                              Text(
                                nombre + "  (" + codigo + ")",
                                style: GoogleFonts.lato(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text(
                                "10:07 PM -- friday, 8 Nov 2020",
                                style: GoogleFonts.lato(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ]),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 120,
                              ),
                              Text(
                                temperatura + "\u2103",
                                style: GoogleFonts.lato(
                                    fontSize: 85,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white),
                              ),
                              Row(children: [
                                SvgPicture.asset(
                                  'assets/moon.svg',
                                  width: 20,
                                  height: 20,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Night",
                                  style: GoogleFonts.lato(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ])
                            ])
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 80,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.white30,
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(60, 20, 60, 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Wind",
                                    style: GoogleFonts.lato(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    velocidad_viento,
                                    style: GoogleFonts.lato(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "Km/h",
                                    style: GoogleFonts.lato(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        height: 5,
                                        width: 50,
                                        color: Colors.white38,
                                      ),
                                      Container(
                                        height: 5,
                                        width: 5,
                                        color: Colors.greenAccent,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Humity",
                                    style: GoogleFonts.lato(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    humedad,
                                    style: GoogleFonts.lato(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "%",
                                    style: GoogleFonts.lato(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        height: 5,
                                        width: 50,
                                        color: Colors.white38,
                                      ),
                                      Container(
                                        height: 5,
                                        width: 5,
                                        color: Colors.greenAccent,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ]),
                      )
                    ],
                  )
                ],
              ))
        ],
      )),
    );
  }

  clima(this.nombre, this.codigo, this.temperatura, this.humedad,
      this.velocidad_viento);
}
