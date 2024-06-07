import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testingtask/constants/colors.dart';
import 'package:testingtask/providers/feeling_provider.dart';
import 'package:testingtask/providers/mood_provider.dart';
import 'package:testingtask/providers/notes_provider.dart';
import 'package:testingtask/providers/self-esteem_provider.dart';
import 'package:testingtask/providers/stress_slider_provider.dart';
import 'package:testingtask/screens/Diary_Screen/widgets/feelings.dart';
import 'package:testingtask/screens/Diary_Screen/widgets/moods.dart';
import 'package:testingtask/screens/Diary_Screen/widgets/notes.dart';
import 'package:testingtask/screens/Diary_Screen/widgets/save_button.dart';
import 'package:testingtask/screens/Diary_Screen/widgets/self-esteem_slider.dart';
import 'package:testingtask/screens/Diary_Screen/widgets/stress_slider.dart';

class MyDiaryPage extends StatefulWidget {
  const MyDiaryPage({super.key});

  @override
  State<MyDiaryPage> createState() => _MyDiaryPageState();
}

class _MyDiaryPageState extends State<MyDiaryPage> {
  
  void upDateTree(){
    setState(() {
      print('object');
    });
  }
  
  List<String>? mood = ['0'];

  List<String>? feeling= ['0'];

  List<String>? textInput= ['0'];


  // counter применяется в логике при выборе кпопок настроение
  int counter = 0;

  // indices применяется в логике при выборе кпопок чувств
  List<int> indices = [0, 0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text(
                'Что чувствуешь?',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  color: tdBlack,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 7),
              const MyMoodWidget(),
              Consumer<MoodProvider>(
                builder: (context, moodProvider, child) {
                   String? s = moodProvider.selectedMood;
                  mood?.add(s ?? '');
                  int temp = moodProvider.counter;
                  int temp2 = moodProvider.index;
                  indices.add(temp2);
                  counter += temp;
                  return (counter % 2 == 1) || indices.last != indices[indices.length - 2]
                      ? const MyFeelingWidget()
                      : const SizedBox(height: 2);
                },
              ),
              Consumer<FeelingProvider>(
                builder: (context, feelingProvider, child) {
                  String? feelin = feelingProvider.selectedFeeling;
                  feeling?.add(feelin ?? '');
                  return const Text('');
                },
              ),
              const Text(
                'Уровень стресса',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  color: tdBlack,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 7),
              Consumer<SliderProvider>(
                builder: (context, sliderProvider, child) {           
                  return const MyStressSliderWidget();
                },
              ),
              const SizedBox(height: 7),
              const Text(
                'Самооценка',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  color: tdBlack,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 7),
              Consumer<EsteemSliderProvider>(
                builder: (context, sliderEsteemProvider, child) {          
                  return const MyEsteemliderWidget();
                },
              ),
              const SizedBox(height: 7),
              const Text(
                'Заметки',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  color: tdBlack,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 7),
              const MyNotesWidget(),
              Consumer<NotesProvider>(
                builder: (context, notesProvider, child) {
                  String? textInp = notesProvider.value;
                  textInput?.add(textInp);
                  return const SizedBox.shrink();
                },
              ),
              MySaveButtun(moods: mood!, feelings: feeling!, texts: textInput!, onStateChanged: upDateTree),
            ],
          ),
        ),
      ),
    );
  }
}
