import 'package:contact_flutter2021/pages/add_contact.dart';
import 'package:contact_flutter2021/pages/homepage.dart';
import 'package:contact_flutter2021/pages/settingpage.dart';
import 'package:contact_flutter2021/utilities/constant.dart';
import 'package:contact_flutter2021/utilities/routes.dart';
import 'package:flutter/material.dart';

Widget makeTextField({
  required TextEditingController controller,
  TextInputType? keyboardType,
  int? maxlength,
  String? hintText,
  String? Function(String?)? validator,
  Widget? suffixIcon,
}) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: TextFormField(
      validator: validator,
      controller: controller,
      maxLength: maxlength,
      keyboardType: keyboardType ?? TextInputType.name,
      decoration: InputDecoration(
        hintText: hintText ?? "add your name",
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        suffixIcon: suffixIcon,
      ),
    ),
  );
}

Widget openDrawer(context) {
  return Drawer(
    child: ListView(
      padding: const EdgeInsets.all(0),
      children: [
        UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            radius: 35,
            backgroundColor: Colors.blueAccent,
            child: Text(
              "C",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: Theme.of(context).textTheme.headline3!.fontSize,
              ),
            ),
          ),
          accountName: const Text(appname),
          accountEmail: const Text(appemail),
        ),
        ListTile(
            title: const Text('Home'),
            leading: const Icon(Icons.home),
            onTap: () {
              pushRouteToNextPage(
                context,
                widget: const HomePage(),
              );
            }),
        ListTile(
            title: const Text('Add Contact'),
            leading: const Icon(Icons.dialpad),
            onTap: () {
              pushRouteToNextPage(context, widget: const AddContact());
            }),
        ListTile(
            title: const Text('Setting'),
            leading: const Icon(Icons.settings),
            onTap: () {
              pushRouteToNextPage(
                context,
                widget: const SettingPage(),
              );
            }),
      ],
    ),
  );
}

AppBar appBaar(String name) => AppBar(
      title: Text(name),
    );
