import 'package:flutter/material.dart';

import 'model.dart';
import 'services.dart';

Services service = new Services();

class RecentDocumentsCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RecentDocumentsCardState();
  }
}

class RecentDocumentsCardState extends State<RecentDocumentsCard>
    with AutomaticKeepAliveClientMixin<RecentDocumentsCard> {
  bool get wantKeepAlive => true;

  Future<Documents> _docs = service.getDocuments();

  void load() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ---------------  Card Heading -----------------\\
        Align(
          alignment: Alignment.bottomLeft,
          heightFactor: 1,
          child: Text(
            '\n    Recent Documents',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 13.0,
                fontFamily: "openSans"),
          ),
        ),
        // ----------------  Card Subheading -----------------\\
        Align(
          alignment: Alignment.bottomLeft,
          heightFactor: 1,
          child: Text(
            '    View Documents\n',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w400,
                fontSize: 13.0,
                fontFamily: "openSans"),
          ),
        ),
        // ---------------  Date  -----------------\\
        SizedBox(
          height: 45.0,
          width: 355.0,
          child: Container(
            width: 355,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    color: Color.fromRGBO(138, 156, 167, .4), width: 1),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4), topRight: Radius.circular(4))),
            child: Center(
              // ---------------  Date is returned here from API via Future-----------------\\
              child: FutureBuilder<Documents>(
                  future: _docs,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        service.convertDate(
                                snapshot.data.startDate.toString()) +
                            " - " +
                            service
                                .convertDate(snapshot.data.endDate.toString()),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w200,
                            color: Colors.grey),
                      );
                    } else {
                      return Text("");
                    }
                  }),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 0),
          child: SizedBox(
              child: Stack(
            children: <Widget>[
              Center(
                  child: Container(
                height: 265,
                width: 355,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Color.fromRGBO(138, 156, 167, .4), width: 1),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(4),
                        bottomRight: Radius.circular(4))),
                child: SizedBox(
                  height: 70,
                  width: 70,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                          top: 45,
                          left: 140,
                          child: Center(
                            child: Container(
                              width: 70.0,
                              height: 70.0,
                              // ------------------  Card Radial Percentage -----------------\\
                              child: FutureBuilder<Documents>(
                                  future: _docs,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return CircularProgressIndicator(
                                        value: (0),
                                        backgroundColor: Colors.blue,
                                      );
                                    } else {
                                      return CircularProgressIndicator(
                                        value: 0,
                                      );
                                    }
                                  }),
                            ),
                          )),
                      Positioned(
                          top: 75,
                          left: 162,
                          child: FutureBuilder<Documents>(
                              future: _docs,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text(
                                      ((0) * 100).toStringAsFixed(0) + "%");
                                } else {
                                  return Text("");
                                }
                              })),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(122.0),
                            child: Text("Bill Of Lading",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13.0)),
                          )),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Row(children: <Widget>[
                                Container(
                                  height: 25,
                                  width: 337 / 2,
                                  child: Text("Fuel Receipt",
                                      style: TextStyle(
                                          fontSize: 10.5,
                                          fontWeight: FontWeight.w200)),
                                ),
                                FutureBuilder<Documents>(
                                    future: _docs,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return Container(
                                          height: 25,
                                          width: 337 / 2,
                                          child: Text(
                                              snapshot
                                                  .data.docsCount.billOfLading
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 10.5,
                                                  fontWeight: FontWeight.w200),
                                              textAlign: TextAlign.right),
                                        );
                                      } else {
                                        return Container(
                                          height: 25,
                                          width: 337 / 2,
                                          child: Text(""),
                                        );
                                      }
                                    }),
                              ]),
                              Row(
                                children: <Widget>[
                                  Container(
                                      height: 25,
                                      width: 337 / 2,
                                      child: Text(
                                        "Fuel Receipt",
                                        style: TextStyle(
                                            fontSize: 10.5,
                                            fontWeight: FontWeight.w200),
                                      )),
                                  FutureBuilder<Documents>(
                                      future: _docs,
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          return Container(
                                            height: 25,
                                            width: 337 / 2,
                                            child: Text(
                                                snapshot
                                                    .data.docsCount.fuelReceipt
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 10.5,
                                                    fontWeight:
                                                        FontWeight.w200),
                                                textAlign: TextAlign.right),
                                          );
                                        } else {
                                          return Container(
                                            height: 25,
                                            width: 337 / 2,
                                            child: Text(""),
                                          );
                                        }
                                      })
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                      height: 25,
                                      width: 170,
                                      child: Text(
                                        "Accident Photo",
                                        style: TextStyle(
                                            fontSize: 10.5,
                                            fontWeight: FontWeight.w200),
                                      )),
                                  FutureBuilder<Documents>(
                                      future: _docs,
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          return Container(
                                            height: 25,
                                            width: 167,
                                            child: Text(
                                                snapshot.data.docsCount
                                                    .accidentPhoto
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 10.5,
                                                    fontWeight:
                                                        FontWeight.w200),
                                                textAlign: TextAlign.right),
                                          );
                                        } else {
                                          return Container(
                                            height: 25,
                                            width: 187,
                                            child: Text(""),
                                          );
                                        }
                                      })
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                      height: 25,
                                      width: 170,
                                      child: Text(
                                        "Citation",
                                        style: TextStyle(
                                            fontSize: 10.5,
                                            fontWeight: FontWeight.w200),
                                      )),
                                  FutureBuilder<Documents>(
                                      future: _docs,
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          return Container(
                                            height: 25,
                                            width: 167,
                                            child: Text(
                                                snapshot.data.docsCount.citation
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 10.5,
                                                    fontWeight:
                                                        FontWeight.w200),
                                                textAlign: TextAlign.right),
                                          );
                                        } else {
                                          return Container(
                                            height: 25,
                                            width: 187,
                                            child: Text(""),
                                          );
                                        }
                                      })
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                      height: 25,
                                      width: 170,
                                      child: Text(
                                        "Scale Ticket",
                                        style: TextStyle(
                                            fontSize: 10.5,
                                            fontWeight: FontWeight.w200),
                                      )),
                                  FutureBuilder<Documents>(
                                      future: _docs,
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          return Container(
                                            height: 25,
                                            width: 167,
                                            child: Text(
                                                snapshot
                                                    .data.docsCount.scaleTicket
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 10.5,
                                                    fontWeight:
                                                        FontWeight.w200),
                                                textAlign: TextAlign.right),
                                          );
                                        } else {
                                          return Container(
                                            height: 25,
                                            width: 187,
                                            child: Text(""),
                                          );
                                        }
                                      })
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                      height: 25,
                                      width: 170,
                                      child: Text(
                                        "Other",
                                        style: TextStyle(
                                            fontSize: 10.5,
                                            fontWeight: FontWeight.w200),
                                      )),
                                  FutureBuilder<Documents>(
                                      future: _docs,
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          return Container(
                                            height: 25,
                                            width: 167,
                                            child: Text(
                                                snapshot.data.docsCount.other
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 10.5,
                                                    fontWeight:
                                                        FontWeight.w200),
                                                textAlign: TextAlign.right),
                                          );
                                        } else {
                                          return Container(
                                            height: 25,
                                            width: 187,
                                            child: Text(""),
                                          );
                                        }
                                      })
                                ],
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ))
            ],
          )),
        )
      ],
    );
  }
}
