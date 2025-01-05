import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:indonesia/indonesia.dart';
import 'package:pulsa/core/presentation/atoms/style/colors.dart';
import 'package:pulsa/transaction/domain/entities/payment_entity.dart';

import '../../../core/di/container.dart';
import '../../../core/presentation/atoms/text/p_text.dart';
import '../../../core/presentation/atoms/widgets/app_bar.dart';
import '../manager/transaction_controller.dart';

class PaymentsScreen extends StatefulWidget {
  const PaymentsScreen({super.key});

  @override
  State<PaymentsScreen> createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  final TransactionController controller =
      Get.put(TransactionController(di(), di(), di()), tag: "transactions");
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.getPayments(initPage: true);
  }

  void onScroll() {
    double maxScroll = scrollController.position.maxScrollExtent;
    double curScroll = scrollController.position.pixels;
    if (curScroll == maxScroll) {
      controller.getTransactions();
    }
  }

  @override
  Widget build(BuildContext context) {
    scrollController.addListener(onScroll);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PAppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: "Pembayaran/Deposit",
      ),
      body: RefreshIndicator(
        color: bluePothan,
        onRefresh: () {
          controller.getTransactions(initPage: true);
          return Future.value();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Obx(
            () => controller.getPaymentsLoading.isTrue
                ? const Center(
                    child: CircularProgressIndicator(
                    color: bluePothan,
                  ))
                : ListView.builder(
                    controller: scrollController,
                    shrinkWrap: true,
                    itemCount: controller.payments.length + 1,
                    itemBuilder: (context, index) {
                      return (index == controller.payments.length)
                          ? ShowLoading(transactionController: controller)
                          : ItemTransaction(
                              payment: controller.payments[index]);
                    }),
          ),
        ),
      ),
    );
  }
}

class ItemTransaction extends StatelessWidget {
  final PaymentEntity payment;

  const ItemTransaction({
    super.key,
    required this.payment,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5),
      color: natural[50],
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        leading: CircleAvatar(
          radius: 16,
          backgroundColor: bluePothan[50],
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(
              HeroiconsOutline.currencyDollar,
              color: bluePothan[500],
            ),
          ),
        ),
        title: PText.heading6Medium("Deposit/Pembayaran"),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            PText.body2Regular(
              rupiah(payment.total ?? 0),
            ),
          ],
        ),
      ),
    );
  }
}

class ShowLoading extends StatelessWidget {
  const ShowLoading({
    super.key,
    required this.transactionController,
  });

  final TransactionController transactionController;

  @override
  Widget build(BuildContext context) => (transactionController.hasMaxReached)
      ? const SizedBox()
      : Padding(
          padding: const EdgeInsets.all(8.0),
          child: const SizedBox(
              height: 42,
              child: Center(
                  child: CircularProgressIndicator(
                color: bluePothan,
              ))),
        );
}
