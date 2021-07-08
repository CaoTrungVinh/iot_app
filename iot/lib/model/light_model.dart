class Light_Model {
  int id;
  int light;
  String description;
  int warning;
  String createdAt;

  Light_Model(
      {this.id,
        this.light,
        this.description,
        this.warning,
        this.createdAt});

  Light_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    light = json['light'];
    description = json['description'];
    warning = json['warning'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['light'] = this.light;
    data['description'] = this.description;
    data['warning'] = this.warning;
    data['created_at'] = this.createdAt;
    return data;
  }
}
