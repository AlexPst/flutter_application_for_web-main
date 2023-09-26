import 'package:flutter/material.dart';
import 'package:flutter_application_for_web/blog/blogView.dart';
import 'package:flutter_application_for_web/drawer/drawer_view.dart';
import 'package:flutter_application_for_web/experience/experienceView.dart';
import 'package:flutter_application_for_web/headerView/headerview.dart';
import 'package:flutter_application_for_web/projectView/projectview.dart';
import 'package:flutter_application_for_web/skills/skills_view.dart';
import 'navigation_bar/navigation_bar_view.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: "montserrat",
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 60, fontWeight: FontWeight.w500, color: Colors.black,), 
          titleMedium: TextStyle(fontSize: 24, fontStyle: FontStyle.normal, color: Colors.black),
          bodyMedium: TextStyle(fontSize: 14, fontFamily: 'Hind', color: Colors.black),
         ),
      ),
      home:const PortfolioView(),
      
       
    );
  }
}

class PortfolioView extends StatelessWidget{
  const PortfolioView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final ScrollController scrollController = ScrollController(initialScrollOffset: 2500);
    return Scaffold(
      endDrawer: DrawerView(),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          
          children: [
            NavigatonBarView(),
            HeaderView(),
            ProjectView(),
            SkillsView(),
            ExperienceView(),
            BlogView(),
            Container(height: height, width: width, color: Colors.blue,)
          ],
        ),
      ),
    );
  }
}



