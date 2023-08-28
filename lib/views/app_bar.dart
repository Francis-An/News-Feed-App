import 'package:atunews/views/enumeration.dart';
import 'package:atunews/views/logoutDialog.dart';
import 'package:atunews/views/pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    const primary_color = Color(0xff1E4B7F);
    const secondary_color = Color(0xffD3AF35);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(0),
                child: IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: primary_color,
                    size: 40,
                  ),
                  onPressed: () {},
                ),
              ),
              const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: PopupMenu(
                    
                    icon: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://imgv3.fotor.com/images/gallery/Realistic-Male-Profile-Picture.jpg"),
                      // child: Icon(Icons.person),
                    ),
                  ),),
            ],
          ),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  text: "News",
                  style: TextStyle(
                      color: primary_color,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                  children: [
                    TextSpan(
                        text: "Hub",
                        style: TextStyle(
                            color: secondary_color,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
