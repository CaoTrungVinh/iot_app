class PH_Model {
  int id;
  int idWarning;
  double value;
  String createdAt;
  Null updatedAt;

  PH_Model(
      {this.id, this.idWarning, this.value, this.createdAt, this.updatedAt});

  PH_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idWarning = json['id_warning'];
    value = double.tryParse(json['value'].toString());
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_warning'] = this.idWarning;
    data['value'] = this.value;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
