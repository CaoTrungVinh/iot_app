class PumpIn_Model {
  int id;
  int idControl;
  int status;
  String timerOn;
  String timerOff;

  PumpIn_Model(
      {this.id, this.idControl, this.status, this.timerOn, this.timerOff});

  PumpIn_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idControl = json['id_control'];
    status = json['status'];
    timerOn = json['timer_on'];
    timerOff = json['timer_off'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_control'] = this.idControl;
    data['status'] = this.status;
    data['timer_on'] = this.timerOn;
    data['timer_off'] = this.timerOff;
    return data;
  }
}
