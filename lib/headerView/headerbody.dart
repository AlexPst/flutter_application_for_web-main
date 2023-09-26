import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_for_web/constant.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderBody extends StatelessWidget {

  final bool isMobile;

  const HeaderBody({
    Key? key,
    required this.isMobile ,

    
  }):super (key:key);


  @override
  Widget build(BuildContext context) {
    
    return Column(
    
      mainAxisAlignment: MainAxisAlignment.center, 
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        

        Padding(padding: kScreenPadding,
        child: AutoSizeText('Этот сайт написан на Flutter',
          style: GoogleFonts.montserrat(textStyle: Theme.of(context).textTheme.displayLarge), 
          maxLines: 1,
          ), 
          ),

         Padding(padding: kScreenPadding, 
        child: AutoSizeText('Это мой тестовый проект',
        style: GoogleFonts.montserrat(textStyle: Theme.of(context).textTheme.titleLarge),
        maxLines: 2,
        ),
         ),

        SizedBox(height: isMobile ? 20 : 40,),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: isMobile ? 10 : 17, 
            horizontal: isMobile ? 10 : 20),

          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 26, 92, 146),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(7))),
            ),
            onPressed: (){},
            child: Text('Contact Me', 
              style: GoogleFonts.montserrat(
                fontSize: isMobile ? 20 : 24, 
                color: Colors.white),),
          ),
        )
        
      ],
    );
  }
}
