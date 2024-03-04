//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:graduation_project/widget/widgets%20screen%20(all%20widgets).dart';
//
// import '../../providers_Folder/auth/resetpassword_controller.dart';
// import '../../services/colors.dart';
// import '../../widget/auth/custombuttonauth.dart';
// import '../../widget/auth/customtextbodyauth.dart';
// import '../../widget/auth/customtextformauth.dart';
// import '../../widget/auth/customtexttitleauth.dart';
//
// class ResetPassword extends StatelessWidget {
//   const ResetPassword({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     ResetPasswordControllerImp controller =
//         Get.put(ResetPasswordControllerImp());
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: AppColor.backgroundcolor,
//         elevation: 0.0,
//         title: Text('ResetPassword',
//             style: Theme.of(context)
//                 .textTheme
//                 .headline1!
//                 .copyWith(color: AppColor.grey)),
//       ),
//       body: Container(
//         padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
//         child: Form(
//           key: controller.formstate,
//           child: ListView(children: [
//             const SizedBox(height: 20),
//             CustomTextTitleAuth(text: "35".tr),
//             const SizedBox(height: 10),
//             CustomTextBodyAuth(text: "35".tr),
//             const SizedBox(height: 15),
//             CustomTextFormAuth(
//               isNumber: false ,
//               valid: (val) {
//                 return ValidatorScreen(val!, 3, 40, "password");
//               },
//               mycontroller: controller.password,
//               hinttext: "13".tr,
//               iconData: Icons.lock_outline,
//               labeltext: "19".tr,
//               // mycontroller: ,
//             ),
//             CustomTextFormAuth(
//               isNumber: false ,
//
//               valid: (val) {
//                 return ValidatorScreen(val!, 3, 40, "password");
//               },
//               mycontroller: controller.password,
//               hinttext: "Re" + " " + "13".tr,
//               iconData: Icons.lock_outline,
//               labeltext: "19".tr,
//               // mycontroller: ,
//             ),
//             CustomButtomAuth(
//                 text: "33".tr,
//                 onPressed: () {
//                   controller.goToSuccessResetPassword();
//                 }),
//             const SizedBox(height: 40),
//           ]),
//         ),
//       ),
//     );
//   }
// }
