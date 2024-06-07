import 'dart:async';

import 'package:flutter/material.dart';
import 'package:testingtask/constants/colors.dart';

class CurrentTimeScreen extends StatefulWidget {
  const CurrentTimeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CurrentTimeScreenState createState() => _CurrentTimeScreenState();
}

class _CurrentTimeScreenState extends State<CurrentTimeScreen> {
  String _currentTime = '';

  @override
  void initState() {
    super.initState();
    _currentTime = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getCurrentTime());
  }

  void _getCurrentTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _currentTime = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
             _currentTime,
              style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color:tdGrey
                           ),
           );
  }
}