import 'package:artneidich_app/common_widget/custom_button.dart';
import 'package:flutter/material.dart';

class FirebaseScreen extends StatefulWidget {
  const FirebaseScreen({super.key});

  @override
  State<FirebaseScreen> createState() => _FirebaseScreenState();
}

class _FirebaseScreenState extends State<FirebaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomButton(
          onPressed: () async {
            //  LocalNotificationService.showBasicNotification();
            // String? token = await FirebaseMessaging.instance.getToken();

            // if ("eqqDj1F3SOKA_GFRHRQcMe:APA91bEDeSBY-vrgCwd612xN15Sk98N3X_v_LSFoOK9DWvkwIpq0Ng2ARDnzDds-OX27flxZP6LZ_gUk2O_I48lWDZmZ0zCre5cfyFtqR0TTxLT6_7yMJtM" ==
            //     token) {
            //   debugPrint("Token Match");
            // } else {
            //   debugPrint("Token did not Match");
            // }
            // log("Token =================> $token");
          },
          text: "GET TOKEN",
        ),
      ),
    );
  }
}
