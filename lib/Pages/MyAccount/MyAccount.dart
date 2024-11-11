import 'package:dental_supplies/Pages/Auth/Login.dart';
import 'package:dental_supplies/Utils/Api.dart';
import 'package:dental_supplies/Utils/ColorsApp.dart';
import 'package:dental_supplies/Utils/LinksApp.dart';
import 'package:dental_supplies/Utils/Validation/Validation.dart';
import 'package:dental_supplies/Utils/shared_preferences.dart';
import 'package:dental_supplies/Widget/AccounsWidget/ButtonAccount.dart';
import 'package:dental_supplies/Widget/AccounsWidget/ButtonsUpdateAccounts.dart';
import 'package:dental_supplies/Widget/AccounsWidget/TextFieldAccount.dart';
import 'package:dental_supplies/Widget/Loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  bool updateInfo = false;
  bool updatePassword = false;

  bool loading = true;
  Map data = {};
  String id = "";
  String errorName = "";
  String errorPhone = "";
  String errorOldPassword = "";
  String errorNewPassword = "";
  String errorConfirmPassword = "";

  Future<void> getDataForApi() async {
    loading = true;
    setState(() {});
    data.clear();
    id = await Cache.GetString("id");
    var response = await Api.get("${LinksApp.getDataProfileByID}/$id");
    if (response["status"] == "200") {
      data = response["data"];
      print(data);
      name.text = "${data["name"]}";
      phone.text = "${data["phone"]}";
    }
    loading = false;
    setState(() {});
  }

  Future<void> UpdateProfile() async {
    errorPhone = Validation.ValidationNumber(phone.text);
    errorName = Validation.ValidationText(name.text);

    if (errorName.isEmpty &&
            errorPhone.isEmpty &&
            name.text != "${data["name"]}" ||
        phone.text != "${data["phone"]}") {
      var response = await Api.put("${LinksApp.upDataDataProfileByID}/$id", {
        "name": "${name.text}",
        "phone": "${phone.text}",
      });
      if (response["status"] == "200") {
        getDataForApi();
        Get.snackbar("تنبيه", "تمت عمليه التعديل بنجاح");
      } else {
        Get.snackbar("تنبيه", response["message"],
            backgroundColor: Colors.redAccent);
      }
    } else {
      Get.snackbar("تنبيه", "يجب تغير البيانات");
    }
    setState(() {});
  }

  Future<void> UpdatePassword() async {
    errorOldPassword = Validation.ValidationPassword(oldPassword.text);
    errorNewPassword = Validation.ValidationPassword(newPassword.text);
    errorConfirmPassword = Validation.ValidationPassword(confirmPassword.text);

    if (errorOldPassword.isEmpty &&
        errorNewPassword.isEmpty &&
        errorConfirmPassword.isEmpty) {
      var response =
          await Api.put("${LinksApp.upDataPasswordProfileByID}/$id", {
        "oldPassword": "${oldPassword.text}",
        "newPassword": "${newPassword.text}",
        "confirmPassword": "${confirmPassword.text}",
      });

      if (response["status"] == "200") {
        updatePassword = !updatePassword;
        Get.snackbar("تنبيه", response["message"]);
      } else {
        Get.snackbar("تنبيه", response["message"],
            backgroundColor: Colors.redAccent);
        errorOldPassword =
            response["message"] == "كلمه السر القديمه ليست متطابقه"
                ? "كلمه السر القديمه ليست متطابقه"
                : "";
        errorConfirmPassword =
            response["message"] == "كلمه السر الجديده ليست متطابقه"
                ? "كلمه السر الجديده ليست متطابقه"
                : "";
      }
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    getDataForApi();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ClipOval(
                      child: Image.network(
                    "${data["image"]}",
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  )),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "${data["name"]}",
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    "${data["email"]}",
                    style: TextStyle(color: ColorsApp.gray),
                  ),
                  ButtonAccount(
                    title: "المعلومات الشخصية",
                    main: Icons.person_2_outlined,
                    arrow:
                        updateInfo ? Icons.arrow_upward : Icons.arrow_downward,
                    onTap: () {
                      updateInfo = !updateInfo;
                      setState(() {});
                    },
                  ),
                  // Update Profile
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(horizontal: 35),
                    width: double.infinity,
                    height: updateInfo ? 250 : 1,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFieldAccount(
                              labelText: "الاسم الكامل",
                              helper: errorName,
                              icon: Icons.person_2_outlined,
                              password: false,
                              controller: name,
                              keyboardType: TextInputType.text),
                          TextFieldAccount(
                              labelText: "رقم الهاتف",
                              helper: errorPhone,
                              icon: Icons.phone_android_outlined,
                              password: false,
                              controller: phone,
                              keyboardType: TextInputType.number),
                          ButtonsUpdateAccounts(
                            Ok: UpdateProfile,
                            Cansel: () {
                              name.text = "";
                              phone.text = "";
                              updateInfo = false;
                              setState(() {});
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  ButtonAccount(
                    title: "تغيير كلمة المرور",
                    main: Icons.lock_outline,
                    arrow: updatePassword
                        ? Icons.arrow_upward
                        : Icons.arrow_downward,
                    onTap: () {
                      updatePassword = !updatePassword;
                      setState(() {});
                    },
                  ),
                  // Update Password
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(horizontal: 35),
                    width: double.infinity,
                    height: updatePassword ? 350 : 1,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFieldAccount(
                              labelText: "كلمة المرور الحالية",
                              helper: errorOldPassword,
                              icon: Icons.lock_clock_outlined,
                              password: true,
                              controller: oldPassword,
                              keyboardType: TextInputType.text),
                          TextFieldAccount(
                              labelText: " كلمة المرور الجديدة",
                              helper: errorNewPassword,
                              icon: Icons.lock_outline,
                              password: true,
                              controller: newPassword,
                              keyboardType: TextInputType.text),
                          TextFieldAccount(
                              labelText: " تاكيد كلمة المرور",
                              helper: errorConfirmPassword,
                              icon: Icons.lock_outline,
                              password: true,
                              controller: confirmPassword,
                              keyboardType: TextInputType.text),
                          ButtonsUpdateAccounts(
                            Ok: UpdatePassword,
                            Cansel: () {
                              oldPassword.text = "";
                              newPassword.text = "";
                              confirmPassword.text = "";
                              updatePassword = false;
                              setState(() {});
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  ButtonAccount(
                    title: "تسجيل الخروج",
                    main: Icons.logout,
                    arrow: Icons.arrow_forward_ios,
                    onTap: () {
                      Cache.RemoveCache();
                      Get.offAll(() => Login());
                    },
                  ),
                ],
              ),
            ),
          );
  }
}
