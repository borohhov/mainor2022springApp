
class Medication {
  String title;
  double dosage;

  Medication(this.title, this.dosage);

  Medication.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        dosage = json['dosage'];

  Map<String, dynamic> toJson() => {
    'med': title,
    'dosage': dosage,
  };
}


