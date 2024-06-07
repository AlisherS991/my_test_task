import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testingtask/providers/feeling_provider.dart';
import 'package:testingtask/providers/home_page_notifier.dart';
import 'package:testingtask/providers/mood_provider.dart';
import 'package:testingtask/providers/notes_provider.dart';
import 'package:testingtask/providers/self-esteem_provider.dart';
import 'package:testingtask/providers/stress_slider_provider.dart';
import 'package:testingtask/screens/Home_Screen/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MoodProvider()),
        ChangeNotifierProvider(create: (context) => FeelingProvider()),
        ChangeNotifierProvider(create: (context) => SliderProvider()),
        ChangeNotifierProvider(create: (context) => EsteemSliderProvider()),
        ChangeNotifierProvider(create: (context) => NotesProvider()),
        ChangeNotifierProvider(create: (context) => HomePageNotifier ()),
        
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Testing Task',
      theme: ThemeData(
    
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}




