import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class auth extends StatefulWidget {
  const auth({super.key});

  @override
  State<auth> createState() => _authState();
}

class _authState extends State<auth> {
  @override
  Widget build(BuildContext context) {
    var hightM = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: hightM,
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
                BackButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: 20),
                Text('Welcome Back, Author',
                    style: TextStyle(
                        fontSize: 30,
                        fontStyle: FontStyle.normal,
                        color: Colors.white70)),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('ADD Story',
                          style: TextStyle(
                              fontSize: 30,
                              backgroundColor: Colors.purple,
                              fontStyle: FontStyle.normal,
                              color: Colors.white70)),
                    ),
                  ],
                ),
                Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 10, top: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.book_online_outlined),
                        hintText: 'Story Name',
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 10, top: 10),
                  child: TextField(
                    maxLines: null,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.book_online_outlined),
                      contentPadding: EdgeInsets.symmetric(vertical: 100.0),
                      hintText: 'Story',
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: () {

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple, // Set your preferred color
                  ),
                  child: Text('Pick Audio',style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600,
                      color: Colors.white),),
                ),
                SizedBox(height: 16),
                // _selectedAudio != null?
                Text('Selected Audio: '),
                Container(),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple, // Set your preferred color
                  ),
                  child: Text(
                    'Upload Audio',style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600,
                      color: Colors.white),
                  ),
                ),
                SizedBox(height: 10,),

                ElevatedButton(
                  onPressed: () {
                    //Navigator.push(context,
                    //MaterialPageRoute(builder: (context) => ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple, // Set your preferred color
                  ),
                  child: Text("SUBMIT",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600,
                          color: Colors.white)),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
