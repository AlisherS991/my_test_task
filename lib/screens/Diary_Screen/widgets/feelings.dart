import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testingtask/constants/colors.dart';
import 'package:testingtask/providers/feeling_provider.dart';


class MyFeelingWidget extends StatelessWidget {
  const MyFeelingWidget({Key? key});
 
  @override
  Widget build(BuildContext context) {
    final feelingProvider = Provider.of<FeelingProvider>(context);
    
    List<String> feelings = [
      'Возбуждение','Восторг',
      'Игривость','Наслаждение',
      'Очарование','Осознанность',      
      'Смелость','Удовольствие',
      'Чувственность','Энергичность','Экстравагантность'  
    ];

    return Container(
      margin: const EdgeInsets.fromLTRB(5, 13, 5, 5),
      height: 110, 
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: const  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisExtent: 20,
          crossAxisSpacing: 5,
          mainAxisSpacing: 8,
        ),
        itemCount: feelings.length,
        itemBuilder:(BuildContext context, int index) {
          return Padding(
            padding: index == 4 ?  const EdgeInsets.fromLTRB(0,2,0,2) :  const EdgeInsets.fromLTRB(0,2,8,2) , // Adjust the padding as needed
            child: InkWell(
              onTap: () {
                feelingProvider.changeMood(feelings[index]);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6), // Adjust the border radius
                  color: feelingProvider.selectedFeeling == feelings[index] ? tdOrange : Colors.white  ,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFB6A1C0),
                 
                    ),
                  ],
                ),
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.scaleDown, 
                    child: Padding(
                      padding: const EdgeInsets.all(0.0), 
                      child: Text(
                        feelings[index],
                        style: const TextStyle(
                          fontFamily: 'Nunito',
                          color: tdBlack,
                          fontSize: 11,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
