import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:testingtask/constants/colors.dart';


class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay){
    setState(() {
      today =day;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Text('${today.day}th'),
          SizedBox(width: 20,)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            TableCalendar(
              focusedDay:  today,
              firstDay: DateTime.utc(2024,1,1),
              lastDay: DateTime.utc(2024,12,31),
              rowHeight: 80,
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, today),
              onDaySelected: _onDaySelected,
              calendarFormat: CalendarFormat.month,
              calendarStyle:  CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: tdOrange.withOpacity(0.25),
                  shape: BoxShape.circle,
                ),
                      todayDecoration: BoxDecoration(
                        color: tdOrange.withOpacity(0.5),
                        shape: BoxShape.circle,
                                      ),
                                    ),
                              ),
          ],
        ),
      ),
    );
  }
}