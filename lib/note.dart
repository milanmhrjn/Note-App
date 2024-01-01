import 'dart:math';

import 'package:flutter/material.dart';
import 'package:note_app/add_notes.dart';
import 'package:note_app/colors.dart';
import 'package:note_app/notes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  randomColor() {
    Random randomColors = Random();
    return backgroundColors[randomColors.nextInt(backgroundColors.length)];
  }

  void deleteNotes(int index) {
    setState(() {
      sample.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 20),
              child: Text(
                "Notes",
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: sample.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: randomColor(),
                    child: ListTile(
                      onTap: () async {
                        final results = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => addNotes(
                                note: sample[index],
                              ),
                            ));
                        if (results != null) {
                          setState(() {
                            int originalIndex = sample.indexOf(sample[index]);
                            sample[originalIndex] = (Notes(
                                id: sample[originalIndex].id,
                                title: results[0],
                                content: results[1]));
                          });
                        }
                      },
                      title: Padding(
                        padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${sample[index].title}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${sample[index].content}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 25),
                            )
                          ],
                        ),
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: IconButton(
                            onPressed: () async {
                              final result = await showDialog(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    child: AlertDialog(
                                      backgroundColor: Colors.grey.shade900,
                                      title: Text(
                                        "Do you want to delete?",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 25),
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context, true);
                                            },
                                            child: Text("Yes",
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 20))),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context, false);
                                            },
                                            child: Text("No",
                                                style: TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 20))),
                                      ],
                                    ),
                                  );
                                },
                              );
                              if (result) {
                                deleteNotes(index);
                              }
                            },
                            icon: Icon(
                              Icons.delete_forever,
                              size: 30,
                              color: Colors.redAccent.shade400,
                            )),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey.shade900,
        onPressed: () async {
          final results = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => addNotes(),
              ));
          if (results != null) {
            setState(() {
              sample.add(Notes(
                  id: sample.length, title: results[0], content: results[1]));
            });
          }
        },
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
