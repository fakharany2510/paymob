import 'package:flutter/material.dart';
import 'package:untitled1/constants/constants.dart';
import 'package:untitled1/style/app_colors.dart';

class RefCodeScreen extends StatelessWidget {
  const RefCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor1,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor1,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             const Text('Please Go To Any Market And Pay With This Code',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              height: 60,
              width: 220,
              decoration: BoxDecoration(
                color: AppColors.primaryColor1,
                border: Border.all(color: AppColors.navBarActiveIcon),
                borderRadius: BorderRadius.circular(20),
              ),
              child:   Center(
                child: Text(refCode,
                textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                    letterSpacing: 3
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
