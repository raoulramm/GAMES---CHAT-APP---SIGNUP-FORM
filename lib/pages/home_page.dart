import 'package:firebase_auth/firebase_auth.dart';
import 'package:app/auth.dart';
import 'package:flutter/material.dart';
import 'package:app/tabs/first_tab.dart';
import 'package:app/tabs/second_tab.dart';
import 'package:app/tabs/third_tab.dart';


class CurvedAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100, // Adjust the height as needed
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromARGB(255, 194, 10, 10), Color.fromARGB(255, 36, 2, 2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Text(
          'M I N I 🎮A M E S',
          style: TextStyle(
            fontSize: 28, // Adjust the font size
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}


class HomePage extends StatelessWidget{
  HomePage({Key? key}) : super(key: key);

  final User? user = Auth().currentUser;

  Future<void> signOut() async{
    await Auth().signOut();
  }

  Widget _title(){
    return const Text('Firebase Auth');
  }

  Widget _userUid(){
    return Text (user?.email ?? 'user email');
  }

  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signOut,
      child: const Text('sign out')
    );
  }
 @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100), // Adjust the height to match the CurvedAppBar
          child: CurvedAppBar(),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  FirstTab(),
                  SecondTab(),
                  ThirdTab(),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 194, 10, 10), Color.fromARGB(255, 36, 2, 2)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: TabBar(
                unselectedLabelColor: Colors.white,
                labelColor: Color.fromARGB(255, 204, 9, 9),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  color: Colors.white,
                ),
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.home,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.message_rounded,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.settings,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}