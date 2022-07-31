// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class TableView extends StatefulWidget {
  const TableView({Key? key}) : super(key: key);

  @override
  _TableViewState createState() => _TableViewState();
}

class _TableViewState extends State<TableView> {
  List<String> rowHeaders = [];
  List<String> columnHeaders = [];
  Map selected = {};

  @override
  void initState() {
    super.initState();
    saveHeaders(); //Iterate and store all Row and column Headers
  }

  saveHeaders() {
    //Saving All Headers
    columnHeaders.addAll([
      "1",
      "2",
      "3",
      "4",
      "5",
    ]);
    rowHeaders.addAll([
      "1. Respect for Tissue",
      "2. Time and Motion",
      "3. Instrument Handling",
      "4. Flow of Operation",
      "5. Exposure",
      "6. Knowledge of Specific Procedure"
    ]);
  }

  @override
  Widget build(BuildContext context) {
    //double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 68, 68, 68),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 2, 151, 147),
              //borderRadius: BorderRadius.circular(10),
            ),
            width: 895,
            //alignment: FractionalOffset.bottomRight,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //headers
                Container(
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(10))),
                  margin: EdgeInsets.all(0.0),
                  child: Row(children: [
                    Container(
                      alignment: FractionalOffset.center,
                      width: 275.0,
                      height: 75,
                      child: Text(
                        //Leave an empty text in Row(0) and Column (0)
                        "PARAMETER",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    ...columnHeaders
                        .map((header) => Container(
                              alignment: FractionalOffset.center,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 2, 151, 147),
                                border: Border(
                                  left: BorderSide(color: Colors.white),
                                  //right: BorderSide(color: Colors.white),
                                ),
                              ),
                              width: 123.5,
                              height: 75,
                              margin: EdgeInsets.all(0.0),
                              padding: const EdgeInsets.only(
                                  top: 5.0, bottom: 5.0, right: 3.0, left: 3.0),
                              child: Text(
                                header,
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.left,
                              ),
                            ))
                        .toList()
                  ]),
                ),
              ],
            ),
          ),
          ...createRows(),
        ], //Create Rows
      ),
    );
  }

  List<Widget> createRows() {
    double screenWidth = (MediaQuery.of(context).size.width) / 2;
    screenWidth -= 5;

    List<Widget> allRows = []; //For Saving all Created Rows
    //List<List<String>> criteria = {[''],[],[],[],[],[],};

    for (int i = 0; i < rowHeaders.length; i++) {
      List<Widget> singleRow = []; //For creating a single row
      for (int j = 0; j < columnHeaders.length; j++) {
        singleRow.add(
          Container(
            width: 123.5,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.red),
            ),
            /* padding: const EdgeInsets.only(
              top: 6.0,
              bottom: 6.0,
              right: 3.0,
              left: 3.0,
            ), */
            child: Column(
              children: [
                Radio(
                  fillColor: MaterialStateProperty.resolveWith<Color>(
                      (states) => Colors.black),
                  value: j, //Index of created Radio Button
                  groupValue: selected[rowHeaders[i]] ??
                      "", //If groupValue is equal to value, the radioButton will be selected
                  onChanged: (value) {
                    setState(() {
                      selected[rowHeaders[i]] =
                          value; //Adding selected rowName with its Index in a Map tagged "selected"
                      //print("${rowHeaders[i]} ==> $value");
                    });
                  },
                ),
                Text('jalksjflasdlfa'),
              ],
            ),
          ),
        ); //singleRow add function
      }
      //Adding single Row to allRows widget
      allRows.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: (screenWidth - 900) / 2 + 2.5,
              color: Color.fromARGB(255, 68, 68, 68),
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 2, 151, 147),
                    //borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: FractionalOffset.centerLeft,
                  width: 275.0,
                  height: 50,
                  padding: const EdgeInsets.only(
                      top: 6.0, bottom: 6.0, right: 3.0, left: 10.0),
                  child: Text(
                    rowHeaders[i],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 2, 151, 147),
                  ),
                  alignment: FractionalOffset.centerLeft,
                  width: 275.0,
                  height: 50,
                ),
              ],
            ),
            ...singleRow //adds everything to the singleRow widget list
          ], //Add single row here
        ),
      );
    }
    return allRows; //Return all single rows
  }
}
