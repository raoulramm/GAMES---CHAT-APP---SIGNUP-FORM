import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../game/game_page.dart';
import 'package:app/pages/tictactoe page/widgets/circle_widget.dart';
import 'package:app/pages/tictactoe page/widgets/cross_widget.dart';


part 'game_title_widget.dart';
part 'game_mode_selection_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      key: UniqueKey(), // Add this line
      home: const Column(
        children: [
          Spacer(flex: 2),
          GameTitleWidget(),
          Spacer(),
          GameModeSelectionWidget(),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}