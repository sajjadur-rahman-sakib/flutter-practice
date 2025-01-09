import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_management/control.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController controller = Get.put(ProductController()); // Initialize controller

    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator()); // Show loader while loading
        }

        if (controller.products.isEmpty) {
          return const Center(child: Text("No Products Found"));
        }

        return ListView.builder(
          itemCount: controller.products.length,
          itemBuilder: (context, index) {
            final product = controller.products[index];
            return ListTile(
              leading: Image.network(
                product.img ?? '',
                width: 50,
                height: 50,
                errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.error),
              ),
              title: Text(product.productName ?? "No Name"),
              subtitle: Text("Code : ${product.productCode ?? '000'}"),
            );
          },
        );
      }),
    );
  }
}
