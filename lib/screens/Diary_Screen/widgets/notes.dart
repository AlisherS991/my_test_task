import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testingtask/constants/colors.dart';
import 'package:testingtask/providers/notes_provider.dart';

class MyNotesWidget extends StatelessWidget {
  const MyNotesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final notesProvider= Provider.of<NotesProvider>(context);
    return Container(
      height: 80,
      color: Colors.white,
      child: TextField(
              decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1.0),
                                ),
                  focusedBorder:OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1.0),
                                ), 
                hintText: 'Введите заметку',
                hintStyle:  TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: tdGrey,
                      ),              
              ),
              onChanged: (value) {
                    notesProvider.setValue(value);
                },
            ),
    );
  }
}