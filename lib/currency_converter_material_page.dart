import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() =>
      _CurrencyConverterMaterialPageState();
}

class _CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage> {
  double result = 0;
  final TextEditingController _textEditingController = TextEditingController();
  final RegExp _numericRegExp = RegExp(r'^[0-9]*$');

  void convertCurrency() {
    result = double.parse(_textEditingController.text) / 1500;
  }

  void clearTextFieldAfterDelay() {
    Future.delayed(const Duration(seconds: 5), () {
      // Clear the text field after a 2-second delay
      _textEditingController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.5,
        style: BorderStyle.solid,
        strokeAlign: BorderSide.strokeAlignInside,
      ),
      borderRadius: BorderRadius.all(Radius.circular(20)),
    );

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 43, 48, 51),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 43, 48, 51),
        title: const Text('Currency Converter (₦ to \$)'),
        elevation: 0,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'USD ${result.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _textEditingController,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  hintText: 'Please enter the amount in Naira',
                  hintStyle: TextStyle(color: Colors.black),
                  prefix: Icon(Icons.monetization_on_outlined),
                  //prefixIconColor: Colors.white60,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(_numericRegExp),
                ],
              ),
            ),

            //button

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    convertCurrency();
                    clearTextFieldAfterDelay();
                    FocusScope.of(context).unfocus();
                  });
                },
                style: TextButton.styleFrom(
                  backgroundColor: (Colors.black),
                  foregroundColor: (Colors.white),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('Convert'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
