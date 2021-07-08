class Toolkit_Model {
  int id;
  int idPond;
  int idTemperature;
  int idPh;
  int idLight;
  String name;
  String address;

  Toolkit_Model(
      {this.id,
        this.idPond,
        this.idTemperature,
        this.idPh,
        this.idLight,
        this.name,
        this.address});

  Toolkit_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idPond = json['id_pond'];
    idTemperature = json['id_temperature'];
    idPh = json['id_ph'];
    idLight = json['id_light'];
    name = json['name'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_pond'] = this.idPond;
    data['id_temp'] = this.idTemperature;
    data['id_ph'] = this.idPh;
    data['id_light'] = this.idLight;
    data['name'] = this.name;
    data['address'] = this.address;
    return data;
  }
}
