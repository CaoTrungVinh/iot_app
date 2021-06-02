class Temp_Model {
  int id;
  double temp;
  Null createdAt;
  Null updatedAt;

  Temp_Model({this.id, this.temp, this.createdAt, this.updatedAt});

  Temp_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    temp = double.tryParse(json['temp'].toString());
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['temp'] = this.temp;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
