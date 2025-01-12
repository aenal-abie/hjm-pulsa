import 'dart:async';

import 'package:flutter/material.dart';
import 'package:indonesia/indonesia.dart';
import 'package:pulsa/core/presentation/atoms/buttons/primary_button.dart';
import 'package:pulsa/core/presentation/atoms/style/colors.dart';
import 'package:pulsa/core/presentation/atoms/utils/copy.dart';
import 'package:pulsa/transaction/domain/entities/transaction_entity.dart';
import 'package:pulsa/transaction/presentation/manager/transaction_controller.dart';

import '../../../core/di/container.dart';
import '../../../core/presentation/atoms/style/text_style.dart';
import '../../../core/presentation/atoms/text/p_text.dart';
import '../../../core/presentation/atoms/utils/gap.dart';
import '../../../core/presentation/atoms/widgets/app_bar.dart';
import '../widgets/phone_credit/pln_token.dart';

class TransactionScreen extends StatefulWidget {
  final int transactionId; // Pass the transaction
  const TransactionScreen({super.key, this.transactionId = 0});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  final TransactionController _transactionController =
      Get.put(TransactionController(di(), di(), di()));
  late Timer timer;
  @override
  void initState() {
    super.initState();
    _transactionController.getTransaction(widget.transactionId);
    fetchDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PAppBar(
        title: "Detail Transaksi",
        onPressed: () {
          Get.back();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          if (_transactionController.getTransactionLoading.isTrue) {
            return Center(child: CircularProgressIndicator());
          }
          var data = _transactionController.transaction.value;
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: bluePothan[50],
                    child: statusIcon(data.status),
                  ),
                  SizedBox(width: 10),
                  PText(
                    'Status Pesanan',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Expanded(child: SizedBox.shrink()),
                  statusText(data.status),
                ],
              ),
              SizedBox(height: 4),
              Divider(height: 32, thickness: 1),
              PText('Waktu Pembelian', style: body1Bold),
              PText(tanggal(DateTime.parse(data.createdAt ?? '')),
                  style: TextStyle(fontSize: 14)),
              SizedBox(height: 16),
              PText('ID Transaksi', style: body1Bold),
              Row(
                children: [
                  Expanded(
                    child: PText(data.refId ?? '-',
                        style: TextStyle(fontSize: 14)),
                  ),
                  IconButton(
                    icon: Icon(Icons.copy),
                    onPressed: () {
                      copyToClipboard(context, data.refId ?? '-');
                    },
                  ),
                ],
              ),
              if (data.productEntity?.groupEntity?.name != "PLN")
                Row(
                  children: [
                    Expanded(child: PText('Serial Number', style: body1Bold)),
                    PText(data.sn ?? "-"),
                    IconButton(
                      icon: Icon(Icons.copy),
                      onPressed: () {
                        copyToClipboard(context, data.refId ?? '-');
                      },
                    ),
                  ],
                ),
              if (data.productEntity?.groupEntity?.name == "PLN")
                PlnToken(
                  textToCopy: (data.sn ?? "-"),
                ),
              Divider(height: 32, thickness: 1),
              PText('Detail Pembayaran',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PText('Kategori Produk', style: TextStyle(fontSize: 14)),
                  PText(data.productEntity?.groupEntity?.category?.name ?? "-",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PText('Jenis Layanan', style: TextStyle(fontSize: 14)),
                  PText(data.productEntity?.name ?? "-",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PText('Harga Layanan', style: TextStyle(fontSize: 14)),
                  PText(rupiah(data.price ?? 0),
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PText('Nomor', style: TextStyle(fontSize: 14)),
                  PText(data.customerNumber ?? "-",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 8),
              Divider(height: 32, thickness: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PText('Total Harga',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  PText(rupiah(data.price ?? 0),
                      style: heading5Medium.copyWith(color: Colors.black)),
                ],
              ),
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: PrimaryButton(
                  onPressed: () {
                    Get.back();
                  },
                  text: 'Kembali',
                ),
              ),
              Spacer(),
            ],
          );
        }),
      ),
    );
  }

  Widget statusIcon(String? status) {
    if (status == TransactionStatus.success.value) {
      return Icon(
        Icons.check_circle,
        color: green[600],
        size: 36,
      );
    } else if (status == TransactionStatus.failed.value) {
      return Icon(
        Icons.cancel,
        color: brightRed[600],
        size: 36,
      );
    }
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
      strokeWidth: 2.0,
    );
  }

  Widget statusText(String? status) {
    if (status == TransactionStatus.success.value) {
      return PText(
        status ?? '-',
        style: heading5Bold.copyWith(color: green[600]),
      );
    } else if (status == TransactionStatus.failed.value) {
      return PText(status ?? '-',
          style: heading4Bold.copyWith(color: brightRed));
    }
    return PText("Menunggu", style: heading4Bold.copyWith(color: bluePothan));
  }

  void fetchDelay() {
    if (_transactionController.transaction.value.status ==
            TransactionStatus.success.value ||
        _transactionController.transaction.value.status ==
            TransactionStatus.failed.value) return;
    timer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      _transactionController.getTransaction(widget.transactionId,
          inBackground: true);
      if (_transactionController.transaction.value.status ==
              TransactionStatus.success.value ||
          _transactionController.transaction.value.status ==
              TransactionStatus.failed.value) {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }
}
