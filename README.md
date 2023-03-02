# Reusable Widget Flutter

Package ini merupakan kumpulan dari beberapa widget yang telah dirancang dan dikembangkan dengan tujuan untuk membantu mempermudah proses pengembangan aplikasi di Flutter. Dengan menggunakan widget-widget yang tersedia pada package ini, proses pengembangan aplikasi dapat menjadi lebih efisien dan menghemat waktu serta biaya yang dibutuhkan. Dengan demikian, pengembang aplikasi dapat lebih fokus pada pengembangan fitur-fitur aplikasi yang lebih kompleks dan lebih meningkatkan kualitas dari aplikasi yang dibuat.

## Installation

Tambahkan code berikut pada pubspec.yaml

```dart
  reusable_widgets_flutter:
    git:
      url: https://github.com/ajianaz/reusable_widgets_flutter.git
```

## Usage/Examples

```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reusable_widgets_flutter/button/CButton.dart';
import 'package:reusable_widgets_flutter/button/CButtonStyle.dart';
import 'package:reusable_widgets_flutter/styles/colors.dart';
import 'package:reusable_widgets_flutter/text/CText.dart';
import 'package:reusable_widgets_flutter/text/CTextStyle.dart';
import 'package:reusable_widgets_flutter/text_field/CTextField.dart';

import '../../../styles/styles.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(gradient: LinearGradient(
            begin: FractionalOffset(0.5, 0.0),
            end: FractionalOffset(0.0, 1.0),
            // stops: [0.0, 1.0],
            colors: [colorSecondary, colorPrimary, colorThird])),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              Expanded(
                  flex: 0,
                  child: Container(
                      // padding: EdgeInsets.all(50),
                      child: Image.asset(
                    "assets/images/img_logo_white.png",
                    height: 350,
                  ))),
              Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CText(
                        "Masuk atau Daftar",
                        style: CTextStyle.head(color: Colors.white),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CTextField(
                        controller: controller.phoneController,
                        hintText: "Nomer Telepon",
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (GetUtils.isBlank(value) == true)
                            return "Tidak boleh kosong";
                          if (GetUtils.isPhoneNumber(value ?? "0") == false)
                            return "Nomer Telp Tidak Valid";
                          return null;
                        },
                      ),
                    ],
                  )),
              Expanded(
                  flex: 0,
                  child: CButton(
                    () {
                      if (!controller.formKey.currentState!.validate()) return;
                      controller.login();
                    },
                    "Selanjutnya",
                    textColor: colorPrimary,
                    textStyle: CTextStyle.bodySemiBold(color: colorPrimary),
                    buttonStyle: CButtonStyle.filled(
                        height: 46, background: Colors.white, radius: 5),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
```

## Acknowledgements

Package ini menggunakan library:

- [GetX](https://pub.dev/packages/get)
- [google_fonts](https://pub.dev/packages/google_fonts)
- [substring_highlight](https://pub.dev/packages/substring_highlight)
- [intl](https://pub.dev/packages/intl)

## Contributing

Contributions are always welcome!

## Feedback

If you have any feedback, please reach out to us at [Discord](https://discord.gg/RGH3pJfaDv)
