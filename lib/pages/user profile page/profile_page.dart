import 'package:flutter/material.dart';
import 'package:snacmate/model/user.dart';
import 'package:snacmate/utils/user_preferences.dart';
import 'package:snacmate/widgets/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({ Key? key }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = userPreferences.myUser;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: BackButton(color: Colors.black,),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {},
          ),
          const SizedBox(height: 24,),
          buildName(user),
        ],
      ),
    );
  }

  Widget buildName(User user) => Column(
    children: [
      Text(
        user.name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(height: 4,),
        Text(user.email,
        style: TextStyle(color: Colors.grey),)
    ],
  );
}

