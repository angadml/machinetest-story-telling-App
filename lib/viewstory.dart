import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class view extends StatefulWidget {
  const view({required this.storyTitle, required this.storyContent});
  final String storyTitle;
  final String storyContent;

  @override
  State<view> createState() => _viewState();
}

class _viewState extends State<view> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
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
                Padding(
                  padding: const EdgeInsets.only(right: 350, top: 20),
                  child: BackButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Text(
                  'STORY',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      color: Colors.white38),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white38),
                  height: 55,
                  width: 350,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.storyTitle),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white38),
                    height: 150,
                    width: 350,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.storyContent),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
