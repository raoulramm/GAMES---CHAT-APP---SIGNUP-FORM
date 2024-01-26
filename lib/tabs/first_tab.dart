import 'dart:ui';
import 'package:app/pages/GamePage/export.dart';
import 'package:flutter/material.dart';

class FirstTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/logo.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Center(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5,
              sigmaY: 5,
            ),
            child: Container(
              color: Colors.black.withOpacity(0.3),
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildBlock('Tic Tac Toe', 'Classic strategy game where two players take turns marking a 3x3 grid, aiming to get three of their symbols in a row.', 'assets/images/tiktak.jpg', context),
                    _buildBlock('Hangman ', 'Word-guessing game with limited incorrect guesses', 'assets/images/hangman.jpg', context),
                    _buildBlock('Snake', 'Eat, grow, avoid collisions.', 'assets/images/snake.jpg', context),
                    _buildBlock('Rocket Shooting', 'Navigate a rocket, shooting obstacles for points', 'assets/images/shooting.jpg', context),
                    _buildBlock('Tetromino puzzle', 'Arrange falling blocks to complete lines and score points.', 'assets/images/puzzle.jpg', context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

 Widget _buildBlock(String heading, String paragraph, String backgroundImage,BuildContext context) {
  Color paragraphColor;
  if(backgroundImage == 'assets/images/hangman.jpg') {
    paragraphColor = Colors.black;
  } else if(backgroundImage == 'assets/images/snake.jpg' || backgroundImage == 'assets/images/shooting.jpg') {
    paragraphColor = Colors.white;
  } else {
    paragraphColor = Colors.white;
  }

  return Container(
    height: 190,
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      image: DecorationImage(
        image: AssetImage(backgroundImage),
        fit: BoxFit.cover,
      ),
    ),
    child: Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          SizedBox(height: 10),
          Text(
            paragraph,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: paragraphColor,
            ),
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.bottomRight,
            child:ElevatedButton(
  onPressed: () {
    if (backgroundImage == 'assets/images/hangman.jpg') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HangmanPage()),
      );
    } else if (backgroundImage == 'assets/images/tiktak.jpg') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TicTacToePage()),
      );
    }
else if(backgroundImage == 'assets/images/puzzle.jpg'){
 Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TetrominoPage()),
      );
}
else if(backgroundImage == 'assets/images/shooting.jpg'){
 Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ShootingPage()),
      );
}
else if(backgroundImage == 'assets/images/snake.jpg'){
 Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SnakeGamePage()),
      );
}
  },
  child: Text('play'),
),
          ),
        ],
      ),
    ),
  );
}
}