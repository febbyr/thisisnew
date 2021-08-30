class ClaimModel {
  String typeclaim;
  String amount;
  String description;

  ClaimModel({this.typeclaim, this.amount, this.description});

  factory ClaimModel.fromJson(Map<String, dynamic> json) {
    return ClaimModel(
      typeclaim: json['typeclaim'],
      amount: json['amount'],
      description: json['description'],
    );
  }
  Map<String, dynamic> toJsonAdd() {
    return {
      "typeclaim": typeclaim,
      "amount": amount,
      "description": description
    };
  }
}
