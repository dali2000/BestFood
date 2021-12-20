// ignore_for_file: file_names

class Person {
  String _nom;
  String _prenom;
  String _email;
  String _telephon;

//nom
String get name => _nom.toString();

set name(String value) {
    _nom = value;
  } 

//prenom
String get prenom => _prenom.toString();

set prenom(String value) {
    _prenom = value;
  }


//email
  String get email => _email.toString();

  set email(String value) {
    _email = value;
  }


  //telephone
  String get telephon => _telephon.toString();

  set telephon(String value) {
    _telephon = value;
  }




  Person(this._nom, this._telephon,this._prenom,this._email);

 
}