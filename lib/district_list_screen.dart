import 'package:flutter/material.dart';

class DistrictListScreen extends StatelessWidget {
  var data;
  DistrictListScreen({this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data of ${data['state']}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
            itemBuilder: ((context, index) {
              return InkWell(
                onTap: () {},
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
                          data['districtData'][index]['district'],
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
                        data["districtData"][index]["delta"]["confirmed"]
                            .toString(),
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
                        data["districtData"][index]["delta"]["recovered"]
                            .toString(),
                        style: Theme.of(context).textTheme.title,
                      ),
                    ],
                  ),
                ),
              );
            }),
            separatorBuilder: ((context, index) {
              return Divider();
            }),
            itemCount: data["districtData"].length),
      ),
    );
  }
}
/* title:
                    Text(data['districtData'] /*[index]*/ [index]['district']),
                subtitle: Text('tap to see more detail'),
                trailing: CircleAvatar(
                  child: Text((data['districtData'] /*[index]*/ [index]
                          ['confirmed'])
                      .toString()),
                      
                ), */
