import 'package:flutter/material.dart';
import 'package:note_app/notes.dart';

class addNotes extends StatefulWidget {
  final Notes? note;
  const addNotes({super.key, this.note});

  @override
  State<addNotes> createState() => _addNotesState();
}

class _addNotesState extends State<addNotes> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  void initState() {
    titleController = TextEditingController(text: widget.note!.title);
    contentController = TextEditingController(text: widget.note!.content);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
                padding: const EdgeInsets.only(top: 20),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 30,
                    ))),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: ListView(
                children: [
                  TextField(
                    controller: titleController,
                    style: TextStyle(color: Colors.white, fontSize: 40),
                    maxLines: null,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Title",
                        hintStyle: TextStyle(
                            color: Colors.grey.shade700, fontSize: 40)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: contentController,
                    style: TextStyle(color: Colors.white, fontSize: 25),
                    maxLines: null,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Type Something Here",
                        hintStyle: TextStyle(
                            color: Colors.grey.shade700, fontSize: 25)),
                  ),
                ],
              ),
            ))
          ])),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey.shade700,
        onPressed: () {
          Navigator.pop(
              context, [titleController.text, contentController.text]);
        },
        child: Icon(
          Icons.save,
          size: 35,
        ),
      ),
    );
  }
}
