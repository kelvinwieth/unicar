import 'package:flutter/material.dart';
import 'package:unicar/cars/src/cubits/cars_cubit.dart';
import 'package:unicar/cars/src/models/car.dart';

class CarForm extends StatefulWidget {
  final Car? car;
  final CarsCubit cubit;
  const CarForm({
    Key? key,
    required this.cubit,
    this.car,
  }) : super(key: key);

  @override
  State<CarForm> createState() => _CarFormState();
}

class _CarFormState extends State<CarForm> {
  final brandController = TextEditingController();
  final modelController = TextEditingController();
  final priceController = TextEditingController();
  final photoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    brandController.text = widget.car?.model.brand.name ?? '';
    modelController.text = widget.car?.model.name ?? '';
    priceController.text = widget.car?.price.toStringAsFixed(2) ?? '';
    photoController.text = widget.car?.photoUrl ?? '';

    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Adicionar carro',
                style: TextStyle(fontSize: 20),
              ),
            ),
            TextField(
              controller: brandController,
              decoration: const InputDecoration(
                hintText: 'Fabricante',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: modelController,
              decoration: const InputDecoration(
                hintText: 'Modelo do carro',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(
                hintText: 'Preço',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: photoController,
              decoration: const InputDecoration(
                hintText: 'URL da foto',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                  child: const Text('OK'),
                  onPressed: () {
                    debugPrint('OKKKK');
                    try {
                      final price = double.parse(priceController.text);
                      widget.cubit.addCar(
                        modelName: modelController.text,
                        brandName: brandController.text,
                        photoUrl: photoController.text,
                        price: price,
                      );
                      Navigator.pop(context);
                    } catch (e) {
                      Navigator.pop(context);
                    }
                  },
                ),
                const SizedBox(width: 5),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(primary: Colors.grey),
                  child: const Text('Cancelar'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
