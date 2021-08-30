import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:toast/toast.dart';
import 'package:belajargetx2/model/claim_model.dart';
import 'package:belajargetx2/service/claim_service.dart';

class CreateForm extends StatefulWidget {
  const CreateForm({Key key}) : super(key: key);

  @override
  _CreateFormState createState() => _CreateFormState();
}

class _CreateFormState extends State<CreateForm> {
  Person selectedPerson;
  List<Person> persons = [
    Person("Kesehatan"),
    Person("Parkir"),
    Person("Education")
  ];
  TextEditingController amount = TextEditingController();
  TextEditingController description = TextEditingController();

  add(ClaimModel claimModel) async {
    await ClaimService().addClaim(claimModel).then((success) {
      Toast.show("add successful", context, gravity: Toast.CENTER, duration: 2);
      print("add successful");
    });
  }

  List<DropdownMenuItem> generateItems(List<Person> persons) {
    List<DropdownMenuItem> items = [];
    for (var item in persons) {
      items.add(DropdownMenuItem(
        child: Text(item.name),
        value: item,
      ));
    }
    return items;
  }

  @override
  void initState() {
    print("halaman 2 refresh");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            RichText(
                text: TextSpan(
                    text: "Input your Claim here",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)))
          ],
        ),
        SizedBox(
          height: 35,
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(10),
          child: Text("Claim Type"),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black)),
          child: DropdownButton(
            isExpanded: true,
            hint: Text("select type of claim"),
            underline: SizedBox(),
            value: selectedPerson,
            items: generateItems(persons),
            onChanged: (item) {
              setState(() {
                selectedPerson = item;
              });
            },
          ),
        ),
        Text(
            (selectedPerson != null)
                ? selectedPerson.name
                : "belum ada yang terpilih",
            style: TextStyle(fontSize: 18)),
        SizedBox(
          height: 5,
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(10),
          child: Text("Total Amount"),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black)),
          child: TextField(
            controller: amount,
            decoration: InputDecoration(
              hintText: "Amount",
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(10),
          child: Text("Description"),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black)),
          child: TextField(
            controller: description,
            decoration: InputDecoration(
              hintText: "type description about your claim",
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        InkWell(
          onTap: () async {
            if (amount.text.isEmpty ||
                description.text.isEmpty ||
                selectedPerson == null) {
              Toast.show("This field is required", context,
                  gravity: Toast.CENTER, duration: 2);
            } else {
              ClaimModel claimModel = ClaimModel(
                  typeclaim: selectedPerson.name,
                  amount: amount.text,
                  description: description.text);
              add(claimModel);
            }
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.amber, borderRadius: BorderRadius.circular(20)),
            alignment: Alignment.center,
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text("Submit"),
          ),
        ),
      ],
    );
  }
}

class Person {
  String name;
  Person(this.name);
}
