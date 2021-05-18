import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String _imageUrl =
        "https://lh3.googleusercontent.com/proxy/8MXxTyYm0j2zHuDR1msEaW0aJ3teEVY3XU-ohLHine3snpgo9azJFsOOBra65EpEf9S2S6jGUlVhxt67bXZ1JwVgA_YmkWozzv_5EHNI_C00dLS0wo2L31enaTuor4gP9N2ZuCr9d16F";

    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                //decoration: BoxDecoration(color: Colors.red),
                accountName: Text("Manu Wilder"),
                accountEmail: Text("lilcoolmanu@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage(_imageUrl),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                "Email",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
