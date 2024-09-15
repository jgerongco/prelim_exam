import 'package:riverpod/riverpod.dart';
import 'package:prelim_exam/models/data.dart';

class BMIService {
  // Method to calculate BMI from BMIData
  double calculateBMI(BMIData data) {
    // Check if height is valid
    if (data.height <= 0) {
      throw ArgumentError(
          "Height must be greater than 0"); // Throw an error if height is invalid
    }
    // Calculate and return BMI
    return data.weight / (data.height * data.height);
  }

  // Method to get BMI category based on BMI value
  String getBMICategory(double bmi) {
    // Determine BMI category based on standard ranges
    if (bmi < 18.5) {
      return "Underweight"; // BMI less than 18.5
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return "Normal weight"; // BMI between 18.5 and 24.9
    } else if (bmi >= 25 && bmi < 29.9) {
      return "Overweight"; // BMI between 25 and 29.9
    } else {
      return "Obese"; // BMI 30 or greater
    }
  }
}

// Provider for BMIService using Riverpod
final bmiServiceProvider = Provider((ref) => BMIService());
// This allows the BMIService to be easily accessed and used within the application.