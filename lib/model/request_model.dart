class RequestModel {
  String typeclaim;
  String description;
  DateTime tglpengajuan;
  String name;
  int id;

  RequestModel(
      {this.typeclaim,
      this.description,
      this.tglpengajuan,
      this.id,
      this.name});

  factory RequestModel.fromJson(Map<String, dynamic> json) {
    return RequestModel(
      name: json['name'] as String,
      id: json['id'] as int,
      typeclaim: json['typeclaim'] as String,
      description: json['description'] as String,
      tglpengajuan: json['tglpengajuan'] as DateTime,
    );
  }
}
