class Temp_Model {
  int id;
  double temperature;
  int temperatureMin;
  int temperatureMax;
  int warning;
  int auto_control;
  String createdAt;

  Temp_Model(
      {this.id,
        this.temperature,
        this.temperatureMin,
        this.temperatureMax,
        this.warning,
        this.auto_control,
        this.createdAt});

  Temp_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    temperature = double.tryParse(json['temperature'].toString());
    temperatureMin = json['temperature_min'];
    temperatureMax = json['temperature_max'];
    warning = json['warning'];
    auto_control = json['auto_control'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['temperature'] = this.temperature;
    data['temperature_min'] = this.temperatureMin;
    data['temperature_max'] = this.temperatureMax;
    data['warning'] = this.warning;
    data['auto_control'] = this.auto_control;
    data['created_at'] = this.createdAt;
    return data;
  }
}
