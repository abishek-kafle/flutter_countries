import 'dart:ui';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Country extends StatelessWidget {
  final Map country;
  Country(this.country);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(country['name']),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GridView(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: <Widget>[
            FlipCard(
                front: CountryCard(
                  title: 'Capital',
                ),
                back: CountryCardDetail(
                  title: country['capital'],
                  color: Colors.amber,
                )),
            FlipCard(
                front: CountryCard(
                  title: 'Population',
                ),
                back: CountryCardDetail(
                  title: country['population'].toString(),
                  color: Colors.lightBlue,
                )),
            FlipCard(
              front: CountryCard(
                title: 'Flag',
              ),
              back: Card(
                elevation: 10,
                child: Center(
                    child: SvgPicture.network(
                  country["flag"],
                  width: 200,
                )),
              ),
            ),
            FlipCard(
                front: CountryCard(
                  title: 'Currency',
                ),
                back: CountryCardDetail(
                  title: country['currencies'][0]['name'],
                  color: Colors.grey,
                )),
            Card(
              elevation: 10,
              child: Center(
                  child: Text(
                'Show on map',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
            )
          ],
        ),
      ),
    );
  }
}

class CountryCard extends StatelessWidget {
  final String title;
  CountryCard({this.title});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Center(
          child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      )),
    );
  }
}

class CountryCardDetail extends StatelessWidget {
  final String title;
  final MaterialColor color;
  CountryCardDetail({this.title, this.color});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: 10,
      child: Center(
          child: Text(
        title,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
      )),
    );
  }
}
