class Control_Model {
  int id;
  int idPond;
  int idPumpIn;
  int idPumpOut;
  int idLamp;
  int idOxygenFan;
  String name;
  String address;

  Control_Model(
      {this.id,
        this.idPond,
        this.idPumpIn,
        this.idPumpOut,
        this.idLamp,
        this.idOxygenFan,
        this.name,
        this.address});

  Control_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idPond = json['id_pond'];
    idPumpIn = json['id_pump_in'];
    idPumpOut = json['id_pump_out'];
    idLamp = json['id_lamp'];
    idOxygenFan = json['id_oxygen_fan'];
    name = json['name'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_pond'] = this.idPond;
    data['id_pump_in'] = this.idPumpIn;
    data['id_pump_out'] = this.idPumpOut;
    data['id_lamp'] = this.idLamp;
    data['id_oxygen_fan'] = this.idOxygenFan;
    data['name'] = this.name;
    data['address'] = this.address;
    return data;
  }
}
