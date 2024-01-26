import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth.dart';

// class ThirdTab extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       child: Center(
//         child: Text('SETTINGS', style: TextStyle(fontSize: 40),
//                     _signOutButton(),
//         ),
//       ),
//     );
//   }
// }

class ThirdTab extends StatelessWidget {
  ThirdTab({Key? key}) : super(key: key);

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return const Text('Firebase Auth');
  }

  Widget _userUid() {
    return Text(user?.email ?? 'user email');
  }

  Widget _signOutButton() {
    return ElevatedButton(
        onPressed: signOut,
        child: const Text('sign out')
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SETTINGS',
              style: TextStyle(fontSize: 40),
            ),
            _signOutButton(),
          ],
        ),
      ),
    );
  }
}







