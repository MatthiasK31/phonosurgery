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
            width: 894,
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
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
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
                                  right: BorderSide(
                                    color: Colors.black,
                                    width: 2,
                                  ),
                                  top: BorderSide(
                                    color: Colors.black,
                                    width: 2,
                                  ),
                                  bottom: BorderSide(
                                    color: Colors.black,
                                    width: 2,
                                  ),
                                ),
                              ),
                              width: 123.5,
                              height: 75,
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

    List<Widget> allRadioRows = []; //For Saving all Created Rows
    List<List<String>> criteria = [
      [
        'Frequently used unnecessary force on tissue or caused damage by inapropriate use of instruments',
        'Careful handling of tissue but occasionally caused inadvertent damage',
        'Consistently handles tissues appropriately with minimal damage',
      ],
      [
        'Many unnecessary moves',
        'Efficient time/motion but contains some unnecessary moves',
        'Clear economy of movement and maximum efficiency',
      ],
      [
        'Repeatedly made tentative or awkward moves with instruments by inappropriate use of instruments',
        'Competent use of instruments but occasionally appeared stiff or awkward',
        'Fluid movements with instruments without awkwardness',
      ],
      [
        'Frequently stopped procedure and seemed unsure of next move',
        'Demonstrated some forward planning with reasonable progression of procedure',
        'Obviously planned course of procedure with effortless flow from one movement to the next',
      ],
      [
        'Unable to obtain adequate initial exposure of surgical field. Frequent intra-operative adjustments',
        'Demonstrated good exposure with partial/impeded views of some structures; minor intra-operative adjustments',
        'Demonstrated excellent exposure of operative field without intra-operative adjustment',
      ],
      [
        'Deficient knowledge. Needed specific instructions at most steps',
        'Knew all important steps of procedure',
        'Demonstrated familiarity with all aspects of operation',
      ],
    ];

    for (int i = 0; i < rowHeaders.length; i++) {
      List<Widget> radioRow = []; //For creating a single row of radiobuttons
      List<Widget> criteriaRow = []; //For creating a single row of criteria
      var criteriaPos = 0;
      for (int j = 0; j < columnHeaders.length; j++) {
        radioRow.add(
          Container(
            width: 124,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                right: BorderSide(
                  color: j == (columnHeaders.length - 1)
                      ? Colors.black
                      : Colors.white,
                  width: 2,
                ),
              ),
            ),
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
              ],
            ),
          ),
        ); //radioRow add function

        if ((j + 1) % 2 != 0) {
          criteriaRow.add(
            Container(
              width: 206.5,
              height: 85,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  right: BorderSide(
                    color: j == (columnHeaders.length - 1)
                        ? Colors.black
                        : Colors.white,
                    width: 2,
                  ),
                  bottom: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    criteria[i][criteriaPos],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ); //criteriaRow add function
          criteriaPos++;
        }
      }

      //Adding single Row to allRadioRows widget
      allRadioRows.add(
        Row(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: (screenWidth - 892.5) / 2 - 2,
                      height: 135,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 2, 151, 147),
                        border: Border(
                          left: BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                          right: BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                          bottom: BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                      ),
                      alignment: FractionalOffset.centerLeft,
                      width: 275.0,
                      height: 135,
                      padding: const EdgeInsets.only(
                          top: 6.0, bottom: 6.0, right: 3.0, left: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            rowHeaders[i],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.left,
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          //for the radio button row
                          children: [
                            ...radioRow,
                          ],
                        ),
                        Row(
                          //for the score description row
                          children: [
                            ...criteriaRow,
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ], //Add ONE row here
        ),
      );
    }
    return allRadioRows; //Return all single rows
  }
}
