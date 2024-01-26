import 'package:app/pages/chat/chatpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app/auth.dart';

class SecondTab extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ElevatedButton(
          onPressed: () {
            // Check if the user is signed in
            if (user != null && user!.email != null) {
              // Navigate to the ChatPage with the actual user email
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => chatpage(email: user!.email!),
                ),
              );
            }
          },
          child: Text('Go to Chat Page'),
        ),
      ),
    );
  }
}