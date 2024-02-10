import 'dart:io';
import 'package:familiar/core/image/app_images.dart';
import 'package:familiar/screen/page/home/hive_saved/boxes.dart';
import 'package:familiar/screen/page/home/hive_saved/person.dart';
import 'package:familiar/style/app_text_styles.dart';
import 'package:familiar/widgets/app_unfocuser.dart';
import 'package:familiar/widgets/button_widget.dart';
import 'package:familiar/widgets/custom_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController controllerNameUserName = TextEditingController();
  final TextEditingController controllerAge = TextEditingController();
  final TextEditingController controllerYear = TextEditingController();
  final TextEditingController controllerDesciption = TextEditingController();

  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return AppUnfocuser(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Home',
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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white.withOpacity(0.06),
                          Colors.white.withOpacity(0.06),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 15.h),
                          Row(
                            children: [
                              Container(
                                width: 175,
                                height: 165,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: selectedImage != null
                                      ? DecorationImage(
                                          image: FileImage(
                                            File(selectedImage!.path),
                                          ),
                                          fit: BoxFit.fill,
                                        )
                                      : const DecorationImage(
                                          image: AssetImage(
                                            AppImages.user,
                                          ),
                                          fit: BoxFit.fill,
                                        ),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Expanded(
                                child: Column(
                                  children: [
                                    ButtonWidget(
                                      color: Colors.indigo.withOpacity(0.8),
                                      onPress: () {
                                        pickerCamery();
                                      },
                                      text: 'Kамерa',
                                      radius: 15,
                                    ),
                                    SizedBox(height: 15.h),
                                    ButtonWidget(
                                      color: Colors.indigo.withOpacity(0.8),
                                      onPress: () {
                                        pickerGallery();
                                      },
                                      text: 'Галерея',
                                      radius: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15.h),
                          CustomTextField(
                            controller: controllerNameUserName,
                            hintText: ' Имя и Фамилия',
                            minLength: 30,
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextField(
                                  hintText: ' Возраст',
                                  minLength: 2,
                                  controller: controllerAge,
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                              SizedBox(width: 10.h),
                              Expanded(
                                child: CustomTextField(
                                  hintText: ' Год',
                                  minLength: 4,
                                  controller: controllerYear,
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          CustomTextField(
                            hintText: ' Описание о Человеке',
                            controller: controllerDesciption,
                            minLines: 11,
                            maxLines: 11,
                            minLength: 500,
                          ),
                          SizedBox(height: 15.h),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    children: [
                      Expanded(
                        child: ButtonWidget(
                          radius: 30,
                          color: Colors.red.withOpacity(0.7),
                          onPress: () {
                            setState(() {
                              controllerNameUserName.text = '';
                              controllerAge.text = '';
                              controllerYear.text = '';
                              controllerDesciption.text = '';
                              selectedImage = null;
                            });
                          },
                          text: 'Очистить',
                        ),
                      ),
                      SizedBox(width: 15.h),
                      Expanded(
                        child: ButtonWidget(
                          radius: 30,
                          color: Colors.indigo.withOpacity(0.8),
                          onPress: () {
                            if (controllerNameUserName.text.isEmpty &&
                                controllerAge.text.isEmpty &&
                                controllerYear.text.isEmpty &&
                                controllerDesciption.text.isEmpty) return;
                            setState(() {
                              boxPersons.add(
                                Person(
                                  image: selectedImage?.path,
                                  nameUserName: controllerNameUserName.text,
                                  age: controllerAge.text,
                                  year: controllerYear.text,
                                  desciption: controllerDesciption.text,
                                ),
                              );
                            });
                          },
                          text: 'Сохранить',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 115.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future pickerGallery() async {
    final retuImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (retuImage == null) return;
    setState(() {
      selectedImage = File(retuImage.path);
    });
  }

  Future pickerCamery() async {
    final retuImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if (retuImage == null) return;
    setState(() {
      selectedImage = File(retuImage.path);
    });
  }
}
