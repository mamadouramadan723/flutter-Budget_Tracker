import 'package:budget_tracker/json/daily_json.dart';
import 'package:flutter/foundation.dart';
import 'package:budget_tracker/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
//import 'package:timeline_date_picker/timeline_date_picker.dart';

class DailyPage extends StatefulWidget {
  const DailyPage({Key? key}) : super(key: key);

  @override
  _DailyPageState createState() => _DailyPageState();
}

DateTime activeDay = DateTime.now();

class _DailyPageState extends State<DailyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey.withOpacity(0.05),
      body: getBody(),
    );
  }

  Widget getBody() {
    DateTime today = DateTime.now();
    DateTime startDate = DateTime(today.year, today.month - 1, today.day);
    DateTime endDate = DateTime(today.year, today.month + 1, today.day);

    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: white, boxShadow: [
              BoxShadow(
                color: grey.withOpacity(0.01),
                spreadRadius: 10,
                blurRadius: 3,
                // changes position of shadow
              ),
            ]),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 60, right: 20, left: 20, bottom: 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "My Daily Transaction",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: black),
                      ),
                      Icon(AntDesign.search1)
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  /*DatePicker(
                      startDate: startDate,
                      endDate: endDate,
                      onChange: handleChange),*/
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
                children: List.generate(daily.length, (index) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: (size.width - 40) * 0.7,
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: grey.withOpacity(0.1),
                              ),
                              child: Center(
                                child: Image.asset(
                                  daily[index]['icon'],
                                  width: 30,
                                  height: 30,
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            SizedBox(
                              width: (size.width - 90) * 0.5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    daily[index]['name'],
                                    style: const TextStyle(
                                        fontSize: 15,
                                        color: black,
                                        fontWeight: FontWeight.w500),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    daily[index]['date'],
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: black.withOpacity(0.5),
                                        fontWeight: FontWeight.w400),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: (size.width - 40) * 0.3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          //this mainAxisAlignment is unnecessary when we delete "width: (size.width - 40) * 0.x"
                          children: [
                            Text(
                              daily[index]['price'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: Colors.green),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 65, top: 8),
                    child: Divider(
                      thickness: 0.8,
                    ),
                  )
                ],
              );
            })),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 80),
            child: Row(
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 80),
                  child: Text(
                    "Total",
                    style: TextStyle(
                        fontSize: 16,
                        color: black.withOpacity(0.4),
                        fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    "\$1780.00",
                    style: TextStyle(
                        fontSize: 20,
                        color: black,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

handleChange(DateTime date) {
  activeDay = date;
}