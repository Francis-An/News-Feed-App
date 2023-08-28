import 'package:atunews/views/carousel.dart';
import 'package:flutter/material.dart';
import 'package:atunews/views/app_bar.dart';
import 'package:intl/intl.dart';

import 'card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    var date = DateTime.now();
    var dateFormate = DateFormat('EEEE, dd MMM').format(date);
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Begin of app bar
          const MyAppBar(),
          //End of AppBar

          //List
          Expanded(
            child: ListView(
              children: <Widget>[
                //Month, date, day
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dateFormate,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                //End of month, date, day
                // const Padding(padding: EdgeInsets.all(5)),
                // const Carousel(),
                const Padding(padding: EdgeInsets.all(10)),
                //List of post
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Column(
                    children: [
                      CardBox(
                        title: "ENTERTAINMENT",
                        description:
                            "Nana Krobea Asante I, Adontenhene of Mpraeso, and Kwahu, who was a guest judge on the show",
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      // const CardBox(),
                    ],
                  ),
                ),
                //end of post
              ],
            ),
          ),
          //End of list
        ],
      ),
    );
  }
}
