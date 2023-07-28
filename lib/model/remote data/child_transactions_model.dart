class Child_MytransactionsModel {
  // int? status;
  String? message;
  List<Child_MytransactionsData> child_transactionsDataList =[];

  Child_MytransactionsModel.fromJson({required Map<String,dynamic> json}){
    // status = json['status'];
    message = json['message'];
    json['data'].forEach((element){
      Child_MytransactionsData item = Child_MytransactionsData.fromJson(json: element);
      child_transactionsDataList.add(item);
    });
  }
}
class Child_MytransactionsData {
  String? account_no;
  String? process_type;
  String? receive_account;
  String? created_at;

  Child_MytransactionsData.fromJson({required Map<String,dynamic> json}){
    account_no = json['account_no'];
    process_type = json['process_type'];
    receive_account = json['receive_account'];
    created_at = json['created_at'];
  }

}