import 'package:flutter/material.dart';

class HomeList extends StatelessWidget {

  final String cardHeading;
  final String subHeading;
  final String date;
  final double radialPercentage;
  final String label;

  const HomeList({this.cardHeading, this.subHeading, this.date, this.radialPercentage, this.label});

  Widget build(BuildContext context) {
    return Column(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            heightFactor: 1,
            child: Text(cardHeading,
            textAlign: TextAlign.left,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 13.0,
        fontFamily: "openSans"),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            heightFactor: 1,
            child: Text(subHeading,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w400,
                  fontSize: 13.0,
                  fontFamily: "openSans"),
            ),
          ),
          SizedBox(
          height: 45.0,
        width: 355.0,
      child: Container(
        width: 355,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color.fromRGBO(138,156,167,.4), width: 1),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(4))
        ),
        child: Center(
          child: Text(date, textAlign: TextAlign.center, style: TextStyle(fontSize: 9, fontWeight: FontWeight.w200),),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 75),
    child: SizedBox(
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              height:265,
              width: 355,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color.fromRGBO(138,156,167,.4), width: 1),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(4), bottomRight: Radius.circular(4))
              ),
              child: SizedBox(
                height: 70,
                width: 70,
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Container(
                        width: 70.0,
                        height: 70.0,
                        child: new CircularProgressIndicator(
                          value: radialPercentage,
                        ),
                      ),
                    ),
                    Center(child: Text((100 * this.radialPercentage).toString().substring(0, (100 * this.radialPercentage).toString().length-2) + "%")),
                    Align(
                      alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(72.0),
                          child: Text(label, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13.0)),
                        )
                    ),
                  ],
                ),
              ),
            )
          )
        ],
      )
      ),
    )
            ],
          );
  }
}