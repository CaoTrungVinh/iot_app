class Light_Model {
  int id;
  int light;
  String description;
  String createdAt;
  Null updatedAt;

  Light_Model(
      {this.id, this.light, this.description, this.createdAt, this.updatedAt});

  Light_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    light = json['light'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['light'] = this.light;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
