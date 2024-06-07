import 'package:flutter/material.dart';
import 'package:testingtask/constants/colors.dart';
import 'package:testingtask/screens/Diary_Screen/diary_page.dart';
import 'package:testingtask/screens/Home_Screen/Calendar_Screen/calendar_screen.dart';
import 'package:testingtask/screens/Home_Screen/widgets/current_time.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();  
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        //AppBar показывает текущее время и IconButton
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(left: 158.0),
            child: CurrentTimeScreen()
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CalendarScreen()),
                );
              },
              icon: const Icon(Icons.calendar_month, size: 24, color: tdGrey,),
            ),
          ],
        ),

        body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 25,0 ),
                //Здесь кастомная настройка Tabbar
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                    color: tdWhiteGrey,             
                    borderRadius: BorderRadius.circular(47),
                              ),
             
                    child: TabBar(
                      
                      dividerColor: Colors.white,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                        color: tdOrange ,
                        borderRadius: BorderRadius.circular(47),
                                 ),
                      
                      tabs: 
                        const [                                
                          Tab(
                            icon : Row(
                              children: [
                                Icon(Icons.calendar_today_outlined,size: 10,color:Colors.white ,),
                                SizedBox(width: 2),
                                Text('Дневник настроение',style: TextStyle(fontSize: 10,color: Colors.white),)
                              ],
                            ),
                          ),
                           Tab(
                            icon : Row(
                              children: [
                                SizedBox(width: 18),
                                Icon(Icons.bar_chart,size: 10,color:tdGrey ,),
                                SizedBox(width: 6),
                                Text('Статистика',style: TextStyle(fontSize: 10,color: tdGrey),)
                              ],
                            ),
                          ),
                        
                        ],
                    ),
                  
                ),          
              ),
          
              const Expanded(
                child: TabBarView(
                  children: [
                    MyDiaryPage (),
                    Center(child: Text('Это просто tab ',style: TextStyle(fontSize: 30),)),
                  ],
                ),
              ),
            ],
          ),
        )
      
    );
  }
}
