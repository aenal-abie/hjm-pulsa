import 'package:flutter/material.dart';
import 'package:indonesia/indonesia.dart';
import 'package:pulsa/core/presentation/atoms/buttons/primary_button.dart';
import 'package:pulsa/core/presentation/atoms/style/colors.dart';

import '../../../core/presentation/atoms/text/p_text.dart';
import '../../../core/presentation/atoms/widgets/app_bar.dart';

void main() {
  runApp(MaterialApp(
    home: TransactionDetailPage(),
  ));
}

class TransactionDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PAppBar(
        // backgroundColor: bluePothan[200],
        title: "Detail Transaksi",
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.orange[100],
                  child: Icon(Icons.check_circle, color: Colors.green),
                ),
                SizedBox(width: 10),
                PText(
                  'Status Pesanan',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 4),
            PText(
              'Transaksi berhasil',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.green,
                  fontWeight: FontWeight.bold),
            ),
            Divider(height: 32, thickness: 1),
            PText('Waktu Pembelian',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            PText('21 May 2023 11:24 WIB', style: TextStyle(fontSize: 14)),
            SizedBox(height: 16),
            PText('Nomor Invoice',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            Row(
              children: [
                Expanded(
                  child: PText('IVR/20230521/XXIII/V/1630105236',
                      style: TextStyle(fontSize: 14)),
                ),
                IconButton(
                  icon: Icon(Icons.copy),
                  onPressed: () {},
                ),
              ],
            ),
            Divider(height: 32, thickness: 1),
            PText('Detail Pembayaran',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PText('Kategori Produk', style: TextStyle(fontSize: 14)),
                PText('Pulsa',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PText('Jenis Layanan', style: TextStyle(fontSize: 14)),
                PText('TSel 50Rb',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PText('Harga Layanan', style: TextStyle(fontSize: 14)),
                PText(rupiah(49000),
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PText('Nomor', style: TextStyle(fontSize: 14)),
                PText('081317979393',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PText('Serial Number', style: TextStyle(fontSize: 14)),
                PText('030622000133705284',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              ],
            ),
            Divider(height: 32, thickness: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PText('Total Harga',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                PText(rupiah(49710),
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: bluePothan)),
              ],
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                onPressed: () {},
                text: 'Kembali',
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
