import 'package:flutter/material.dart';
import 'base_page.dart';
import '../../core/api/api_service.dart';
import '../controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  final HomeController controller;

  const HomePage(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    final ApiService apiService = ApiService();

    return BasePage(
      bodyContent: FutureBuilder<List<dynamic>>(
        future: apiService.getAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(), // Indikator loading
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'), // Pesan error
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child:
                  Text('No products available'), // Pesan jika tidak ada produk
            );
          } else {
            final List<dynamic> products = snapshot.data!;

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Jumlah kolom
                  crossAxisSpacing: 8, // Jarak horizontal antar item
                  mainAxisSpacing: 8, // Jarak vertikal antar item
                  childAspectRatio: 0.7, // Perbandingan lebar-tinggi
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  final imageUrl = product['image_url'] ?? '';
                  final name = product['name'] ?? 'Unknown Product';
                  final price = product['price']?.toString() ?? '0';
                  final description = product['description'] ?? '';

                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Bagian gambar produk
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(10.0),
                          ),
                          child: imageUrl.isNotEmpty
                              ? Center(
                                  child: Image.network(
                                    imageUrl,
                                    height: 140,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Container(
                                  height: 140,
                                  color: Colors.grey[300],
                                  child: const Center(
                                    child: Icon(
                                      Icons.image_not_supported,
                                      size: 40,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                        ),
                        const SizedBox(height: 8),
                        // Bagian teks produk
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Rp$price',
                                style: TextStyle(
                                  color: Colors.green[700],
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                description,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
      selectedIndex: 0,
      controller: controller,
    );
  }
}
