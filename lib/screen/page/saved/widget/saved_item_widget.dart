import 'dart:io';

import 'package:familiar/core/image/app_images.dart';
import 'package:familiar/screen/page/home/hive_saved/person.dart';
import 'package:familiar/style/app_text_styles.dart';
import 'package:familiar/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SavedItemWidget extends StatefulWidget {
  const SavedItemWidget({
    super.key,
    required this.personModel,
    required this.onPress,
  });
  final Person personModel;
  final Function() onPress;
  @override
  State<SavedItemWidget> createState() => _SavedItemWidgetState();
}

class _SavedItemWidgetState extends State<SavedItemWidget> {
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
                  width: 200,
                  height: 165,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: widget.personModel.image != null
                        ? DecorationImage(
                            image: FileImage(
                              File(widget.personModel.image ?? ''),
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
                      widget.personModel.nameUserName,
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
                      widget.personModel.age,
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
                      widget.personModel.year,
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
                widget.personModel.desciption,
                style: AppTextStyles.s16W400(
                  color: Colors.white.withOpacity(0.70),
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 11,
              ),
              SizedBox(height: 15.h),
              ButtonWidget(
                radius: 30,
                width: 130,
                height: 50,
                color: Colors.red.withOpacity(0.7),
                onPress: widget.onPress,
                text: 'Удалить',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
