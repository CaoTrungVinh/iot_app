class Light_Model {
  int id;
  int light;
  String description;
  int warning;
  int auto_control;
  String createdAt;

  Light_Model(
      {this.id,
        this.light,
        this.description,
        this.warning,
        this.auto_control,
        this.createdAt});

  Light_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    light = json['light'];
    description = json['description'];
    warning = json['warning'];
    auto_control = json['auto_control'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['light'] = this.light;
    data['description'] = this.description;
    data['warning'] = this.warning;
    data['auto_control'] = this.auto_control;
    data['created_at'] = this.createdAt;
    return data;
  }
}
