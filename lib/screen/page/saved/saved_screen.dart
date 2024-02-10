import 'package:familiar/screen/page/home/hive_saved/boxes.dart';
import 'package:familiar/screen/page/home/hive_saved/person.dart';
import 'package:familiar/screen/page/saved/widget/saved_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SaveScreen extends StatefulWidget {
  const SaveScreen({super.key});
  @override
  State<SaveScreen> createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 27, 32, 84),
              Color.fromARGB(255, 11, 6, 42),
              Colors.black,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      Person person = boxPersons.getAt(index);
                      return SavedItemWidget(
                        personModel: person,
                        onPress: () {
                          setState(() {
                            boxPersons.deleteAt(index);
                          });
                        },
                      );
                    },
                    itemCount: boxPersons.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
