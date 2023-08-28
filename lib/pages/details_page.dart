import 'package:flutter/material.dart';
import 'package:flutter_travelapp/misc/colors.dart';
import 'package:flutter_travelapp/widgets/app_buttons.dart';
import 'package:flutter_travelapp/widgets/app_large_text.dart';
import 'package:flutter_travelapp/widgets/app_text.dart';
import 'package:flutter_travelapp/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var image ={
    "himalaya.png" : "Himalaya",
    "Lhotse.png" : "Lhotse",
    "denali.png" : "Denali"
  };
  int gottenStars=4;
  int selectedIndex = -1;

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: 'trip-data',
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                left:0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("lib/img/"+image.keys.elementAt(index)),
                        fit:BoxFit.cover
                    ),
                  ),
                )),
              Positioned(
                  left: 20,
                  top: 60,
                  child: Row(
                children: [
                   IconButton(onPressed: (){Navigator.pushReplacementNamed(context, "mainpage");}, icon: Icon(Icons.menu),
                  color: Colors.white,
                  )
                ],
              )),
              Positioned(
                top: 275,
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                width: MediaQuery.of(context).size.width,
                    height: 700,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeText(text: "Himalaya", color: Colors.black.withOpacity(0.8), size: 30,),
                            AppLargeText(text: "Rs 1,25,000", color: AppColors.mainColor,size: 30,),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_on, color: AppColors.mainColor,),
                            SizedBox(
                              width: 5,
                            ),
                            AppText(text: "Himachal Pradesh, India", size: 20, color: Colors.black.withOpacity(0.3), )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Wrap(
                            children:List.generate(5, (index){
                              return Icon(Icons.star, color: index<gottenStars?AppColors.starColor:AppColors.textColor2,);

                            }),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          AppText(text: "(4.0)", color: AppColors.textColor2,)
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        AppLargeText(text: "People", color: Colors.black.withOpacity(0.8), size: 28,),
                        SizedBox(
                          height: 5,
                        ),
                        AppText(text: "Number of people in your group",color: AppColors.textColor2, size: 18,),
                        SizedBox(
                          height: 15,
                        ),
                        Wrap(
                          children:
                            List.generate(5, (index) {
                              return InkWell(
                                onTap: (){
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 20),
                                  child: AppButtons(
                                    size: 45,
                                    color: selectedIndex==index?Colors.white:Colors.black,
                                    backgroundcolor: selectedIndex==index?AppColors.mainColor:AppColors.buttonBackground,
                                    borderColor: selectedIndex==index?AppColors.mainColor:AppColors.buttonBackground,
                                  text: (index+1).toString(),),
                                ),
                              );
                            }),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        AppLargeText(text: "Description", color: Colors.black,),
                        SizedBox(
                          height: 10,
                        ),
                        AppText(text: "The Himalayas, or Himalaya, are a mountain range in Asia separating the plains of the Indian subcontinent from the Tibetan Plateau.", size: 20,),
                        SizedBox(
                          height: 20,
                        ),
                        Positioned(
                          bottom: 0,
                          left: 20,
                          right: 6,
                          child: Row(
                            children: [
                              AppButtons(size: 60, color: AppColors.textColor2, backgroundcolor: Colors.white, borderColor: AppColors.textColor2, icon: Icons.favorite_border, isIcon:true,),
                              SizedBox(
                                width: 60,
                              ),
                              InkWell(
                                onTap: (){
                                  Navigator.pushReplacementNamed(context, "bookingpage");
                                },
                                child: Container(
                                  width: 225,
                                  child: ResponsiveButton(
                                    isResponsive: true,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
