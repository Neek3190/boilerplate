import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../helper/data_helper.dart';
import '../main.dart';
import '../utils/app_color.dart';
import '../utils/app_constant_size.dart';
import '../utils/app_text_sizes.dart';
import '../utils/app_text_style.dart';

class TextFieldWidget extends StatelessWidget {
  String hint;
  TextEditingController textFieldController;
  TextInputType keyboardType;
  int? maxLength;
  bool? enableEdit;
  RxBool? isPass;
  Color backgroundColor, textColor, eyeColor;
  FocusNode? focusNode;
  String suffixIcon;
  List<TextInputFormatter>? textFormatter;
  bool isMax, isSearch;

  double pLeft, pRight, borderRadius, pHorizontal, pVert;
  dynamic height;
  Function(String)? searchValue;

  TextFieldWidget({
    super.key,
    this.pLeft = AppConstSize.size0,
    this.pRight = AppConstSize.size0,
    this.keyboardType = TextInputType.text,
    this.height = AppConstSize.size50,
    this.maxLength,
    this.isPass,
    required this.textFieldController,
    required this.hint,
    this.enableEdit,
    this.textFormatter,
    this.suffixIcon = "",
    this.isSearch = false,
    this.borderRadius = AppConstSize.size0,
    this.focusNode,
    this.pHorizontal = AppConstSize.size10,
    this.pVert = AppConstSize.size12,
    this.searchValue,
    this.eyeColor = AppColor.themeColor,
    this.backgroundColor = AppColor.transparent,
    this.textColor = AppColor.black,
    this.isMax = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: pLeft,
        right: pRight,
      ),
      child: SizedBox(
        height: height == null ? null : height,
        width: Get.width,
        child: isMax
            ? Container(
                width: appWidth,
                padding: const EdgeInsets.all(
                  AppConstSize.size10,
                ),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(borderRadius + 1),
                  ),
                ),
                child: TextField(
                  controller: textFieldController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  enabled: enableEdit,
                  expands: true,
                  autofocus: false,
                  focusNode: focusNode != null ? focusNode : null,
                  maxLength: maxLength,
                  inputFormatters: textFormatter,
                  style: appTextStyle(
                    height: 1.5,
                    colour: textColor,
                    fontSize: AppTextSize.smallTextSize,
                    fontWeight: FontWeight.normal,
                  ),
                  decoration: InputDecoration(
                    helperMaxLines: maxLength,
                    border: InputBorder.none,
                    hintText: hint.tr,
                    hintStyle: appTextStyle(
                      height: 1.5,
                      // colour: AppColor.grey2,
                      fontSize: AppTextSize.smallTextSize,
                      fontWeight: FontWeight.w500,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: pHorizontal,
                      vertical: pVert,
                    ),
                    suffixIcon: suffixIcon.isNotEmpty
                        ? FittedBox(
                      fit: BoxFit.none,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                        horizontal: AppConstSize.size5,
                          vertical:AppConstSize.size15,
                        ),
                        // child: SvgPicture.asset(
                        //   suffixIcon,
                        //   width: AppConstSize.size20,
                        //   height: AppConstSize.size20,
                        //   color: AppColor.themeColor,
                        // ),
                      ),
                    )
                        : null,
                     /* suffixIcon: isSearch?
                      SvgPicture.asset(
                      AppImages.searchIcon,
                      width: AppConstSize.size20,height:AppConstSize.size20,):const SizedBox()*/
                  ),
                  onChanged: isSearch
                      ? searchValue
                      : (value) {
                          DataHelper.logValue(
                              "onChanged", textFieldController.text.toString());
                        },
                ),
              )
            : isPass == null
                ? Container(
                    height: height,
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(borderRadius + 1),
                      ),
                    ),
                    child: TextField(
                        enabled: enableEdit,
                        showCursor: true,
                        autofocus: false,
                        controller: textFieldController,
                        keyboardType: keyboardType,
                        focusNode: focusNode != null ? focusNode : null,
                        maxLength: maxLength,
                        inputFormatters: textFormatter,
                        style: appTextStyle(
                          colour: textColor,
                          height: 1.5,
                          fontSize: AppTextSize.smallTextSize,
                        ),
                        decoration: InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          hintText: hint.tr,
                          hintStyle: appTextStyle(
                            // colour: AppColor.grey2,
                            height: 1.5,
                            fontSize: AppTextSize.smallTextSize,
                            fontWeight: FontWeight.w500,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: pHorizontal,
                            vertical: pVert,
                          ),
                        ),
                        onChanged: isSearch
                            ? searchValue
                            : (value) {
                                DataHelper.logValue("isSearch", value);
                              }),
                  )
                : Obx(
                    () => Container(
                      height: height,
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(borderRadius + 1),
                        ),
                      ),
                      child: IntrinsicWidth(
                        child: TextField(
                          enabled: enableEdit,
                          textAlignVertical: TextAlignVertical.center,
                          autofocus: false,
                          controller: textFieldController,
                          focusNode: focusNode != null ? focusNode : null,
                          obscureText: isPass!.value,
                          maxLines: 1,
                          keyboardType: keyboardType,
                          maxLength: maxLength,
                          style: appTextStyle(
                            colour: textColor,
                            height: 1.5,
                            fontSize: AppTextSize.smallTextSize,
                          ),
                          inputFormatters: textFormatter,
                          decoration: InputDecoration(
                            isDense: true,
                            border: InputBorder.none,
                            suffixIcon: GestureDetector(
                              onTap: () => isPass!.value = !isPass!.value,

                              ///---- un- comment code, if show the eye in password text field --///
                              child: Icon(
                                isPass!.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: eyeColor,
                                size: AppConstSize.size25,
                              ),
                            ),
                            hintText: hint.tr,
                            hintStyle: appTextStyle(
                              // colour: AppColor.grey2,
                              height: 1.5,
                              fontSize: AppTextSize.smallTextSize,
                              fontWeight: FontWeight.w500,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: pHorizontal,
                              vertical: pVert,
                            ),
                          ),
                          onChanged: (value) {
                            DataHelper.logValue("onChanged",
                                textFieldController.text.toString().toString());
                          },
                        ),
                      ),
                    ),
                  ),
      ),
    );
  }
}
