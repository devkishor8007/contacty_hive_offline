import 'package:contact_flutter2021/model/contact_model.dart';
import 'package:contact_flutter2021/pages/detail_page.dart';
import 'package:contact_flutter2021/utilities/constant.dart';
import 'package:contact_flutter2021/utilities/routes.dart';
import 'package:contact_flutter2021/utilities/widget.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Box box = Hive.box<Contact>('makecontactapps');
  final changeTheme =
      Hive.box<bool>("darkmodetheme").get('isdark', defaultValue: false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBaar(appname),
      drawer: openDrawer(context),
      body: ValueListenableBuilder(
          valueListenable: box.listenable(),
          builder: (context, Box box, widget) {
            if (box.isEmpty) {
              return const Center(child: Text('Empty Contact'));
            } else {
              return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  reverse: true,
                  shrinkWrap: true,
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    Contact contact = box.getAt(index);
                    String? relation = relationshipString[contact.relation];
                    return Dismissible(
                      background: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 40.0,
                          ),
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20.0),
                        ),
                      ),
                      key: ValueKey(contact),
                      onDismissed: (dir) {
                        box.deleteAt(index);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            duration: const Duration(seconds: 1),
                            content: Text('${contact.name} deleted!')));
                      },
                      direction: DismissDirection.endToStart,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ListTile(
                            title: Text(contact.name),
                            subtitle: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(contact.phone),
                                Text('$relation'),
                                Text('Age: ${contact.age}'),
                              ],
                            ),
                            onTap: () {
                              pushRouteReplacement(context,
                                  widget: DetailPage(
                                      contact: contact, relation: "$relation"));
                            },
                            // trailing:
                          ),
                        ),
                      ),
                    );
                  });
            }
          }),
    );
  }
}
