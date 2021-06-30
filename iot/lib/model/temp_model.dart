class Temp_Model {
  int id;
  int idWarning;
  double temperature;
  String createdAt;
  Null updatedAt;

  Temp_Model(
      {this.id,
        this.idWarning,
        this.temperature,
        this.createdAt,
        this.updatedAt});

  Temp_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idWarning = json['id_warning'];
    temperature = double.tryParse(json['temperature'].toString());
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_warning'] = this.idWarning;
    data['temperature'] = this.temperature;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
