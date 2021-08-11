class Pond_Model {
  int id;
  int idUser;
  String name;
  String address;
  int active;

  Pond_Model({this.id, this.idUser, this.name, this.address, this.active});

  Pond_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idUser = json['id_user'];
    name = json['name'];
    address = json['address'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_user'] = this.idUser;
    data['name'] = this.name;
    data['address'] = this.address;
    data['active'] = this.active;
    return data;
  }
}
