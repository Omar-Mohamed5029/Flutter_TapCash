class MyChildrenModel {
  int? status;
  String? message;
  List<MyChildrenData> MyChildrenDataList =[];

  MyChildrenModel.fromJson({required Map<String,dynamic> json}){
    status = json['status'];
    message = json['message'];
    json['data'].forEach((element){
      MyChildrenData item = MyChildrenData.fromJson(json: element);
      MyChildrenDataList.add(item);
    });
  }
}
class MyChildrenData {
  String? name;
  String? email;
  String? account_number;
  int? deposite;
  int? moneyLimit;
  String? purchases_limit;
  String? created_at;
  // account_number


  MyChildrenData.fromJson({required Map<String,dynamic> json}){
    name = json['name'];
    email = json['email'];
    account_number=json['account_number'];
    deposite = json['deposite'];
    moneyLimit = json['money_limit'];
    purchases_limit = json['purchases_limit'];
    created_at = json['created_at'];
  }

}