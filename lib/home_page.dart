import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/custom_dailog.dart';
import 'package:tic_tac_toe/game_button.dart';

class HomePage extends StatefulWidget {
  String selectedText;
   HomePage( this.selectedText,
       {Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


   List<GameButton> buttonsList = [];
  var player1;
  var player2;
  var activePlayer;
  String unSelectedText = "";
  bool unSelected = true;
  bool won = false;
  String result = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    buttonsList = doInit();
    if(widget.selectedText == "X"){
      setState(() {
        unSelectedText = "O";
      });
    }else{
      setState(() {
        unSelectedText = "X";
      });
    }
  }


  List<GameButton> doInit() {
    player1 =  [];
    player2 =  [];
    activePlayer = 1;

    var gameButtons = <GameButton>[
       GameButton(id: 1),
       GameButton(id: 2),
       GameButton(id: 3),
       GameButton(id: 4),
       GameButton(id: 5),
       GameButton(id: 6),
       GameButton(id: 7),
       GameButton(id: 8),
       GameButton(id: 9),
    ];
    return gameButtons;
  }

  void playGame(GameButton gb) {
    setState(() {
      if (activePlayer == 1) {
        gb.text = widget.selectedText;
        gb.bg = const Color(0xff967bb6);
        gb.txtClr = Colors.black;
            //Colors.red;
        activePlayer = 2;
        player1.add(gb.id);
      } else {
        gb.text = unSelectedText;
        gb.bg = Colors.black;
        gb.txtClr = const Color(0xff967bb6);
        activePlayer = 1;
        player2.add(gb.id);
      }
      gb.enabled = false;
      int winner = checkWinner();
      if (winner == -1) {
        if (buttonsList.every((p) => p.text != "")) {
          setState(() {
            result = "Draw";
            won = true;
          });
          // showDialog(
          //     context: context,
          //     builder: (_) => new CustomDialog("Game Tied",
          //         "Press the reset button to start again.", resetGame));
        } else {
          activePlayer == 2 ?
          //aiWin() : null;
          autoPlay() : null;
        }
      }
    });
  }


  void autoPlay() {
    var emptyCells = [];
    var list = List.generate(9, (i) => i + 1);
    for (var cellID in list) {
      if ((!player1.contains(cellID) || player2.contains(cellID))) {
        emptyCells.add(cellID);
      }
    }

    var r = Random();
    var randIndex = r.nextInt(emptyCells.length - 1);
    var cellID = emptyCells[randIndex];
    int i = buttonsList.indexWhere((p) => p.id == cellID);
    playGame(buttonsList[i]);

  }
  void stopWinning(){


  }
   int checkWinner() {
     var winner = -1;
     if (player1.contains(1) && player1.contains(2) && player1.contains(3)) {
       winner = 1;
     }
     if (player2.contains(1) && player2.contains(2) && player2.contains(3)) {
       winner = 2;
     }

     // row 2
     if (player1.contains(4) && player1.contains(5) && player1.contains(6)) {
       winner = 1;
     }
     if (player2.contains(4) && player2.contains(5) && player2.contains(6)) {
       winner = 2;
     }

     // row 3
     if (player1.contains(7) && player1.contains(8) && player1.contains(9)) {
       winner = 1;
     }
     if (player2.contains(7) && player2.contains(8) && player2.contains(9)) {
       winner = 2;
     }

     // col 1
     if (player1.contains(1) && player1.contains(4) && player1.contains(7)) {
       winner = 1;
     }
     if (player2.contains(1) && player2.contains(4) && player2.contains(7)) {
       winner = 2;
     }

     // col 2
     if (player1.contains(2) && player1.contains(5) && player1.contains(8)) {
       winner = 1;
     }
     if (player2.contains(2) && player2.contains(5) && player2.contains(8)) {
       winner = 2;
     }

     // col 3
     if (player1.contains(3) && player1.contains(6) && player1.contains(9)) {
       winner = 1;
     }
     if (player2.contains(3) && player2.contains(6) && player2.contains(9)) {
       winner = 2;
     }

     //diagonal
     if (player1.contains(1) && player1.contains(5) && player1.contains(9)) {
       winner = 1;
     }
     if (player2.contains(1) && player2.contains(5) && player2.contains(9)) {
       winner = 2;
     }

     if (player1.contains(3) && player1.contains(5) && player1.contains(7)) {
       winner = 1;
     }
     if (player2.contains(3) && player2.contains(5) && player2.contains(7)) {
       winner = 2;
     }

     if (winner != -1) {
       if (winner == 1) {
         setState(() {
           result = "You Won";
           won = true;
         });

       } else {
         setState(() {
           result = "You Lose";
           won = true;
         });
       }
     }

     return winner;
   }

  // int checkWinner() {
  //   var winner = -1;
  //   if (player.contains(1) && player.contains(2) && player.contains(3) ||
  //       player.contains(4) && player.contains(5) && player.contains(6) ||
  //       player.contains(7) && player.contains(8) && player.contains(9) ||
  //       player.contains(1) && player.contains(4) && player.contains(7) ||
  //       player.contains(2) && player.contains(5) && player.contains(8) ||
  //       player.contains(3) && player.contains(6) && player.contains(9) ||
  //       player.contains(1) && player.contains(5) && player.contains(9) ||
  //       player.contains(3) && player.contains(5) && player.contains(7)) {
  //     setState(() {
  //       winner = 1;
  //     });
  //   }
  //   if (computer.contains(1) && computer.contains(2) && computer.contains(3) ||
  //       computer.contains(4) && computer.contains(5) && computer.contains(6) ||
  //       computer.contains(7) && computer.contains(8) && computer.contains(9) ||
  //       computer.contains(1) && computer.contains(4) && computer.contains(7) ||
  //       computer.contains(2) && computer.contains(5) && computer.contains(8) ||
  //       computer.contains(3) && computer.contains(6) && computer.contains(9) ||
  //       computer.contains(1) && computer.contains(5) && computer.contains(9) ||
  //       computer.contains(3) && computer.contains(5) && computer.contains(7)) {
  //     setState(() {
  //       winner = 2;
  //     });
  //   }
  //
  //   // if (computer.contains(1) && computer.contains(2) && computer.contains(3)) {
  //   //   winner = 2;
  //   // }
  //   //
  //   // // row 2
  //   // // if (player.contains(4) && player.contains(5) && player.contains(6)) {
  //   // //   winner = 1;
  //   // // }
  //   // if (computer.contains(4) && computer.contains(5) && computer.contains(6)) {
  //   //   winner = 2;
  //   // }
  //   //
  //   // // row 3
  //   // // if (player.contains(7) && player.contains(8) && player.contains(9)) {
  //   // //   winner = 1;
  //   // // }
  //   // if (computer.contains(7) && computer.contains(8) && computer.contains(9)) {
  //   //   winner = 2;
  //   // }
  //   //
  //   // // col 1
  //   // // if (player.contains(1) && player.contains(4) && player.contains(7)) {
  //   // //   winner = 1;
  //   // // }
  //   // if (computer.contains(1) && computer.contains(4) && computer.contains(7)) {
  //   //   winner = 2;
  //   // }
  //   //
  //   // // col 2
  //   // // if (player.contains(2) && player.contains(5) && player.contains(8)) {
  //   // //   winner = 1;
  //   // // }
  //   // if (computer.contains(2) && computer.contains(5) && computer.contains(8)) {
  //   //   winner = 2;
  //   // }
  //   //
  //   // // col 3
  //   // // if (player.contains(3) && player.contains(6) && player.contains(9)) {
  //   // //   winner = 1;
  //   // // }
  //   // if (computer.contains(3) && computer.contains(6) && computer.contains(9)) {
  //   //   winner = 2;
  //   // }
  //   //
  //   // //diagonal
  //   // // if (player.contains(1) && player.contains(5) && player.contains(9)) {
  //   // //   winner = 1;
  //   // // }
  //   // if (computer.contains(1) && computer.contains(5) && computer.contains(9)) {
  //   //   winner = 2;
  //   // }
  //   //
  //   // // if (player.contains(3) && player.contains(5) && player.contains(7)) {
  //   // //   winner = 1;
  //   // // }
  //   // if (computer.contains(3) && computer.contains(5) && computer.contains(7)) {
  //   //   winner = 2;
  //   // }
  //
  //   if (winner != -1) {
  //     if (winner == 1) {
  //       setState(() {
  //         result = "You Won";
  //         won = true;
  //       });
  //       // showDialog(
  //       //     context: context,
  //       //     builder: (_) =>
  //               // CustomDialog("You Won",
  //               // "Press the reset button to start again.", resetGame));
  //     } else {
  //       setState(() {
  //         result = "You Lose";
  //         won = true;
  //       });
  //       // showDialog(
  //       //     context: context,
  //       //     builder: (_) => new CustomDialog("Player 2 Won",
  //       //         "Press the reset button to start again.", resetGame));
  //     }
  //   }
  //
  //   return winner;
  // }

  void resetGame() {
    if (Navigator.canPop(context)) Navigator.pop(context);
    setState(() {
      buttonsList = doInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,

        body:  Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: Text("You selected ${widget.selectedText}",
                    style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color:  Color(0xff967bb6)
                    )),
              ),

               Expanded(
                child:  GridView.builder(
                  padding: const EdgeInsets.all(10.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.0,
                      crossAxisSpacing: 9.0,
                      mainAxisSpacing: 9.0),
                  itemCount: buttonsList.length,
                  itemBuilder: (context, i) =>  GestureDetector(
                    onTap: buttonsList[i].enabled
                        ? () => playGame(buttonsList[i])
                        : null,
                        child:  Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                              color: buttonsList[i].bg,
                              borderRadius: BorderRadius.circular(15)
                          ),
                         // padding: const EdgeInsets.all(8.0),

                          child:  Center(
                            child: Text(
                              buttonsList[i].text,
                              style:  TextStyle(
                                  color: buttonsList[i].txtClr,
                                  // activePlayer == 2 ? Colors.black : const Color(0xff967bb6),
                                  fontSize: 80.0,
                              fontWeight: FontWeight.w900),
                            ),
                          ),
                          // color: buttonsList[i].bg,
                          // disabledColor: buttonsList[i].bg,
                        ),
                      ),
                ),
              ),
              Visibility(
                  visible: won,
                  child:  Text(result,
                    style: const TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color:  Color(0xff967bb6)
                    ),)),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: GestureDetector(
                  onTap: resetGame,
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: const BoxDecoration(
                      color:  Color(0xff967bb6),
                      shape:  BoxShape.circle
                    ),
                    child: Icon(Icons.replay, color: Colors.black,
                    size: 80,),
                  ),
                ),
              )
              //  RaisedButton(
              //   child: new Text(
              //     "Reset",
              //     style: new TextStyle(color: Colors.white, fontSize: 20.0),
              //   ),
              //   color: Colors.red,
              //   padding: const EdgeInsets.all(20.0),
              //   onPressed: resetGame,
              // )
            ],
          ),
        ));
  }






}
