import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    const primary_color = Color(0xff1E4B7F);
    const secondary_color = Color(0xffD3AF35);
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //Start of the AppBar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //Menu Button
                IconButton(
                  padding: const EdgeInsets.all(0),
                  icon: const Icon(
                    Icons.menu,
                    color: primary_color,
                    size: 50,
                  ),
                  onPressed: () {},
                ),
                //Profile Image
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: primary_color,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: const Icon(Icons.person),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(5)),
            const Text.rich(
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
            //End of the AppBar
          ],
        ),
      ),
    );
  }
}
