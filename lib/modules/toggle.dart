import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled1/modules/refcode.dart';
import 'package:untitled1/modules/visacard.dart';
import 'package:untitled1/style/app_colors.dart';

class ToggleScreen extends StatefulWidget {
  const ToggleScreen({Key? key}) : super(key: key);

  @override
  State<ToggleScreen> createState() => _ToggleScreenState();
}

class _ToggleScreenState extends State<ToggleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor1,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor1,
        elevation: 0,
        title: const Text('Choose Your Payment Method',
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>VisaScreen()));
                },
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*.4,
                      height: MediaQuery.of(context).size.height*.3,
                     child: Lottie.asset('assets/images/visa2.json'),
                    ),
                    SizedBox(width: 10,),
                    Expanded(child:Text(
                      'Pay With Card',
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.grey,
                        )
                    ))
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*.2,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>RefCodeScreen()));
                },
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*.4,
                      height: MediaQuery.of(context).size.height*.3,
                      child: Lottie.asset('assets/images/code2.json'),
                    ),
                    SizedBox(width: 10,),
                    Expanded(child:Text(
                        'Use Reference Code',
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.grey,
                        )
                    ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
