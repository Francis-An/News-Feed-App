import 'package:atunews/views/enumeration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;
import 'package:atunews/views/logoutDialog.dart';

class PopupMenu extends StatelessWidget {
  // final List<PopupMenuEntry> menuList;
  final Widget? icon;
  const PopupMenu({Key? key, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuAction>(
      onSelected: (value) async {
        switch (value) {
          case MenuAction.logout:
            final shouldLogout = await showLogoutDialog(context);
            if(shouldLogout){
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushNamedAndRemoveUntil('/login/', (route) => false);
            }
            break;
          default:
        }
      },
      itemBuilder: (BuildContext context) {
        return [
          const PopupMenuItem(
            value: MenuAction.profile,
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text("My Profile"),
            ),
          ),
          const PopupMenuItem(
            value: MenuAction.settings,
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
            ),
          ),
          const PopupMenuDivider(),
          const PopupMenuItem(
            value: MenuAction.logout,
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
            ),
          ),
        ];
      },
      icon: icon,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    );
  }
}
