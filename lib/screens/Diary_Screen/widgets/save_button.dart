import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testingtask/constants/colors.dart';
import 'package:testingtask/providers/feeling_provider.dart';
import 'package:testingtask/providers/mood_provider.dart';
import 'package:testingtask/providers/notes_provider.dart';


class MySaveButtun extends StatefulWidget {

  final Function() onStateChanged;
  final List<String> moods;
  final List<String> feelings;
  final List<String> texts;

  const MySaveButtun({super.key, required this.moods,required this.feelings,required this.texts, required this.onStateChanged});

  @override
  State<MySaveButtun> createState() => _MySaveButtunState();
}

class _MySaveButtunState extends State<MySaveButtun> {

  void update() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width - 20;
     
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: tdOrange,
        minimumSize: Size(buttonWidth, 50),
      ),
      onPressed: () {
        var moodProvider = Provider.of<MoodProvider>(context, listen: false);
        var feelingProvider = Provider.of<FeelingProvider>(context, listen: false);
        var notesProvider = Provider.of<NotesProvider>(context, listen: false);
          if(widget.moods[widget.moods.length-1]!='' && widget.feelings.last!='' && widget.texts.last!=''){
            print(widget.moods[widget.moods.length-1]);
              _showAlertDialog(context);
            widget.onStateChanged();
            moodProvider.changeMood('',0,0);  
          feelingProvider.changeMood('');  
          notesProvider.setValue('');  
          }
          else{
            ();
          }           
       },
      child: const Text(
        'Сохранить',
        style: TextStyle(
          fontFamily: 'Nunito',
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
    );
  }
} 


void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(    
          content: const Text('Ваш дневник успешно сохранен'),
          actions: <Widget>[
            Center(
              child: TextButton(
                child: const Text('ОК'),
                onPressed: () {
                  Navigator.of(context).pop(); 
                },
              ),
            ),
            
          ],
        );
      },
    );
}