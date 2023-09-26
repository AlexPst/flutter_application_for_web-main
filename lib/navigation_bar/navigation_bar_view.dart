import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_for_web/components/mobile_desktop_view_builder.dart';
import 'package:flutter_application_for_web/constant.dart';

class NavigatonBarView extends StatelessWidget {

  @override
  Widget build(BuildContext context)
  {
        onPressed() => print('click');
        return DesktopMobileViewBuilder(
          mobileView: NavigationMobileView(),
          desktopView: NavigationDesktopView(onPressed: onPressed),);
  }
  
}
    

class NavigationDesktopView extends StatelessWidget {
  const NavigationDesktopView({
    super.key,
    required this.onPressed
  });

  final void Function() onPressed;
  
  @override
  Widget build(BuildContext context) {
    return Container(
     
      height: 100,
      width: kInitWidth,
      color: Colors.blueAccent,
      padding: kScreenPadding,
      child: Row(
        children: [
          FlutterLogo(),
          Spacer(),
          for (var item in kNavigationItems)
          NavigationBarItem(onPressed: (){}, text: item.text),
          
        ],
      ),
    );
  }
}

class NavigationMobileView extends StatelessWidget {
  const NavigationMobileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kScreenPadding,
      color: Colors.blueAccent,
      height: 100,
       width: double.infinity,
      //color: Colors.blueAccent,
      //padding: kScreenPadding,
      child: Row(
        children: [
        const SizedBox(width: 20),
        const FlutterLogo(),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => Scaffold.of(context).openEndDrawer(),
            )
          ],
        ),
      );
  }
}

class NavigationItem{
  late final String text;
  NavigationItem(this.text);
}

final kNavigationItems = [
  NavigationItem('Проекты'),
  NavigationItem('Навыки'),
  NavigationItem('Опыт работы'),
  NavigationItem('Блог'),
];


class NavigationBarItem extends StatelessWidget{
  
  const NavigationBarItem({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  final void Function() onPressed;
  final String text;

  
  @override
  Widget build(BuildContext context){
    final isSmall = MediaQuery.of(context).size.width <650;
      var onPressed = () =>print('click');
      
      return TextButton(
        
        style: TextButton.styleFrom(foregroundColor: Colors.black, padding: EdgeInsets.symmetric(horizontal: 24)),
        onPressed: () {onPressed();},
        child: Text(text, style: TextStyle(color: Colors.black, fontSize: isSmall ? 17 : 24),),

      );
  }
}




