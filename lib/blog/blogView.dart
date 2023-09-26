 import 'package:flutter/material.dart';
import 'package:flutter_application_for_web/components/desktop_view_builder.dart';
import 'package:flutter_application_for_web/components/mobile_desktop_view_builder.dart';
import 'package:flutter_application_for_web/components/mobile_view_builder.dart';
import 'package:flutter_application_for_web/experience/experiens_container.dart';
import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;







class BlogView extends StatelessWidget {
  const BlogView
  ({super.key});

  static const title = 'Блог';
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getArticles(),
      builder:(context, snapshot) {
        if(!snapshot.hasData) return CircularProgressIndicator();
        print(snapshot.data);
        return DesktopMobileViewBuilder(
        mobileView: BlogMobileView(), 
        desktopView: BlogDesktopView(), 
          
      );
      }
    );
  }
}

class BlogDesktopView extends StatelessWidget {
  const BlogDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return DesktopViewBuilder(
      titleText: BlogView.title, 
      children: [
        Row(children: [
          for(var i=0; i<2; i++)
            Expanded(
              child: BlogCard(isMobile: true,)
            )
          
        ],)
      ]);
  }
}

class BlogCard extends StatelessWidget {
  const BlogCard({
    super.key, 
    required this.isMobile,
  });

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
                    
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
        Container(color: Colors.red,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal:8,
        vertical: isMobile ?? false ? 20 : 40),
        child: Text('Как создать портфолио',
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
         color: Colors.white
        )
                     ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text('14 Сентября 2023', style: textStyle(isGray: true),),
                      SizedBox(height: 15,),
                      Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit,' * 30, maxLines: 3, style: textStyle())
      
                    ],) 
                    ],
                    
                  ),
      ),
            );
  }
}

class BlogMobileView extends StatelessWidget {
  const BlogMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return MobileViewBuilder(
      titleText: BlogView.title, 
      children: [for(var i=0; i<2; i++) BlogCard(isMobile: true,)]);
  }
}

getArticles() async {
  const url = 'https://developer.apple.com/news/releases/rss/releases.rss';
  final responce = await http.get(url as Uri); 
  final parsedResponce = RssFeed.parse(responce.body);
  return parsedResponce;
}