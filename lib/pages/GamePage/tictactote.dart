import 'package:flutter/material.dart';
import 'package:app/pages/tictactoe page/home/home_page.dart';
import 'package:get/get.dart';

class TicTacToePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            _buildBlock(
              'AI OR TWOPLAYERS',
              'Classic strategy game where two players take turns marking a 3x3 grid, aiming to get three of their symbols in a row.',
              'assets/images/tiktak.jpg',
              context,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBlock(
    String heading,
    String paragraph,
    String backgroundImage,
    BuildContext context,
  ) {
    Color paragraphColor;
    if (backgroundImage == 'assets/images/tiktakjpg') {
      paragraphColor = Colors.black;
    } else if (backgroundImage == 'assets/images/tiktak.jpg' ||
        backgroundImage == 'assets/images/tiktak.jpg') {
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
              child: ElevatedButton(
                onPressed: () {
                  if (backgroundImage == 'assets/images/tiktak.jpg') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  } else if (backgroundImage == 'assets/images/tiktak.jpg') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TicTacToePage()),
                    );
                  }
                },
                child: Text('Play'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}