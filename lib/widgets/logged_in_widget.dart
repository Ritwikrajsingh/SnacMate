import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:snacmate/pages/chat/chats_main.dart';
import 'package:snacmate/services/card_provider.dart';
import 'package:snacmate/services/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:snacmate/widgets/tinder_card.dart';

class LoggedInWidget extends StatefulWidget {
  const LoggedInWidget({Key? key}) : super(key: key);

  @override
  State<LoggedInWidget> createState() => _LoggedInWidgetState();
}

class _LoggedInWidgetState extends State<LoggedInWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    final _widgetOptions = <Widget>[swiper(), ChatsPage()];

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text("SnacMate"),
          //centerTitle: true,
          actions: [
            TextButton(
              child: const Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logout();
              },
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.view_carousel), label: "Swiper"),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
          ],
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        body: _widgetOptions.elementAt(_selectedIndex));
  }

  Widget swiper() => SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: buildCards(),
        ),
      );

  Widget buildCards() {
    final provider = Provider.of<CardProvider>(context);
    final u = provider.u;
    final users = List<User>.filled(5, FirebaseAuth.instance.currentUser!);

    // return Stack(
    //   children: users
    //       .map((user) => TinderCard(user: user, isFront: users.last == user))
    //       .toList(),
    // );

    return Stack(
      children: [
        const Center(child: Text("Fetching You SnacMates...")),
        for (int i = 0; i < u; i++)
          TinderCard(
            user: i,
            isFront: i == u - 1,
          ),
      ],
    );
  }
}
