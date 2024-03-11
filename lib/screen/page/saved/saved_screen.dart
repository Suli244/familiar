import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:familiar/screen/page/saved/widget/saved_item_widget.dart';
import 'package:familiar/servise/firestore.dart';
import 'package:familiar/style/app_text_styles.dart';
import 'package:familiar/widgets/app_unfocuser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SaveScreen extends StatefulWidget {
  const SaveScreen({super.key});
  @override
  State<SaveScreen> createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
  final Firestore firestoreServise = Firestore();

  @override
  Widget build(BuildContext context) {
    return AppUnfocuser(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Сохраненные',
            style: AppTextStyles.s21W600(color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(255, 27, 32, 84),
        ),
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
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: StreamBuilder<QuerySnapshot>(
                stream: firestoreServise.getHuman(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List notesList = snapshot.data!.docs;
                    return ListView.builder(
                      itemCount: notesList.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot document = notesList[index];
                        String docId = document.id;
                        Map<String, dynamic> data =
                            document.data() as Map<String, dynamic>;
                        return SavedItemWidget(
                          modelFirbes: data,
                          onPress: () {
                            firestoreServise.deleteHuman(docId);
                            // setState(() {
                            //   boxPersons.deleteAt(index);
                            // });
                          },
                          docId: docId,
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: Text('Ничего нету...'),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
