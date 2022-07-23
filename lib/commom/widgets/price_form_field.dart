import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';

class PriceFormField extends StatelessWidget {
  const PriceFormField({
    Key? key,
    this.onSaved,
    this.validator,
    this.initialValue,
  }) : super(key: key);

  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      validator: validator,
      maxLength: 16,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        CurrencyTextInputFormatter(
          locale: 'pt-BR',
          decimalDigits: 2,
          symbol: 'R\$',
        )
      ],
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.attach_money),
        labelText: 'Preço',
        hintText: 'R\$ 15.000,00',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(),
      ),
      onSaved: onSaved,
    );
  }
}
