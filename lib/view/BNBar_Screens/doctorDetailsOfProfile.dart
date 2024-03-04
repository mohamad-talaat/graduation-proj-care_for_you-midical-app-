import 'dart:io';
import 'package:graduation_project/controller/controller.dart';
import 'package:graduation_project/controller/location.dart';
import 'package:graduation_project/core/services/colors.dart';
import 'package:graduation_project/view/widget/widgets%20screen%20(all%20widgets).dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';


class doctorDetailsOfProfile extends StatefulWidget {
  State<doctorDetailsOfProfile> createState() => _userprofileState();
}

class _userprofileState extends State<doctorDetailsOfProfile> {
  final bool isRegistered = false;
  DateTime? _birthDate;
  TextEditingController _priceController = TextEditingController();
  TextEditingController _Location = TextEditingController();
  TextEditingController _Education = TextEditingController();
  TextEditingController _servant = TextEditingController();
  var dateController = TextEditingController();

  String price = '';
  final TextEditingController usernameController = TextEditingController();
  String? selectedOption;
  DateTime _selectedValue = DateTime.now();
  Future<void> _pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  File? _image;

  @override
  Widget build(BuildContext context) {
    getxController ctrl = Get.put(getxController());

    _Location.text = ctrl.locationField;
    final isDark=Theme.of(context).brightness==Brightness.dark;
    dynamic fontcolor=isDark?Colors.white:Colors.black;

    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 15.0,
                ),
                Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Center(
                        child: Stack( alignment: Alignment.center,
                          children: [

                            if (_image != null)
                              Image.file(
                                _image!,
                                height: 200,
                              ),
                            if (_image == null)
                              Image.asset(
                                "assets/images/imageProfile.png",
                                height: 200,
                              ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 200),
                              child: MaterialButtonScreen(
                                titleOfButton: "Select Image",
                                colorOfButton: mainColor,
                                widthOfButton: 200,
                                onPressed: () {
                                  _pickImage(ImageSource.gallery);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                 SizedBox(height: 20,),
                  ],
                ),

                // isRegistered ? Container(
                //   width: 300,
                //   height: 250,
                //   child: Center(
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         if (_image != null)
                //           Image.file(
                //             _image!,
                //             height: 200,
                //           ),
                //        SizedBox(height: 5),
                //        Padding(
                //          padding: const EdgeInsets.only(left: 10.0 , bottom: 50),
                //          child: IconButton(
                //             onPressed: () => _pickImage(ImageSource.gallery),
                //             icon: Icon(Icons.picture_in_picture ,size: 50,),
                //       //    child: Text('Pick Image'),
                //           ),
                //        ),
                //       ],
                //     ),
                //   ),
                // )
                // : Container(
                //   width: double.infinity,
                //   height: double.infinity,
                //   color: Colors.green,
                // ),
                SizedBox(
                  height: 30,
                ),

                TextFormFieldForProfile(
                  controller: usernameController,
                  keyboardType: TextInputType.name,
                  label: "Your Full name".tr,
                ),
                TextFormFieldForProfile(
                   //  maxLines: 2,
                  //   readOnly: false,
                  controller: _Location,
                  keyboardType: TextInputType.streetAddress,
                  label: "select  your Location".tr,
                  onTap: () async {
                    await ctrl.getAddress().then((_) {
                      _Location.text = ctrl.locationField;
                    });
                  },

                ),
                SizedBox(height: 10),
                // TextFormField(
                //   maxLines: 2,
                //   readOnly: false,
                //   controller: _Location,
                //   keyboardType: TextInputType.streetAddress,
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.all(Radius.circular(0)),
                //     ),
                //     labelText: "select  your Location".tr,
                //     hintText: "Location",
                //     labelStyle: TextStyle(fontSize: 15),
                //   ),
                //   style: TextStyle(color:fontcolor),
                //   onTap: () async {
                //     await ctrl.getAddress().then((_) {
                //       _Location.text = ctrl.locationField;
                //     });
                //   },
                // ),
                SizedBox(height: 10),
                TextFormFieldForProfile(
                  controller: _Education,
                  keyboardType: TextInputType.name,
                  label: "Your Education".tr,
                  // validator: (value) {
                  //   return
                  //     ValidatorScreen(value!, 2, 90, "usernameController");
                  // },
                ),

                SizedBox(
                  height: 20,
                ),
                IntlPhoneField(style:TextStyle(color:fontcolor),
                  decoration: InputDecoration(
                    labelStyle: Theme.of(context).textTheme.bodyText1,
                    labelText: 'Your Phone Number'.tr,

                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  onChanged: (phone) {
                    print(phone.completeNumber);
                  },
                  onCountryChanged: (country) {
                    print('Country changed to: ' + country.name);
                  },
                ),
                SizedBox(
                  height: 4,
                ),
                IntlPhoneField(
                  style:TextStyle(color:fontcolor),
                  decoration: InputDecoration(
                    labelStyle: Theme.of(context)
                        .textTheme
                        .bodyText1, // جعل النص يظهر في أقصى اليسار

                    labelText: 'Your Second Number (optional)'.tr,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  onChanged: (phone) {
                    print(phone.completeNumber);
                  },
                  onCountryChanged: (country) {
                    print('Country changed to: ' + country.name);
                  },
                ),
                SizedBox(height: 4),
                TextField(
                  style:TextStyle(color:fontcolor),
                  maxLines: null, // يمكن للحقل أن يحتوي على عدة أسطر من النص
                  keyboardType:
                  TextInputType.multiline, // يسمح بإدخال نص متعدد الأسطر
                  decoration: InputDecoration(
                    labelStyle: Theme.of(context)
                        .textTheme
                        .bodyText1, // جعل النص يظهر في أقصى اليسار

                    contentPadding: EdgeInsets.all(50),
                    label: Text(
                      'Write about your skills and Experixence'.tr,
                      overflow: TextOverflow.ellipsis,
                    ),
                    border: OutlineInputBorder(), // إضافة حدود للحقل
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  style:TextStyle(color:fontcolor),
                  decoration: InputDecoration(
                    labelStyle: Theme.of(context)
                        .textTheme
                        .bodyText1, // جعل النص يظهر في أقصى اليسار
                    border: OutlineInputBorder(),
                    labelText: selectedOption != null
                        ? selectedOption
                        : "Choose Your Gender".tr,
                    suffixIcon: DropdownButton<String>(
                      //   value: "choose Your ",
                      icon: Icon(Icons.keyboard_arrow_down, size: 40),
                      onChanged: (newValue) {
                        setState(() {
                          selectedOption = newValue!;
                        });
                      },
                      items: <String>['Male'.tr, 'Female'.tr]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  style:TextStyle(color:fontcolor),
                  readOnly: true,
                  controller: TextEditingController(
                    text: _birthDate != null
                        ? DateFormat('yyyy-MM-dd').format(_birthDate!)
                        : '',
                  ),
                  decoration: InputDecoration(
                      labelStyle: Theme.of(context)
                          .textTheme
                          .bodyText1, // جعل النص يظهر في أقصى اليسار
                      labelText: 'Your Birthday'.tr,
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.date_range)),
                  onTap: () async {
                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: _birthDate ?? DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (selectedDate != null) {
                      setState(() {
                        _birthDate = selectedDate;
                      });
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),

                TextFormFieldForProfile(
                  controller: _servant,
                  keyboardType: TextInputType.number,
                  label: "The Servant Price :$price".tr,
                  suffixIcon: Icons.attach_money,
                  // validator: (value) {
                  //   return
                  //     ValidatorScreen(value!, 2, 90, "usernameController");
                  // },
                ),
                SizedBox(height: 20),

                MaterialButtonScreen(
                  titleOfButton:"save Data".tr,
                  widthOfButton: double.infinity,
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                  colorOfButton: mainColor,
                  onPressed: () {
                    Get.to(Location());
                  },),

                SizedBox(height: 100),
              ],
            ),
          ),
        ));
  }
}

class TextFormFieldForProfile extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String label;
  bool? obsureText;
  final IconData? prefix;
  final IconData? suffixIcon;
  //final Function()? suffixPressed;
  final String? Function(String?)? validator;
  final void Function()? onPressed;
  final void Function()? onTap;

  TextFormFieldForProfile({
    Key? key,
    required this.controller,
    required this.keyboardType,
    required this.label,
    this.prefix,
    this.obsureText,
    this.suffixIcon,
    this.validator,
    this.onPressed,
    this.onTap,
  }) : super(key: key);

  Widget build(BuildContext context) {
    final isDark=Theme.of(context).brightness==Brightness.dark;
    dynamic fontcolor=isDark?Colors.white:Colors.black;
    return Container(
      // margin: EdgeInsets.only(top: 10),
      child: TextFormField(
        style:TextStyle(color:fontcolor),
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obsureText == null || obsureText == false ? false : true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(0)),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 2),
          labelText: label,
          labelStyle: Theme.of(context)
              .textTheme
              .bodyText1, // جعل النص يظهر في أقصى اليسار
          suffixIcon: IconButton(
            onPressed: onPressed,
            icon: Icon(suffixIcon),
          ),
        ),
        onTap: onTap,
        validator: validator,
      ),
    );
  }
}

