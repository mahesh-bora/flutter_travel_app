import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarItemPage extends StatelessWidget {
  BarItemPage({Key? key});
  final List<GenreData> genresData = [
    GenreData("Beaching", 5),
    GenreData("Skiing", 3),
    GenreData("Hiking", 7),
    GenreData("Snorkeling", 4),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Travel App",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Genres Chosen",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AspectRatio(
                      aspectRatio: 1.0,
                      child: PieChart(
                        PieChartData(
                          pieTouchData: PieTouchData(enabled: true),
                          sections: genresData.map((data) {
                            return PieChartSectionData(
                              value: data.value.toDouble(),
                              title: data.genre,
                              titleStyle: TextStyle(color: Colors.white),
                              color: getColor(data.genre),
                              radius: 100,
                            );
                          }).toList(),
                          centerSpaceRadius: 70,
                          borderData: FlBorderData(show: false),
                          sectionsSpace: 0,
                          centerSpaceColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Text(
                    '''"Embark on a journey of diverse delight – from the exhilarating rush of skiing to the tranquil shores of beaches, the freefall thrill of skydiving, and the awe-inspiring heights of mountain hikes. Each adventure unfolds a unique chapter in the grand story of exploration."''',
                    style:
                        TextStyle(fontSize: 21, fontWeight: FontWeight.w500)),
              )
            ],
          ),
        ),
      ),
    );
  }

  Color getColor(String genre) {
    switch (genre) {
      case "Beaching":
        return Colors.blueAccent;
      case "Skiing":
        return Colors.purpleAccent;
      case "Hiking":
        return Colors.orangeAccent;
      case "Snorkeling":
        return Colors.lightGreen;
      default:
        return Colors.grey;
    }
  }
}

class GenreData {
  final String genre;
  final int value;

  GenreData(this.genre, this.value);
}
