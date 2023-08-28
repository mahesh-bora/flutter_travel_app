import 'package:flutter/material.dart';
import 'package:flutter_travelapp/misc/colors.dart';
import 'package:flutter_travelapp/widgets/app_text.dart';
import 'package:flutter_travelapp/widgets/responsive_button.dart';
import '../widgets/app_large_text.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images =[
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ];

  List text=[
  "Mountain hike gives you an incredible sense of freedom along with a lot of endurance ",
  "Mountain are lofty and a beauty to behold. Climbing them fills one with accomplishment like none other.",
  "The scenic beauty of mountains is breathe to behold. The valleys that surround it are breathtaking.",
  ];

  List genre=[
    "Hiking",
    "Mountains",
    "Scenery"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index){
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        "lib/img/"+images[index]
                    ),
                    fit: BoxFit.cover,
                  ),
              ),
              child:Container(
                margin: EdgeInsets.only(top:150, left: 20, right: 28),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    AppLargeText(text: "Trips"),
                    AppText(text: genre[index], size: 30),
                        SizedBox(height: 10),
                        Container(
                          width: 266,
                          child: AppText(
                            text: text[index],
                            color: AppColors.textColor2,
                            size: 14,
                          ),
                        ),
                        SizedBox(height: 40),
                        InkWell(
                          onTap: (){
                            Navigator.pushReplacementNamed(context, "mainpage");
                          },
                          child: Container(width:200,
                              child: ResponsiveButton(width: 110)),
                        ),
                      ],
                    ),
                    Column(
                      children: List.generate(3, (indexDots){
                        return Container(
                          margin: EdgeInsets.only(bottom: 2),
                          width: 8,
                          height: index == indexDots?25:8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: index == indexDots?AppColors.mainColor:AppColors.mainColor.withOpacity(0.5),
                          ),
                        );
                      }
                    )

                    )],
                ),

              )
            );
          }),
    );
  }
}
