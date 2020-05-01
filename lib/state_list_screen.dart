import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './district_list_screen.dart';

class StateListScreen extends StatefulWidget {
  @override
  _StateListScreenState createState() => _StateListScreenState();
}

class _StateListScreenState extends State<StateListScreen> {
  var decodedData;
  bool isloading = true;
  Future getData() async {
    var jsonData = await http
        .get('https://api.covid19india.org/v2/state_district_wise.json');
    decodedData = await json.decode(jsonData.body);
    print(decodedData.length);
    print(decodedData[1]);
    setState(() {
      isloading = false;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        title: Text('Covid tracker'),
      ),
      body: isloading
          ? Center(
              child: Column(
                children: <Widget>[
                  CircularProgressIndicator(),
                  Text('Loading Data')
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                  itemBuilder: ((context, index) {
                    int increasedPatient = 0;
                    int decreasedPatient = 0;
                    int confirmedTill=0;
                    for (var i = 0;
                        i < decodedData[index]["districtData"].length;
                        i++) {
                      increasedPatient = increasedPatient +
                          decodedData[index]["districtData"][i]["delta"]
                              ["confirmed"];
                     
                         decreasedPatient = decreasedPatient +
                          decodedData[index]["districtData"][i]["delta"]
                              ["recovered"];
                              confirmedTill=confirmedTill+ decodedData[index]["districtData"][i]["confirmed"];
                     
                    }
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DistrictListScreen(
                              data: decodedData[index],
                            ),
                          ),
                        );
                      },
                      child: Container(
                          height: 80,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Theme.of(context).primaryColor),
                          child: Row(
                            children: <Widget>[
                             Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  decodedData[index]["state"]+" ($confirmedTill)",
                                  style: Theme.of(context).textTheme.title,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Icon(
                                  Icons.arrow_upward,
                                  color: Color(0xffE23C25),
                                ),
                              ),
                              Text(
                                increasedPatient.toString(),
                                style: Theme.of(context).textTheme.title,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Icon(
                                  Icons.arrow_downward,
                                  color: Color(0xff00CA69),
                                ),
                              ),
                              Text(
                                decreasedPatient.toString(),
                                style: Theme.of(context).textTheme.title,
                              ),
                            ],
                          )),
                    );
                  }),
                  separatorBuilder: ((context, index) {
                    return Divider();
                  }),
                  itemCount: decodedData.length
                  ),
            ),
    );
  }
}
