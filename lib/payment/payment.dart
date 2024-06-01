import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

Map<String, dynamic>? paymentIntent;

void makePayment(String paymentAmount) async {
  try {
    // Step 1: Create payment intent
    paymentIntent = await createPaymentIntent(paymentAmount);

    // Step 2: Initialize payment sheet
    var gpay = const PaymentSheetGooglePay(
      merchantCountryCode: "IN",
      currencyCode: "INR",
      testEnv: true,
    );
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntent!["client_secret"],
        style: ThemeMode.dark,
        merchantDisplayName: "Product shopping",
        googlePay: gpay,
      ),
    );

    // Step 3: Display payment sheet
    await displayPaymentSheet();
  } catch (e, stackTrace) {
    // Print error and stack trace for debugging
    print("Error in makePayment: $e");
    print(stackTrace);
    // Log the error to a file or your preferred logging mechanism
    // Example: MyLogger.logError("Error in makePayment: $e", stackTrace);
  }
}

Future<void> displayPaymentSheet() async {
  try {
    await Stripe.instance.presentPaymentSheet();
    print("Payment successful");
  } catch (e, stackTrace) {
    // Print error and stack trace for debugging
    print("Failed to present payment sheet: $e");
    print(stackTrace);
    // Log the error to a file or your preferred logging mechanism
    // Example: MyLogger.logError("Failed to present payment sheet: $e", stackTrace);
  }
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

Future<Map<String, dynamic>> createPaymentIntent(paymentAmount) async {
  try {
    print("Pay : $paymentAmount");
    Map<String, dynamic> body = {
      "amount": (int.parse(paymentAmount) * 100)
          .toString(), // Change to string as Stripe requires string for amount
      "currency": "inr", // Change to lowercase as per Stripe API
    };
    http.Response response = await http.post(
      Uri.parse("https://api.stripe.com/v1/payment_intents"),
      body: body,
      headers: {
        "Authorization":
            "Bearer sk_test_51LDlCjSGSitzQrrUyM0ANo4ZLsO9vhwh374CQM4kQNbqOBZFyNIUOVekncpSg4vwvOu9rV4vkjyhB8TPGFaDnWAb00axraUFXi", // Replace with your Stripe Secret Key
        "Content-Type": "application/x-www-form-urlencoded",
      },
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(
          "Failed to create payment intent: ${response.statusCode}");
    }
  } catch (e, stackTrace) {
    // Print error and stack trace for debugging
    print("Error in createPaymentIntent: $e");
    print(stackTrace);
    // Log the error to a file or your preferred logging mechanism
    // Example: MyLogger.logError("Error in createPaymentIntent: $e", stackTrace);
    throw Exception("Failed to create payment intent: $e");
  }
}
