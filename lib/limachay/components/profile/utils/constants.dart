import 'package:flutter/material.dart';

// Variables
const double margin = 20.0;

final regexEmail = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

final regexPassword = RegExp(
    r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$");

final regexOnlyLetters = RegExp(r'^[A-Za-zÁÉÍÓÚáéíóúñÑ ]+$');

final regexPhone = RegExp(r"(9)([0-9]){8}$");

// Controllers
final emailController = TextEditingController();
final passwordController = TextEditingController();
final dniController = TextEditingController();
final nameController = TextEditingController();
final lastnameController = TextEditingController();
final phoneController = TextEditingController();
final userController = TextEditingController();
final passwordValidateController = TextEditingController();

// Validators
bool isTextValid(String text) {
  return regexOnlyLetters.hasMatch(text.toLowerCase());
}

bool isEmailValid(String email) {
  return regexEmail.hasMatch(email.toLowerCase());
}

bool isPasswordValid(String password) {
  return regexPassword.hasMatch(password);
}

bool isNumberValid(String number) {
  return regexPhone.hasMatch(number);
}

bool isValidatePassword(String password, String passwordValidate) {
  return password == passwordValidate;
}