
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/bloc/cubit/payment_cubit/payment_cubit.dart';
import 'package:untitled1/bloc/cubit/payment_states/payment_states.dart';
import 'package:untitled1/modules/toggle.dart';
import 'package:untitled1/shared/widget.dart';
import 'package:untitled1/style/app_colors.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  var formKey =GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
        create: (context)=>PaymentCubit(),
      child: BlocConsumer<PaymentCubit,PaymentStates>(
        builder: (context,state){
          return Scaffold(
            backgroundColor: AppColors.primaryColor1,
            appBar: AppBar(
              backgroundColor: AppColors.myWhite,
              toolbarHeight: 0,
              elevation: 0,
              systemOverlayStyle:  SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.light,
                statusBarColor: AppColors.primaryColor1,
              ),
            ),
            body: Center(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        SizedBox(height: size.height*.01,),
                        textFormFieldWidget(
                            context: context,
                            controller: nameController,
                            errorMessage: "please enter your First name",
                            inputType: TextInputType.name,
                            labelText:"First Name",
                            prefixIcon: Icon(Icons.person,color: AppColors.myGrey,)
                        ),
                        SizedBox(height: size.height*.03,),
                        textFormFieldWidget(
                            context: context,
                            controller: lastnameController,
                            errorMessage: "please enter your last name",
                            inputType: TextInputType.name,
                            labelText:"Last Name",
                            prefixIcon: Icon(Icons.person,color: AppColors.myGrey,)
                        ),
                        SizedBox(height: size.height*.03,),
                        textFormFieldWidget(
                            context: context,
                            controller: emailController,
                            errorMessage:"please enter your email",
                            inputType: TextInputType.emailAddress,
                            labelText:"Email",
                            prefixIcon: Icon(Icons.mail_sharp ,color: AppColors.myGrey,)
                        ),

                        SizedBox(height: size.height*.03,),
                        textFormFieldWidget(
                            context: context,
                            controller: phoneController,
                            errorMessage:"please enter your phone",
                            inputType: TextInputType.phone,
                            labelText:"phone",
                            prefixIcon: Icon(Icons.phone,color: AppColors.myGrey,)
                        ),
                        SizedBox(height: size.height*.03,),
                        textFormFieldWidget(
                            context: context,
                            controller: priceController,
                            errorMessage:"please enter price",
                            inputType: TextInputType.phone,
                            labelText:"price",
                            prefixIcon: Icon(Icons.money,color: AppColors.myGrey,)
                        ),
                        SizedBox(height: size.height*.03,),
                        defaultButton(
                            textColor: AppColors.primaryColor1,
                            buttonText: 'Go To Pay',
                            buttonColor: AppColors.myGrey,
                            width: size.width*.9,
                            height: size.height*.06,
                            function: (){
                              if(formKey.currentState!.validate()){
                                PaymentCubit.get(context).getFirstToken(
                                  nameController.text,
                                  lastnameController.text,
                                  emailController.text,
                                  phoneController.text,
                                  priceController.text,
                                );
                              }

                            }
                        ),


                      ],
                    ),
                  ),
                ),
              ),
            ),

          );
        },
        listener: (context,state){
          if(state is PaymentGetRefCodeSuccessState){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ToggleScreen()));
          }
        },
      ),
    );

  }

}