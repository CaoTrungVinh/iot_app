class PH_Model {
  int id;
  double value;
  Null createdAt;
  Null updatedAt;

  PH_Model({this.id, this.value, this.createdAt, this.updatedAt});

  PH_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = double.tryParse(json['value'].toString());
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
