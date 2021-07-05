class PH_Model {
  int id;
  double value;
  double phMin;
  double phMax;
  int warning;
  String createdAt;

  PH_Model(
      {this.id,
        this.value,
        this.phMin,
        this.phMax,
        this.warning,
        this.createdAt});

  PH_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = double.tryParse(json['value'].toString());
    phMin = double.tryParse(json['ph_min'].toString());
    phMax = double.tryParse(json['ph_max'].toString());
    warning = json['warning'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    data['ph_min'] = this.phMin;
    data['ph_max'] = this.phMax;
    data['warning'] = this.warning;
    data['created_at'] = this.createdAt;
    return data;
  }
}
