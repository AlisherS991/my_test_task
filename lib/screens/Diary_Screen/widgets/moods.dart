import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testingtask/constants/colors.dart';
import 'package:testingtask/providers/mood_provider.dart';


class MyMoodWidget extends StatelessWidget {
  const MyMoodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final moodProvider = Provider.of<MoodProvider>(context);

    List<String> images = [
      'lib/constants/assets/радость.png',
      'lib/constants/assets/страх.png',
      'lib/constants/assets/бешенство.png',
      'lib/constants/assets/грусть.png',
      'lib/constants/assets/спокойствие.png',
      'lib/constants/assets/сила.png',
    ];

    List<String> imageNames = [
      'радость',
      'страх',
      'бешенство',
      'грусть',
      'спокойствие',
      'сила',
    ];
 
    
    
    return Container(
      height: 118,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: index == 5
                ? const EdgeInsets.fromLTRB(8, 0, 4, 0)
                : const EdgeInsets.fromLTRB(0, 0, 12, 0),
            child: InkWell(
              onTap: () {
                
            
                moodProvider.changeMood(imageNames[index],1,index);
               
              },
              child: Container(
                height: 118,
                width: 83,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(76.0),
                  border: Border.all(
                    color: moodProvider.selectedMood == imageNames[index]
                        ? tdOrange
                        : Colors.transparent,
                    width: 2.0,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 17),
                    SizedBox(
                      width: 62,
                      height: 62,
                      child: Image(
                        alignment: Alignment.topCenter,
                        image: AssetImage(images[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      imageNames[index],
                      style: const TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        color: tdBlack,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
