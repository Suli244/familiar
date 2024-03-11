import 'dart:io';
import 'package:familiar/screen/page/saved/widget/styled_toasts.dart';
import 'package:familiar/servise/firestore.dart';
import 'package:familiar/style/app_text_styles.dart';
import 'package:familiar/widgets/button_widget.dart';
import 'package:familiar/widgets/custom_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class SavedItemWidget extends StatefulWidget {
  const SavedItemWidget({
    super.key,
    // required this.personModel,

    required this.onPress,
    required this.modelFirbes,
    required this.docId,
  });
  // final Person personModel;
  final Function() onPress;
  final Map<String, dynamic> modelFirbes;
  final String docId;
  @override
  State<SavedItemWidget> createState() => _SavedItemWidgetState();
}

class _SavedItemWidgetState extends State<SavedItemWidget> {


  final Firestore firestoreServise = Firestore();
  final TextEditingController controllerNameUserName = TextEditingController();
  final TextEditingController controllerAge = TextEditingController();
  final TextEditingController controllerYear = TextEditingController();
  final TextEditingController controllerDesciption = TextEditingController();
  File? selectedImage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Container(
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
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 270,
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: widget.modelFirbes['Image'] !=
                            'https://i.ibb.co/LvH8Wgr/user.png'
                        ? DecorationImage(
                            image: FileImage(
                              File(widget.modelFirbes['Image']),
                            ),
                            alignment: Alignment.topCenter,
                            fit: BoxFit.cover,
                          )
                        : DecorationImage(
                            image: NetworkImage(widget.modelFirbes['Image']),
                            alignment: Alignment.topCenter,
                            fit: BoxFit.fill,
                          ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Text(
                    'Имя и Фамилия:',
                    style: AppTextStyles.s16W400(
                      color: Colors.white.withOpacity(0.70),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      widget.modelFirbes['Name'],
                      style: AppTextStyles.s16W400(
                        color: Colors.white.withOpacity(0.70),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              Row(
                children: [
                  Text(
                    'Возраст:',
                    style: AppTextStyles.s16W400(
                      color: Colors.white.withOpacity(0.70),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      widget.modelFirbes['Age'],
                      style: AppTextStyles.s16W400(
                        color: Colors.white.withOpacity(0.70),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              Row(
                children: [
                  Text(
                    'Год:',
                    style: AppTextStyles.s16W400(
                      color: Colors.white.withOpacity(0.70),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      widget.modelFirbes['Year'],
                      style: AppTextStyles.s16W400(
                        color: Colors.white.withOpacity(0.70),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              Text(
                'Описание о Человеке:',
                style: AppTextStyles.s16W400(
                  color: Colors.white.withOpacity(0.70),
                ),
              ),
              Text(
                widget.modelFirbes['Desciption'],
                style: AppTextStyles.s16W400(
                  color: Colors.white.withOpacity(0.70),
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 11,
              ),
              SizedBox(height: 15.h),
              Row(
                children: [
                  const Spacer(),
                  ButtonWidget(
                    radius: 30,
                    width: 130,
                    height: 50,
                    color: Colors.red.withOpacity(0.7),
                    onPress: widget.onPress,
                    text: 'Удалить',
                  ),
                  const Spacer(),
                  ButtonWidget(
                    radius: 30,
                    width: 130,
                    height: 50,
                    color: Colors.blue.withOpacity(0.7),
                    onPress: () {
                      final String name = widget.modelFirbes['Name'];
                      final String age = widget.modelFirbes['Age'];
                      final String year = widget.modelFirbes['Year'];
                      final String desciption =
                          widget.modelFirbes['Desciption'];
                      final String iamg = widget.modelFirbes['Image'];
                      controllerNameUserName.text = name;
                      controllerAge.text = age;
                      controllerYear.text = year;
                      controllerDesciption.text = desciption;
                      selectedImage = File(iamg);
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25).r,
                          ),
                          child: Container(
                            height: 1000.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromARGB(255, 27, 32, 84),
                                  Color.fromARGB(255, 11, 6, 42),
                                  Colors.black,
                                ],
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 15),
                                      Row(
                                        children: [
                                          Container(
                                            width: 155,
                                            height: 155,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              image: selectedImage!.path !=
                                                      'https://i.ibb.co/LvH8Wgr/user.png'
                                                  ? DecorationImage(
                                                      image: FileImage(
                                                        File(
                                                          selectedImage!.path,
                                                        ),
                                                      ),
                                                      fit: BoxFit.fill,
                                                    )
                                                  : DecorationImage(
                                                      image: NetworkImage(
                                                        iamg,
                                                      ),
                                                      fit: BoxFit.fill,
                                                    ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                ButtonWidget(
                                                  color: Colors.indigo
                                                      .withOpacity(0.8),
                                                  onPress: () async {
                                                    await pickerCamery();
                                                    setState(() {});
                                                  },
                                                  text: 'Камера',
                                                  radius: 15,
                                                ),
                                                const SizedBox(height: 15),
                                                ButtonWidget(
                                                  color: Colors.indigo
                                                      .withOpacity(0.8),
                                                  onPress: () async {
                                                    await pickerGallery();

                                                    setState(() {});
                                                  },
                                                  text: 'Галерея',
                                                  radius: 15,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      CustomTextField(
                                        controller: controllerNameUserName,
                                        hintText: ' Имя и Фамилия',
                                        minLength: 30,
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: CustomTextField(
                                              hintText: ' Возраст',
                                              minLength: 2,
                                              controller: controllerAge,
                                              keyboardType:
                                                  TextInputType.number,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: CustomTextField(
                                              hintText: ' Год',
                                              minLength: 4,
                                              controller: controllerYear,
                                              keyboardType:
                                                  TextInputType.number,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      CustomTextField(
                                        hintText: ' Описание о человеке',
                                        controller: controllerDesciption,
                                        minLines: 11,
                                        maxLines: 11,
                                        minLength: 500,
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: ButtonWidget(
                                              radius: 30,
                                              color:
                                                  Colors.red.withOpacity(0.7),
                                              onPress: () {
                                                Navigator.pop(context);
                                              },
                                              text: 'Выйти',
                                            ),
                                          ),
                                          const SizedBox(width: 15),
                                          Expanded(
                                            child: ButtonWidget(
                                              radius: 30,
                                              color: Colors.indigo
                                                  .withOpacity(0.8),
                                              onPress: () {
                                                firestoreServise.upDataHumans(
                                                  widget.docId,
                                                  controllerNameUserName.text,
                                                  controllerAge.text,
                                                  controllerYear.text,
                                                  controllerDesciption.text,
                                                  selectedImage?.path ?? iamg,
                                                );
                                                print(selectedImage!.path);
                                                Navigator.pop(context);
                                              },
                                              text: 'Сохранить',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    text: 'изменить',
                  ),
                  const Spacer(),
                ],
              ),
            ],
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
