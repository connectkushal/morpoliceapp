import 'package:flutter/material.dart';
import '../resources/complain_bloc.dart';

class ComplainWidget extends StatefulWidget {
  @override
  _ComplainWidgetState createState() => _ComplainWidgetState();
}

class _ComplainWidgetState extends State<ComplainWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            Text(
              "Category",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            DropdownButton(
              isExpanded: true,
              value: cpBloc.selectedCategory,
              items: cpBloc.categoryDropdown,
              onChanged: (value) {
                //set category to selected and show respective subcategory
                cpBloc.selectedCategory = value;
                cpBloc.selectedSubcategory = 0;

                setState(() {});
              },
            ),
            SizedBox(height: 20),
            Text(
              "Subcategory",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            DropdownButton(
              isExpanded: true,
              value: cpBloc.selectedSubcategory,
              items: cpBloc.getSubcategoryDropdown(),
              onChanged: (value) {
                //set subcategory to selected
                cpBloc.selectedSubcategory = value;
                setState(() {});
              },
            ),
            SizedBox(height: 20),
            Text(
              "Complain",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(
              onChanged: (value) {
                cpBloc.complainBody = value;
                setState(() {});
              },
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                  //fillColor: Colors.limeAccent,
                  filled: true,
                  //labelText: "Enter Complain",
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0)),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Container(),
                  ),
                  RaisedButton(
                    child: Text("Submit Complain"),
                    onPressed: cpBloc.complainBody == ''
                        ? null
                        : () async {
                            // send complain and navigator.pop
                            await cpBloc.submitComplain();
                            cpBloc.selectedCategory = 0;
                            cpBloc.selectedSubcategory = 0;
                            cpBloc.complainBody = '';
                            setState(() {});

                            Navigator.of(context).pop(true);
                          },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
