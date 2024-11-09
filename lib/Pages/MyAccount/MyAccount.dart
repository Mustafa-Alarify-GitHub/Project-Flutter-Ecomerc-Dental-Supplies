import 'package:dental_supplies/Pages/Auth/Login.dart';
import 'package:dental_supplies/Utils/ColorsApp.dart';
import 'package:dental_supplies/Utils/shared_preferences.dart';
import 'package:dental_supplies/Widget/AccounsWidget/ButtonAccount.dart';
import 'package:dental_supplies/Widget/AccounsWidget/ButtonsUpdateAccounts.dart';
import 'package:dental_supplies/Widget/AccounsWidget/TextFieldAccount.dart';
import 'package:flutter/cupertino.dart';
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

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ClipOval(
                child: Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkPJ6iZsZqqd58czWhuBFZoGM48N34k-HrXA&s",
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            )),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "ايمن الغابري",
              style: TextStyle(fontSize: 15),
            ),
            const Text(
              "Ayman2024@gmail.com",
              style: TextStyle(color: ColorsApp.gray),
            ),
            ButtonAccount(
              title: "المعلومات الشخصية",
              main: Icons.person_2_outlined,
              arrow: updateInfo ? Icons.arrow_upward : Icons.arrow_downward,
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
                        helper: "",
                        icon: Icons.person_2_outlined,
                        password: false,
                        controller: name,
                        keyboardType: TextInputType.text),
                    TextFieldAccount(
                        labelText: "رقم الهاتف",
                        helper: "",
                        icon: Icons.phone_android_outlined,
                        password: false,
                        controller: phone,
                        keyboardType: TextInputType.number),
                    ButtonsUpdateAccounts(
                      Ok: () {},
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
              arrow: updatePassword ? Icons.arrow_upward : Icons.arrow_downward,
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
                        helper: "",
                        icon: Icons.lock_clock_outlined,
                        password: true,
                        controller: oldPassword,
                        keyboardType: TextInputType.text),
                    TextFieldAccount(
                        labelText: " كلمة المرور الجديدة",
                        helper: "",
                        icon: Icons.lock_outline,
                        password: true,
                        controller: newPassword,
                        keyboardType: TextInputType.text),
                    TextFieldAccount(
                        labelText: " تاكيد كلمة المرور",
                        helper: "",
                        icon: Icons.lock_outline,
                        password: true,
                        controller: confirmPassword,
                        keyboardType: TextInputType.text),
                    ButtonsUpdateAccounts(
                      Ok: () {},
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
