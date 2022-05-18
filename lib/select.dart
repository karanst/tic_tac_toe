import 'package:flutter/material.dart';
import 'package:tic_tac_toe/home.dart';
import 'package:tic_tac_toe/home_page.dart';
import 'package:tic_tac_toe/main.dart';

class Select extends StatefulWidget {
  const Select({Key? key}) : super(key: key);

  @override
  _SelectState createState() => _SelectState();
}

class _SelectState extends State<Select> {
  String selectedText = "";
  bool colorX = false;
  bool colorO = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: const Text("Choose your Sign",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color(0xff967bb6)
            ),),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
              onTap: (){
                setState(() {
                  colorX = true;
                  if(colorX = true){
                    setState(() {
                      colorO = false;
                    });
                  }
                });
                Future.delayed(const Duration(milliseconds: 500), () {
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage(
                      selectedText = "X"
                    )));
                    // Here you can write your code for open new view
                  });
                });

              },
              child: Container(
                decoration: BoxDecoration(
                  color: colorX ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(20)
                ),
                width: double.infinity/2,
                height: 270,
                child: Center(
                  child: Text("X",
                  style: TextStyle(fontSize: 250,
                  fontWeight: FontWeight.w900,
                  color: colorX ?  const Color(0xff967bb6) : Colors.black ),),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
              onTap: (){
                setState(() {
                  colorO = true;
                  if(colorO = true){
                    setState(() {
                      colorX = false;
                    });
                  }
                });
                Future.delayed(const Duration(milliseconds: 500), () {
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage(
                      selectedText = "O"
                    )));
                    // Here you can write your code for open new view
                  });
                });
              },
              child: Container(
                //padding: EdgeInsets.only(bottom: 30),
                decoration: BoxDecoration(
                    color: colorO ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(20)
                ),
                width: double.infinity/2,
                height: 270,
                child: Center(
                  child: SizedBox(
                    child: Text("O",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 250,
                          fontWeight: FontWeight.w900,
                          color: colorO ?  const Color(0xff967bb6) : Colors.black ),),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
