import 'package:contact_flutter2021/model/contact_model.dart';
import 'package:contact_flutter2021/utilities/widget.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final Contact contact;
  final String relation;
  const DetailPage({Key? key, required this.contact, required this.relation})
      : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    String contactname = widget.contact.name;
    String name = contactname.substring(0, 1);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.contact.name),
      ),
      drawer: openDrawer(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: size.height * 0.01),
          Center(
            child: CircleAvatar(
              radius: 35,
              backgroundColor: Colors.red,
              child: Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: Theme.of(context).textTheme.headline3!.fontSize,
                ),
              ),
            ),
          ),
          SizedBox(height: size.height * 0.01),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.contact.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Theme.of(context).textTheme.headline6!.fontSize,
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Text(
                widget.contact.phone,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: Theme.of(context).textTheme.headline6!.fontSize,
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Text(
                widget.relation,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: Theme.of(context).textTheme.headline6!.fontSize,
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Text(
                "Age: " + widget.contact.age,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: Theme.of(context).textTheme.headline6!.fontSize,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
