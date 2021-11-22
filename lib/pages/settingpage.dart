import 'package:contact_flutter2021/utilities/widget.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBaar("Settings"),
        drawer: openDrawer(context),
        body: ValueListenableBuilder<Box<bool>>(
            valueListenable: Hive.box<bool>('darkmodetheme').listenable(),
            builder: (context, Box box, widget) {
              final isDark = box.get('isdark', defaultValue: false) ?? false;
              return SwitchListTile(
                  title: const Text('Switch Theme'),
                  value: isDark,
                  onChanged: (val) {
                    box.put('isdark', !isDark);
                  });
            }),
      ),
    );
  }
}
