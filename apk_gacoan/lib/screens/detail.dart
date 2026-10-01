import 'package:flutter/material.dart';
import 'package:apk_gacoan/models/data.dart';

class DetailScreen extends StatelessWidget {
  final Menu product;

  const DetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              // NAMPILIN GAMBAR
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(   // >>> NGAMBIL GAMBAR DARI DATA DART
                  product.image,
                  height: 500,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),

            Text(
              product.name,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 4),

            Text(
              product.category,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 12),

            Text(
              product.price,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 16),

            Text(
              "Deskripsi",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 6),

            Text(
              product.description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
      
      
//   //   //   body: Column(
//   //   //     children: [
//   //   //       Center(
//   //   //         child: Image.network(product.image),
//   //   //       ),
//   //   //       Text(
//   //   //         "Mie Gacoan",
//   //   //         style: TextStyle(
//   //   //           fontSize: 14,
//   //   //           color: Colors.grey
//   //   //           ),
//   //   //         ),
//   //   //         SizedBox(height: 12),
//   //   //       Text(
//   //   //         ""
//   //   //       )
//   //   //       ElevatedButton(
//   //   //         onPressed:(){
//   //   //           Navigator.pop(context);
//   //   //         }, 
//   //   //         child: Text("Kembali ke Home")
//   //   //       )
//   //   //     ],
//   //   //   ),
//   //   // );
//   // }
// }