import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const/text_style.dart';

class LoadingDialogWidget extends StatelessWidget {
  const LoadingDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 200,
        width: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProgressIndicator.adaptive(),
              SizedBox(height: 20,),
              Text('Mohon tunggu',style: title)
            ],
          )
      ),
    );
  }
}