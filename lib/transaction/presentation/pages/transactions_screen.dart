import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:indonesia/indonesia.dart';
import 'package:pulsa/core/presentation/atoms/style/colors.dart';
import 'package:pulsa/core/presentation/atoms/style/text_style.dart';

import '../../../core/di/container.dart';
import '../../../core/presentation/atoms/text/p_text.dart';
import '../../../core/presentation/atoms/widgets/app_bar.dart';
import '../../domain/entities/transaction_entity.dart';
import '../manager/transaction_controller.dart';
import 'transaction_screen.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  final TransactionController controller =
      Get.put(TransactionController(di(), di()), tag: "transactions");

  @override
  void initState() {
    super.initState();
    controller.getTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PAppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: "Transaksi",
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.filter_list, color: Colors.black),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Obx(
          () => controller.getTransactionsLoading.isTrue
              ? const Center(
                  child: CircularProgressIndicator(
                  color: bluePothan,
                ))
              : ListView(
                  children: [
                    ...controller.transactions.map(
                      (transaction) => Card(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        color: natural[50],
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: InkWell(
                          onTap: () {
                            Get.to(TransactionScreen(
                                transactionId: transaction.id ?? 0));
                          },
                          child: ListTile(
                            contentPadding: EdgeInsets.all(12),
                            leading: CircleAvatar(
                              radius: 24,
                              backgroundColor: bluePothan[50],
                              child: SvgPicture.asset(
                                "assets/provider/${transaction.productEntity?.groupEntity?.name?.toLowerCase()}.svg",
                              ),
                            ),
                            title: Text(
                              transaction.productEntity?.name ?? "-",
                              style: heading5Semibold.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            subtitle: PText.body2Regular(
                              rupiah(transaction.productEntity?.price),
                            ),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  transaction.status ?? "-",
                                  style: body1Medium.copyWith(
                                      color: transaction.status ==
                                              TransactionStatus.success.value
                                          ? Colors.green
                                          : transaction.status ==
                                                  TransactionStatus.failed.value
                                              ? Colors.red
                                              : bluePothan),
                                ),
                                SizedBox(height: 4),
                                Text(
                                    "${tanggal(transaction.getCreatedAt, shortMonth: true)}"
                                    " ${transaction.getCreatedAt.hour}:${transaction.getCreatedAt.minute}",
                                    style: body2Regular.copyWith(
                                        color: Colors.grey)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
