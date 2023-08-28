import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    const primary_color = Color(0xff1E4B7F);
    const secondary_color = Color(0xffD3AF35);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: primary_color,
                    size: 30,
                    
                  ),
                  onPressed: () {},
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: primary_color,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(Icons.person),
                ),
              ],
            ),
            Row(
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
           
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.all(20)),
                  Row(
                    children: [Text("Annort")],
                  ),
                  Padding(padding: EdgeInsets.all(20)),
                  Row(
                    children: [Text("Annort")],
                  ),
                  Padding(padding: EdgeInsets.all(20)),
                  Row(
                    children: [Text("Annort")],
                  ),
                  Padding(padding: EdgeInsets.all(20)),
                  Row(
                    children: [Text("Annort")],
                  ),
                  Padding(padding: EdgeInsets.all(2)),
                  Row(
                    children: [Text("Annort")],
                  ),
                  Padding(padding: EdgeInsets.all(20)),
                  Row(
                    children: [Text("Annort")],
                  ),
                  Padding(padding: EdgeInsets.all(20)),
                  Row(
                    children: [Text("Annort")],
                  ),
                  Padding(padding: EdgeInsets.all(20)),
                  Row(
                    children: [Text("Annort")],
                  ),
                  Padding(padding: EdgeInsets.all(20)),
                  Row(
                    children: [Text("Annort")],
                  ),
                  Padding(padding: EdgeInsets.all(20)),
                  Row(
                    children: [Text("Annort")],
                  ),
                  Padding(padding: EdgeInsets.all(20)),
                  Row(
                    children: [Text("Annort")],
                  ),
                  Padding(padding: EdgeInsets.all(20)),
                  Row(
                    children: [Text("Annort")],
                  ),
                  Padding(padding: EdgeInsets.all(20)),
                  Row(
                    children: [Text("Annort")],
                  ),
                  Padding(padding: EdgeInsets.all(20)),
                  Row(
                    children: [Text("Annort")],
                  ),
                  Padding(padding: EdgeInsets.all(20)),
                  Row(
                    children: [Text("Annort")],
                  ),
                  Padding(padding: EdgeInsets.all(20)),
                  Row(
                    children: [Text("Annort")],
                  ),
                  Padding(padding: EdgeInsets.all(20)),
                  Row(
                    children: [Text("Annort")],
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
