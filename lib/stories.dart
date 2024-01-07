import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:story_tellingapp/home.dart';
import 'package:story_tellingapp/viewstory.dart';

class story extends StatefulWidget {
  const story({super.key});

  @override
  State<story> createState() => _storyState();
}

class _storyState extends State<story> {
  List<String> storyTitles = [
    "storyname1",
    "storyname2",
    "storyname3",
    "storyname4",
  ];
  List<String> storyContent = [
    'paragraph1',
    'paragraph1',
    'paragraph1',
    'paragraph1'
  ];

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: screenHeight,
            width: screenWidth,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.purple,
                    Colors.purple.shade300,
                    Colors.purple.shade200
                  ]),
            ),
            child: Column(
              children: [
                BackButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: 10),
                Text('Stories',
                    style: TextStyle(
                        fontSize: 30,
                        fontStyle: FontStyle.normal,
                        color: Colors.white70)),
                ListView.builder(
                    itemCount: storyTitles.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      view(storyTitle: storyTitles[index],
                                      storyContent: storyContent[index]),
                                ));
                          },
                          child: Container(
                            height: 100,
                            width: screenWidth / 1.2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.lightBlueAccent),
                            child: Text(storyTitles[index]),
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
