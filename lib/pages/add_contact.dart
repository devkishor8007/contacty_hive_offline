import 'package:contact_flutter2021/model/contact_model.dart';
import 'package:contact_flutter2021/utilities/widget.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AddContact extends StatefulWidget {
  const AddContact({Key? key}) : super(key: key);

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final Box addBox = Hive.box<Contact>('makecontactapps');

  Relation? relation;

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBaar('Add Contact'),
        drawer: openDrawer(context),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _key,
            child: Column(
              children: [
                makeTextField(
                  controller: _name,
                  validator: (value) {
                    String pattern = r'([A-Z][a-z]*)';
                    RegExp regexp = RegExp(pattern);
                    if (!regexp.hasMatch(value!)) {
                      return 'First letter should be capital';
                    } else if (value.isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                  suffixIcon: const Icon(Icons.person),
                ),
                makeTextField(
                  hintText: "add your age",
                  controller: _age,
                  keyboardType: TextInputType.number,
                  maxlength: 2,
                  validator: (value) =>
                      value!.isEmpty ? 'Age is required' : null,
                  suffixIcon: const Icon(
                    Icons.align_vertical_center,
                  ),
                ),
                makeTextField(
                  hintText: "add your phone number",
                  controller: _phone,
                  maxlength: 10,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    String pattern = r'([9][8][0-9]{8})';
                    RegExp regexp = RegExp(pattern);
                    if (!regexp.hasMatch(value!) || value.length != 10) {
                      return 'Add your valid Phone Number';
                    } else if (value.length != 10) {
                      return 'Phone is required';
                    }
                    return null;
                  },
                  suffixIcon: const Icon(
                    Icons.contact_phone,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField<Relation>(
                    icon: const Icon(
                      Icons.family_restroom,
                      color: Colors.grey,
                    ),
                    items: relationshipString.keys.map((Relation value) {
                      return DropdownMenuItem<Relation>(
                        value: value,
                        child: Text('${relationshipString[value]}'),
                      );
                    }).toList(),
                    value: relation,
                    hint: const Text("Relationship"),
                    onChanged: (value) {
                      setState(() {
                        relation = value!;
                      });
                    },
                    validator: (value) =>
                        value == null ? 'Choose any one' : null,
                  ),
                ),
                MaterialButton(
                  color: Colors.lightBlue,
                  onPressed: () {
                    var valid = _key.currentState!.validate();
                    if (!valid) {
                    } else {
                      Contact contact = Contact(
                        name: _name.text,
                        phone: _phone.text,
                        age: _age.text,
                        relation: relation!,
                      );
                      addBox.add(contact);
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Add Contact'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
