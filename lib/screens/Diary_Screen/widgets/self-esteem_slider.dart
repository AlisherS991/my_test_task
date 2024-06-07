import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testingtask/constants/colors.dart';
import 'package:testingtask/providers/self-esteem_provider.dart';

class MyEsteemliderWidget extends StatelessWidget {
  const MyEsteemliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final sliderEsteemProvider= Provider.of<EsteemSliderProvider>(context);
    return Container(
      height: 88,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25)
      ),
      child: Column(
        children: [
          const Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Text('  |                 |                |                |                |                | ',
                style: TextStyle(fontSize: 11),
                ),
              ),
            ],
          ),
          Slider( 
                    activeColor: tdOrange,
                    inactiveColor: tdSliderGrey ,
                    value: sliderEsteemProvider.value,
                    min: 0,
                    max: 100,
                    onChanged: (newValue) {
                    sliderEsteemProvider.setValue(newValue);
                },
              ),
         const  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Низкий',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    color: tdBlack,
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                  'Высокий',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    color: tdBlack,
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                  ),
                ),
            ),

          ],)
        ],
      ),
    );
  }
}
