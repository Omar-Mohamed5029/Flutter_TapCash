class MytransactionsModel {
  int? status;
  String? message;
  List<MytransactionsData> MytransactionsDataList =[];

  MytransactionsModel.fromJson({required Map<String,dynamic> json}){
    status = json['status'];
    message = json['message'];
    json['data'].forEach((element){
      MytransactionsData item = MytransactionsData.fromJson(json: element);
      MytransactionsDataList.add(item);
    });
  }
}
class MytransactionsData {
  String? account_no;
  String? process_type;
  String? receive_account;
  String? created_at;

  MytransactionsData.fromJson({required Map<String,dynamic> json}){
    account_no = json['account_no'];
    process_type = json['process_type'];
    receive_account = json['receive_account'];
    created_at = json['created_at'];
  }

}