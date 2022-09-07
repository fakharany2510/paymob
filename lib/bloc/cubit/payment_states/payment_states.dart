class PaymentStates {}
class PaymentInitialState extends PaymentStates{}

//First Token States
class PaymentGetFirstTokenSuccessState extends PaymentStates{}
class PaymentGetFirstTokenErrorState extends PaymentStates{}

//Order Id States
class PaymentGetOrderIdSuccessState extends PaymentStates{}
class PaymentGetOrderIdErrorState extends PaymentStates{}

//Card token
class PaymentGetCardTokenSuccessState extends PaymentStates{}
class PaymentGetCardTokenErrorState extends PaymentStates{}

//Kiosk token
class PaymentGetKioskTokenSuccessState extends PaymentStates{}
class PaymentGetKioskTokenErrorState extends PaymentStates{}

//Kiosk token
class PaymentGetRefCodeSuccessState extends PaymentStates{}
class PaymentGetRefCodeErrorState extends PaymentStates{}