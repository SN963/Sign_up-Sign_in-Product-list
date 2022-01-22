import 'package:flutter/material.dart';
import '../model/validation_item.dart';

class EditInfoValidation with ChangeNotifier {
  // final url = "https://pro1-1957f-default-rtdb.firebaseio.com/UserData/$_userId/";

  ValidationItem _firstName = ValidationItem(null, null);
  ValidationItem _lastName = ValidationItem(null, null);
  ValidationItem _changePassword = ValidationItem(null, null);
  ValidationItem _changeEmail = ValidationItem(null, null);
  ValidationItem _changedescription = ValidationItem(null, null);

  //Getters
  ValidationItem get firstName => _firstName;
  ValidationItem get lastName => _lastName;
  ValidationItem get Password => _changePassword;
  ValidationItem get Email => _changeEmail;
  ValidationItem get description => _changedescription;

  bool get isValid {
    if (_lastName.value != null &&
        _firstName.value != null &&
        Password.value != null &&
        Email.value != null &&
        description.value != null) {
      return true;
    } else {
      return false;
    }
  }

  final FName = TextEditingController();
  final FLame = TextEditingController();
  final Emaill = TextEditingController();
  final Passwordd = TextEditingController();
  final Description = TextEditingController();

  void clearText() {
    FName.clear();
    FLame.clear();
    Emaill.clear();
    Passwordd.clear();
    Description.clear();

    notifyListeners();
  }

  //Setters
  void changeFirstName(String value) {
    if (value.length >= 3) {
      _firstName = ValidationItem(value, null);
    } else {
      _firstName = ValidationItem(null, "Must be at least 3 characters");
    }
    notifyListeners();
  }

  void changeLastName(String value) {
    if (value.length >= 3) {
      _lastName = ValidationItem(value, null);
    } else {
      _lastName = ValidationItem(null, "Must be at least 3 characters");
    }
    notifyListeners();
  }

  void changePasswrod(String value) {
    if (value.length >= 8) {
      _changePassword = ValidationItem(value, null);
    } else {
      _changePassword = ValidationItem(
          null, "Must be (Strong Password) at least 8 characters");
    }
    notifyListeners();
  }

  void changeEmail(String value) {
    if (value.contains("@")) {
      _changeEmail = ValidationItem(value, null);
    } else {
      _changeEmail = ValidationItem(null, "Must contain @");
    }
    notifyListeners();
  }

  void changedescription(String value) {
    if (value.length < 100) {
      _changedescription = ValidationItem(value, null);
    } else {
      _changedescription =
          ValidationItem(null, "Please, don't exceed 100 characters");
    }
    notifyListeners();
  }

  void submitData() {
    print(
        "FirstName: ${firstName.value}, LastName: ${lastName.value}, Password: ${Password.value}, Email: ${Email.value}");
    notifyListeners();
  }
}
