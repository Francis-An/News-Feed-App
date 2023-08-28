import 'package:atunews/views/post_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardBox extends StatelessWidget {
  const CardBox({super.key, this.title, this.description});
  final String? title;
  final String? description;
  // late String department;
  // late String image;

  // late String title;
  // late String description;

  // late String department;

  // late String image;

  @override
  Widget build(BuildContext context) {
    const primary_color = Color(0xff1E4B7F);
    const secondary_color = Color(0xffD3AF35);
    return Container(
      height: 180,
      // padding: EdgeInsets.all(0),
      child: Stack(
        children: [
          Container(
            height: 170,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    offset: const Offset(-10, 10),
                    blurRadius: 20.0,
                    spreadRadius: 4,
                  ),
                ]),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Card(
              elevation: 10,
              shadowColor: Colors.grey.withOpacity(0.5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                width: 170,
                height: 163,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      fit: BoxFit.fill, image: AssetImage('assets/ATU5.jpg')),
                ),
              ),
            ),
          ),
          //end of the image card
          //start of the text of the card
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              // color: Colors.yellow,
              width: 173,
              height: 180,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      title.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: primary_color,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(6)),
                    Container(
                      height: 58,
                      child: Text(
                        description.toString(),
                        style: const TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(0)),
                    const Text(
                      "DEPARTMENT:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: primary_color,
                      ),
                    ),
                    const Text(
                      "Computer Science ",
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.thumb_up,
                            size: 15,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.message,
                            size: 15,
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              '/postView/',
                              // (route) => false
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          //end of the text of the card
        ],
      ),
    );
  }
}
