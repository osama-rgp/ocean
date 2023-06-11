import 'package:flutter/material.dart';
import 'package:projectfinal/core/managers/constant/cash_keys_constant.dart';
import 'package:projectfinal/features/sign_up/sign_up_remote_data_source.dart';
import 'package:projectfinal/managers/assets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondTest extends StatefulWidget {
  const SecondTest({Key? key}) : super(key: key);

  @override
  State<SecondTest> createState() => _SecondTestState();
}

class _SecondTestState extends State<SecondTest> {
  bool _loading = false;
  final SignupRemoteDataSource remoteDataSource = SignupRemoteDataSource();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _address = TextEditingController();
  final _fName = TextEditingController();
  final _lName = TextEditingController();
  final _phone = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const Image(
              image: AssetImage(AssetsManager.logo),
              width: 400,
              height: 300,
            ),
            const Text(
              "انشاء حساب جديد",
              style:
                  TextStyle(fontSize: 32, height: -3, color: Color(0xff4D3C3B)),
            ),
            SizedBox(
              width: 500,
              // height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 125,
                    // height: 50,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "هذا الحقل مطلوب ";
                        }
                      },
                      controller: _lName,
                      textDirection: TextDirection.rtl,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(3),
                          hintTextDirection: TextDirection.rtl,
                          hintText: "الكنية",
                          hintStyle: const TextStyle(fontSize: 16),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 1),
                    child: SizedBox(
                      width: 125,
                      // height: 50,
                      child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "هذا الحقل مطلوب ";
                            }
                          },
                          controller: _fName,
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(3),
                              hintTextDirection: TextDirection.rtl,
                              hintText: "الأسم",
                              hintStyle: const TextStyle(fontSize: 16),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7)))),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: SizedBox(
                width: 305,
                // height: 50,
                child: TextFormField(
                  controller: _address,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "هذا الحقل مطلوب ";
                    }
                  },
                  textDirection: TextDirection.rtl,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(3),
                      hintTextDirection: TextDirection.rtl,
                      hintText: "العنوان",
                      hintStyle: const TextStyle(fontSize: 16),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: SizedBox(
                width: 305,
                // height: 50,
                child: TextFormField(
                  validator: (value) {
                    final number = double.tryParse(value ?? "");
                    if (value == null || value.isEmpty) {
                      return "هذا الحقل مطلوب ";
                    } else if (number == null) {
                      return "ادخل رقم هاتف صحيح";
                    }
                  },
                  controller: _phone,
                  keyboardType: TextInputType.phone,
                  textDirection: TextDirection.rtl,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(3),
                      hintTextDirection: TextDirection.rtl,
                      hintText: "الهاتف",
                      hintStyle: const TextStyle(fontSize: 16),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: SizedBox(
                width: 305,
                // height: 50,
                child: TextFormField(
                  validator: (value) {
                    if (value == null) {
                      return "أدخل بريد الكتروني صالح";
                    }
                    if (!value.contains("@") && !value.contains(".com")) {
                      return "أدخل بريد الكتروني صالح";
                    }
                    return null;
                  },
                  controller: _email,
                  textDirection: TextDirection.rtl,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(3),
                      hintTextDirection: TextDirection.rtl,
                      hintText: "البريد الالكتروني",
                      hintStyle: const TextStyle(fontSize: 16),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: SizedBox(
                width: 305,
                child: TextFormField(
                  validator: (value) {
                    if (value == null) {
                      return "أدخل كلمة سر";
                    }
                    if (value.length < 8) {
                      return "كلمة السر يجب أن تكون اكبر من 8";
                    }
                    return null;
                  },
                  controller: _password,
                  textDirection: TextDirection.rtl,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(3),
                      hintTextDirection: TextDirection.rtl,
                      hintText: "كلمة السر",
                      hintStyle: const TextStyle(fontSize: 16),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7))),
                ),
              ),
            ),
            _loading
                ? const CircularProgressIndicator()
                : Container(
                    margin: const EdgeInsets.only(top: 30),
                    child: ElevatedButton(
                      onPressed: () async {
                        final valid =
                            _formKey.currentState?.validate() ?? false;
                        if (!valid) {
                          return;
                        }
                        setState(() {
                          _loading = true;
                        });
                        await remoteDataSource
                            .signup(
                                fName: _fName.text,
                                lName: _lName.text,
                                email: _email.text,
                                address: _address.text,
                                password: _password.text,
                                phone: _phone.text)
                            .then((value) async {
                          if (value) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("تمت العملية بنجاح")));
                            Navigator.of(context).pop();
                            final storage =
                                await SharedPreferences.getInstance();
                            storage.setString(CashKeys.firstName, _fName.text);
                            storage.setString(CashKeys.lastName, _lName.text);
                            storage.setString(CashKeys.email, _email.text);
                            storage.setString(CashKeys.phone, _phone.text);
                            storage.setString(CashKeys.location, _address.text);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("حدث خطأ ما")));
                          }
                        });
                        setState(() {
                          _loading = false;
                        });
                      },
                      child: const Text("انشاء حساب جديد",
                          style: TextStyle(fontSize: 22)),
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xff6C6054),
                        padding:
                            const EdgeInsets.symmetric(horizontal: 75, vertical: 15),
                      ),
                    )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "تسجيل الدخول",
                      style: TextStyle(fontSize: 16, color: Colors.red),
                    )),
                const Text(
                  "لديك حساب؟",
                  style: TextStyle(fontSize: 16),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
