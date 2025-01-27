import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "http://192.168.1.83/api";
  final String baseImageUrl = "http://192.168.1.83/storage/";

  Future<String> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    print('Email: $email');
    print('Password: $password');

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['token'];
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<List<dynamic>> getAllProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body)['data'];

      for (var product in data) {
        if (product['image_url'] == null && product['image'] != null) {
          product['image_url'] = baseImageUrl + product['image'];
        }
      }

      return data;
    } else {
      throw Exception("Failed to load products");
    }
  }

  Future<void> createProduct(Map<String, dynamic> productData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/products'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(productData),
    );
    if (response.statusCode != 200) {
      throw Exception("Failed to create product");
    }
  }

  Future<void> updateProduct(int id, Map<String, dynamic> productData) async {
    final response = await http.put(
      Uri.parse('$baseUrl/products/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(productData),
    );
    if (response.statusCode != 200) {
      throw Exception("Failed to update product");
    }
  }

  Future<void> deleteProduct(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/products/$id'));
    if (response.statusCode != 200) {
      throw Exception("Failed to delete product");
    }
  }
}
