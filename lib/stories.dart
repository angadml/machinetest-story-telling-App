import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:storytelling/viewstory.dart';


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
    return Scaffold(
      body: Container(

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
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10),
                  itemCount: storyTitles.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
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
                        margin: EdgeInsets.symmetric(vertical: 8),
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.lightBlueAccent),
                        child: Text(storyTitles[index]),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
