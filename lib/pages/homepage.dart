import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_travelapp/misc/colors.dart';
import 'package:flutter_travelapp/widgets/app_large_text.dart';
import 'package:flutter_travelapp/widgets/app_text.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "balloning.png":"Balloning",
    "hiking.png":"Hiking",
    "kayaking.png":"Kayaking",
    "snorkling.png":"Snorkling",
  };

  var image ={
    "himalaya.png" : "Himalaya",
    "Lhotse.png" : "Lhotse",
    "denali.png" : "Denali"
  };

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top:70,left:20),
            child: Row(
              children: [
                Icon(Icons.menu, size: 30, color: Colors.black54),
              Expanded(child: Container()),
              Container(
                margin: EdgeInsets.only(right: 20),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("lib/img/profile.png")
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.5),
                ),
              )
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: AppLargeText(text: "Discover",size: 35,),
          ),
          SizedBox(
            height: 25,
          ),
          //Tab Bar
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelPadding: EdgeInsets.only(left: 0, right: 0)  ,
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                // isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                tabs: [
                  Tab(text: "Places",),
                  Tab(text: "Inspiration",),
                  Tab(text: "Emotions",),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount:3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: (){
                        Navigator.pushReplacementNamed(context, "detailspage");
                      },
                      child: Hero(
                        tag: 'tripdata',
                        child: Container(
                          margin: EdgeInsets.only(right: 15, top: 10),
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage(
                                  "lib/img/"+image.keys.elementAt(index),
                                ),
                                fit: BoxFit.cover,
                              )
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Center(child: Text("This is Inspiration Page")),
                Center(child: Text("This is Emotions Page")),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargeText(text: "Explore More",size: 22,),
                InkWell(
                  onTap: (){
                    Navigator.pushReplacementNamed(context, "thankyoupage");
                  },
                    child: AppText(text: "See all", color: AppColors.textColor1,))
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 100,
            width: double.maxFinite,
            margin: EdgeInsets.only(left: 20),
            child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index){
              return InkWell(
                onTap: (){
                  Navigator.pushReplacementNamed(context, "thankyoupage");
                },
                child: Column(
                  children: [
                   Container(
                     margin: EdgeInsets.only(right: 30),
                     width: 80,
                     height: 80,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(20),
                       color: Colors.white,
                       image: DecorationImage(
                         image: AssetImage("lib/img/"+images.keys.elementAt(index)),
                         fit: BoxFit.cover
                       ),
                     ),
                   ),
                    Container(

                      child: AppText(
                        text: images.values.elementAt(index),
                        color: AppColors.textColor2,
                      ),
                    ),
                    // Container(
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(5),
                    //     image: DecorationImage(
                    //       image: AssetImage("lib/img/himalaya.png"),
                    //       fit: BoxFit.cover,
                    //     )
                    //   ),
                    //   ),
                  ],
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration{
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color:color, radius:radius);
  }

}
class _CirclePainter extends BoxPainter{
  final Color color;
  double radius;
  _CirclePainter ({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color=color;
    _paint.isAntiAlias=true;
    final Offset cicleoffset = Offset(configuration.size!.width/2 - radius/2, configuration.size!.height - radius);
    canvas.drawCircle(offset+cicleoffset, radius, _paint);
    // TODO: implement paint
  }
}
