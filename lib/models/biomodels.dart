class BioModel {
  dynamic value;

  BioModel({required this.value});
  factory BioModel.FromJson(jsondata) {
    return BioModel(value: jsondata["output"]);
  }
}

class BadCharModel {
  dynamic aligment;
  dynamic position;

  BadCharModel({required this.aligment, required this.position});
  factory BadCharModel.fromjson(data) {
    return BadCharModel(
        aligment: data["alignment"], position: data["position"]);
  }
}
