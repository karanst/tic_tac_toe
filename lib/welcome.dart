import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/select.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  bool color = false;

  @override
  void initState() {



    // else if(color = true){
      setState(() {
        color = !color;
      });
    // }
    super.initState();
    }


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: color ? Colors.black : const Color(0xff967bb6),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 40.0),
                child: Text("Tic-Tac-Toe",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: color ? const Color(0xff967bb6) : Colors.black
                    //   Color(0xff967bb6)
                  ),),
              ),
              Text("XO",
                style: TextStyle(
                    fontSize: 200,
                    fontWeight: FontWeight.w900,
                    color: color ? const Color(0xff967bb6) : Colors.black
                  //   Color(0xff967bb6)
                ),),
              Text("OX",
                style: TextStyle(
                    fontSize: 200,
                    fontWeight: FontWeight.w900,
                    color: color ? const Color(0xff967bb6) : Colors.black
                  //   Color(0xff967bb6)
                ),),
              // Row(
              //   children: [
              //     SizedBox(
              //       height: 180,
              //       width: 180,
              //       child: Image.asset('assets/X.jpg'),
              //     ),
              //     SizedBox(
              //       height: 180,
              //       width: 180,
              //       child: Image.asset('assets/O.jpg'),
              //     )
              //   ],
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => Select()));
                    },
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        primary: color ? const Color(0xff967bb6) : Colors.black,
                        fixedSize: Size(
                            MediaQuery
                                .of(context)
                                .size
                                .width, 50)),
                    child: Text("Play game",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: color ? Colors.black : const Color(0xff967bb6)
                      ),)),
              )

            ],
          ),
        ),
      );
    }
  }


