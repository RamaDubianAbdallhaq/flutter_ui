// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class modelecomarce {
  final String strMeal;
  final String idMeal;
  final String strMealThumb;

  modelecomarce({
    required this.strMeal,
    required this.idMeal,
    required this.strMealThumb,
  });

 



  modelecomarce copyWith({
    String? strMeal,
    String? idMeal,
    String? strMealThumb,
  }) {
    return modelecomarce(
      strMeal: strMeal ?? this.strMeal,
      idMeal: idMeal ?? this.idMeal,
      strMealThumb: strMealThumb ?? this.strMealThumb,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'strMeal': strMeal,
      'idMeal': idMeal,
      'strMealThumb': strMealThumb,
    };
  }

  factory modelecomarce.fromMap(Map<String, dynamic> map) {
    return modelecomarce(
      strMeal: map['strMeal'] as String,
      idMeal: map['idMeal'] as String,
      strMealThumb: map['strMealThumb'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory modelecomarce.fromJson(String source) => modelecomarce.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'modelecomarce(strMeal: $strMeal, idMeal: $idMeal, strMealThumb: $strMealThumb)';

  @override
  bool operator ==(covariant modelecomarce other) {
    if (identical(this, other)) return true;
  
    return 
      other.strMeal == strMeal &&
      other.idMeal == idMeal &&
      other.strMealThumb == strMealThumb;
  }

  @override
  int get hashCode => strMeal.hashCode ^ idMeal.hashCode ^ strMealThumb.hashCode;
}
