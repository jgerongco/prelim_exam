import 'dart:io'; 
import 'package:prelim_exam/models/data.dart'; 
import 'package:riverpod/riverpod.dart'; 
import 'package:prelim_exam/services/bmi_service.dart';

void main() {
  final container = ProviderContainer(); // Creating a ProviderContainer instance for dependency injection
  run(container); // Calling the run function with the container
}

void run(ProviderContainer container) {
  final bmiService = container.read(bmiServiceProvider); // Reading the BMIService from the provider

  print("Welcome to BMI Calculator!"); 

  stdout.write('Enter your height in meters: '); 
  final height = double.tryParse(stdin.readLineSync()!) ?? 0.0; 

  stdout.write('Enter your weight in kilograms: '); 
  final weight = double.tryParse(stdin.readLineSync()!) ?? 0.0; 

  if (height <= 0 || weight <= 0) { 
    print('Invalid input. Height and weight must be positive numbers.'); 
    return; 
  }

  final bmiData = BMIData(height: height, weight: weight); // Creating a BMIData instance with the input values
  final bmi = bmiService.calculateBMI(bmiData); 
  final category = bmiService.getBMICategory(bmi); // Getting the BMI category using the BMIService

  print('Your BMI is ${bmi.toStringAsFixed(2)}'); // Printing the calculated BMI
  print('You are classified as $category'); // Printing the BMI category
}