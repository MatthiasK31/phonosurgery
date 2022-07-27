import 'package:flutter/material.dart';

class TableView extends StatefulWidget {
  const TableView({Key? key}) : super(key: key);

  @override
  _TableViewState createState() => _TableViewState();
}

class _TableViewState extends State<TableView> {
  List<String> rowHeaders = [];
  List<String> columnHeaders = [];
  Map selected = Map();

  @override
  void initState() {
    super.initState();
    saveHeaders(); //Iterate and store all Row and column Headers
  }

  saveHeaders() {
    //Saving All Headers
    columnHeaders.addAll(["1", "2", "3", "4", "5"]);
    rowHeaders.addAll(["1. MTN", "Vodafone", "Tigo", "Expresso", "Glo"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: OrientationBuilder(builder: (context, orientation) {
      return Center(
        widthFactor: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.redAccent),
              ),
              padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
              alignment: FractionalOffset.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //headers
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red),
                    ),
                    margin: EdgeInsets.all(0.0),
                    child: Row(
                        children: [
                      Container(
                        alignment: FractionalOffset.center,
                        width: 140.0,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.red)),
                        margin: EdgeInsets.all(0.0),
                        /* padding: const EdgeInsets.only(
                                top: 5.0, bottom: 5.0, right: 3.0, left: 3.0), */
                        child: Text(
                          //Leave an empty text in Row(0) and Column (0)
                          "PARAMETER",
                          style: TextStyle(color: Colors.grey[800]),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ]..addAll(columnHeaders
                            .map((header) => Container(
                                  alignment: FractionalOffset.center,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.red),
                                  ),
                                  width: 120.0,
                                  margin: EdgeInsets.all(0.0),
                                  padding: const EdgeInsets.only(
                                      top: 5.0,
                                      bottom: 5.0,
                                      right: 3.0,
                                      left: 3.0),
                                  child: Text(
                                    header,
                                    style: TextStyle(color: Colors.grey[800]),
                                    textAlign: TextAlign.left,
                                  ),
                                ))
                            .toList())),
                  ),
                ],
              ),
            )
          ]..addAll(createRows()), //Create Rows
        ),
      );
    }));
  }

  List<Widget> createRows() {
    List<Widget> allRows = []; //For Saving all Created Rows

    for (int i = 0; i < rowHeaders.length; i++) {
      List<Widget> singleRow = []; //For creating a single row
      for (int j = 0; j < columnHeaders.length; j++) {
        singleRow.add(Container(
            alignment: FractionalOffset.center,
            width: 120.0,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red),
            ),
            padding: const EdgeInsets.only(
                top: 6.0, bottom: 6.0, right: 3.0, left: 3.0),
            child: Radio(
              value: j, //Index of created Radio Button
              groupValue: selected[rowHeaders[i]] !=
                      null //If groupValue is equal to value, the radioButton will be selected
                  ? selected[rowHeaders[i]]
                  : "",
              onChanged: (value) {
                this.setState(() {
                  selected[rowHeaders[i]] =
                      value; //Adding selected rowName with its Index in a Map tagged "selected"
                  print("${rowHeaders[i]} ==> $value");
                });
              },
            )));
      }
      //Adding single Row to allRows widget
      allRows.add(Container(
          child: Row(
        children: [
          Container(
            alignment: FractionalOffset.centerLeft,
            width: 140.0,
            padding: const EdgeInsets.only(
                top: 6.0, bottom: 6.0, right: 3.0, left: 10.0),
            child: Text(
              rowHeaders[i],
              style: TextStyle(color: Colors.red),
              textAlign: TextAlign.center,
            ),
          )
        ]..addAll(singleRow), //Add single row here
      )));
    }
    return allRows; //Return all single rows
  }
}
