import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/bloc/cubit/payment_states/payment_states.dart';
import 'package:untitled1/constants/constants.dart';
import 'package:untitled1/models/first_token.dart';
import 'package:untitled1/models/order_id.dart';
import 'package:untitled1/network/dio.dart';

class PaymentCubit extends Cubit<PaymentStates>{
  PaymentCubit(): super(PaymentInitialState());
  static PaymentCubit get(context)=>BlocProvider.of(context);


  FirstToken? firstToken;

  Future getFirstToken( String firstName , String lastName,String email  , String phoneNumber , String price , )async{
    DioHelperPayment.postData(url: 'auth/tokens', data: {
      'api_key':paymobApiKey,
    }).then((value){
       firstToken=FirstToken.fromJson(value.data);
      paymobFirstToken=firstToken!.token;
      print(paymobFirstToken);
       getOrderId(price,email,firstName,phoneNumber,lastName);
      emit(PaymentGetFirstTokenSuccessState());
    }).catchError((error){
      print('errorwhile get first token => ${error.toString()}');
      emit(PaymentGetFirstTokenErrorState());
    });
  }

  OrderIdModel? orderIdModel;
  Future getOrderId(String price , String email , String firstName , String phoneNumber , String lastName)async{
    DioHelperPayment.postData(url: 'ecommerce/orders',
        data: {
          "auth_token":paymobFirstToken,
          "delivery_needed":'false',//if there is delivery (not needed in fanchat)
          "amount_cents":price,//money which user will pay
          "currency":'EGP',//currency which user will pay ewith it
          "items":[],//put it with empty list if there is no items
        }).then((value){
          print('ssssssss');
     // orderIdModel =OrderIdModel.fromJson(value.data);
      //PayMoborderId=orderIdModel!.id.toString();
      PayMoborderId=value.data['id'].toString();
      print('Order Id Is => ${PayMoborderId}');
          getFinalCardToken(price,email,firstName,phoneNumber,lastName);
          getFinalKioskToken(price,email,firstName,phoneNumber,lastName);
      emit(PaymentGetOrderIdSuccessState());

    }).catchError((error){
      print('error while getting order id ${error}');
      emit(PaymentGetOrderIdErrorState());
    });
  }

  Future getFinalCardToken(String price ,String email , String firstName , String phoneNumber , String lastName)async{
    DioHelperPayment.postData(url: 'acceptance/payment_keys',
        data: {
          "auth_token": paymobFirstToken,
          "amount_cents": price,
          "expiration": 3600, //TAKE CARE OF THAT IT IS WITH SECONDS
          "order_id": PayMoborderId,
          "billing_data": {
            "apartment": "NA",
            "email": email,
            "floor": "NA",
            "first_name": firstName,
            "street": "NA",
            "building": "NA",
            "phone_number":phoneNumber,
            "shipping_method": "NA",
            "postal_code": "NA",
            "city": "NA",
            "country": "NA",
            "last_name": lastName,
            "state": "NA"
          },
          "currency": "EGP",
          "integration_id": integrationIdCard,
          "lock_order_when_paid": "false"
        }).then((value){
      print('ssssssss');
      paymobFinalTokenCard=value.data['token'].toString();
      print('Card Final Token is => ${paymobFinalTokenCard}');
      emit(PaymentGetCardTokenSuccessState());
    }).catchError((error){
      print('error while getting final card token ${error}');
      emit(PaymentGetCardTokenErrorState());
    });
  }

  Future getFinalKioskToken(String price ,String email , String firstName , String phoneNumber , String lastName)async{
    DioHelperPayment.postData(url: 'acceptance/payment_keys',
        data: {
          "auth_token": paymobFirstToken,
          "amount_cents": price,
          "expiration": 3600, //TAKE CARE OF THAT IT IS WITH SECONDS
          "order_id": PayMoborderId,
          "billing_data": {
            "apartment": "NA",
            "email": email,
            "floor": "NA",
            "first_name": firstName,
            "street": "NA",
            "building": "NA",
            "phone_number":phoneNumber,
            "shipping_method": "NA",
            "postal_code": "NA",
            "city": "NA",
            "country": "NA",
            "last_name": lastName,
            "state": "NA"
          },
          "currency": "EGP",
          "integration_id": integrationIdKiosk,
          "lock_order_when_paid": "false"
        }).then((value){
      paymobFinalTokenKiosk=value.data['token'].toString();
      print('Kiosk Final Token is => ${paymobFinalTokenKiosk}');
      getReferenceCode();
      emit(PaymentGetKioskTokenSuccessState());
    }).catchError((error){
      print('error while getting final Kiosk token ${error}');
      emit(PaymentGetKioskTokenErrorState());
    });
  }



  Future getReferenceCode()async{
    DioHelperPayment.postData(url: 'acceptance/payments/pay',
        data: {
          "source": {
            "identifier": "AGGREGATOR",
            "subtype": "AGGREGATOR"
          },
          "payment_token":paymobFinalTokenKiosk
        }).then((value){
      refCode=value.data['id'].toString();
      print('Reference Code is => ${refCode}');
      emit(PaymentGetRefCodeSuccessState());
    }).catchError((error){
      print('error while getting final Kiosk token ${error}');
      emit(PaymentGetRefCodeErrorState());
    });
  }


}