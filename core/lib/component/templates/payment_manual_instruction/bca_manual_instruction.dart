import 'package:core/utils/style.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../atoms/index.dart';

class BcaManualInstruction extends StatelessWidget {
  final String? accountNumber;

  const BcaManualInstruction({Key? key, required this.accountNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _descriptionPaymentMethod(context);
  }

  _descriptionPaymentMethod(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExpandablePanel(
              theme: const ExpandableThemeData(
                headerAlignment: ExpandablePanelHeaderAlignment.top,
                tapBodyToCollapse: true,
                iconPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              ),
              header: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                child: Row(
                  children: [
                    GSText.body(
                      "BCA Mobile",
                    ),
                  ],
                ),
              ),
              collapsed: Container(),
              expanded: Container(
                padding: const EdgeInsets.only(
                    top: 0, left: 24, bottom: 5, right: 11),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "LANGKAH 1: MASUK KE AKUN ANDA",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: const Color(0xff2CBFCD),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "1.",
                                style: GoogleFonts.poppins(fontSize: 12),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  "Buka aplikasi BCA Mobile",
                                  style: GoogleFonts.poppins(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "2.",
                                style: GoogleFonts.poppins(fontSize: 12),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  'Pilih menu "m-BCA", kemudian masukkan kode akses m-BCA',
                                  style: GoogleFonts.poppins(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "LANGKAH 2: DETAIL PEMBAYARAN",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: const Color(0xff2CBFCD),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "1.",
                                style: GoogleFonts.poppins(fontSize: 12),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  'Pilih "m-Transfer", kemudian pilih "BCA Virtual Account"',
                                  style: GoogleFonts.poppins(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "2.",
                                style: GoogleFonts.poppins(fontSize: 12),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    text:
                                        'Masukkan Nomor Virtual Account anda ',
                                    style: bodyStyle,
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: '${accountNumber}',
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ', kemudian tekan "OK"',
                                        style:
                                            GoogleFonts.poppins(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "3.",
                                style: GoogleFonts.poppins(fontSize: 12),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  'Tekan tombol "Kirim" yang berada di sudut kanan atas aplikasi untuk melakukan transfer',
                                  style: GoogleFonts.poppins(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "4.",
                                style: GoogleFonts.poppins(fontSize: 12),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  'Tekan "OK" untuk melanjutkan pembayaran',
                                  style: GoogleFonts.poppins(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "5.",
                                style: GoogleFonts.poppins(fontSize: 12),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  'Masukkan PIN Anda untuk meng-otorisasi transaksi',
                                  style: GoogleFonts.poppins(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "LANGKAH 3: TRANSAKSI BERHASIL",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: const Color(0xff2CBFCD),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "1. Transaksi Anda telah selesai",
                            style: GoogleFonts.poppins(fontSize: 12),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "2. Setelah transaksi anda selesai, invoice ini akan diupdate secara otomatis. Proses ini mungkin memakan waktu hingga 5 menit",
                            style: GoogleFonts.poppins(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              builder: (_, collapsed, expanded) {
                return Expandable(
                  collapsed: collapsed,
                  expanded: expanded,
                  theme: const ExpandableThemeData(crossFadePoint: 0),
                );
              },
            ),
            ExpandablePanel(
              theme: const ExpandableThemeData(
                headerAlignment: ExpandablePanelHeaderAlignment.top,
                tapBodyToCollapse: true,
                iconPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              ),
              header: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                child: Row(
                  children: [
                    GSText.body(
                      "KlikBCA Individual",
                    ),
                  ],
                ),
              ),
              collapsed: Container(),
              expanded: Container(
                padding: const EdgeInsets.only(
                    top: 0, left: 24, bottom: 5, right: 11),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "LANGKAH 1: MASUK KE AKUN ANDA",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: const Color(0xff2CBFCD),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "1.",
                                style: GoogleFonts.poppins(fontSize: 12),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  "Lakukan log in pada aplikasi KlikBCA Individual (https://ibank.klikbca.com)",
                                  style: GoogleFonts.poppins(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "2.",
                                style: GoogleFonts.poppins(fontSize: 12),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  "Masukkan User ID dan PIN",
                                  style: GoogleFonts.poppins(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "LANGKAH 2: DETAIL PEMBAYARAN",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: const Color(0xff2CBFCD),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "1.",
                                style: GoogleFonts.poppins(fontSize: 12),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  'Pilih "Transfer Dana", kemudian pilih "Transfer ke BCA Virtual Account"',
                                  style: GoogleFonts.poppins(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "2.",
                                style: GoogleFonts.poppins(fontSize: 12),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    text:
                                        'Masukkan Nomor Virtual Account anda ',
                                    style: bodyStyle,
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: '${accountNumber}',
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "3.",
                                style: GoogleFonts.poppins(fontSize: 12),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  'Pilih "Lanjutkan"',
                                  style: GoogleFonts.poppins(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "4.",
                                style: GoogleFonts.poppins(fontSize: 12),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  'Masukkan "RESPON KEYBCA APPLI 1" yang muncul pada Token BCA anda, kemudian tekan tombol "Kirim"',
                                  style: GoogleFonts.poppins(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "LANGKAH 3: TRANSAKSI BERHASIL",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: const Color(0xff2CBFCD),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "1. Transaksi Anda telah selesai",
                            style: GoogleFonts.poppins(fontSize: 12),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "2. Setelah transaksi anda selesai, invoice ini akan diupdate secara otomatis. Proses ini mungkin memakan waktu hingga 5 menit",
                            style: GoogleFonts.poppins(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              builder: (_, collapsed, expanded) {
                return Expandable(
                  collapsed: collapsed,
                  expanded: expanded,
                  theme: const ExpandableThemeData(crossFadePoint: 0),
                );
              },
            ),
            ExpandablePanel(
              theme: const ExpandableThemeData(
                headerAlignment: ExpandablePanelHeaderAlignment.top,
                tapBodyToCollapse: true,
                iconPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              ),
              header: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                child: Row(
                  children: [
                    GSText.body(
                      "ATM BCA",
                    ),
                  ],
                ),
              ),
              collapsed: Container(),
              expanded: Container(
                padding: const EdgeInsets.only(
                    top: 0, left: 24, bottom: 5, right: 11),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "LANGKAH 1: TEMUKAN ATM TERDEKAT",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: const Color(0xff2CBFCD),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "1.",
                                style: GoogleFonts.poppins(fontSize: 12),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  "Masukkan Kartu ATM BCA",
                                  style: GoogleFonts.poppins(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "2.",
                                style: GoogleFonts.poppins(fontSize: 12),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  "Masukkan PIN",
                                  style: GoogleFonts.poppins(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "LANGKAH 2: DETAIL PEMBAYARAN",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: const Color(0xff2CBFCD),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "1.",
                                style: GoogleFonts.poppins(fontSize: 12),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  'Pilih menu "Transaksi Lainnya"',
                                  style: GoogleFonts.poppins(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "2.",
                                style: GoogleFonts.poppins(fontSize: 12),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  'Pilih menu "Transfer"',
                                  style: GoogleFonts.poppins(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "3.",
                                style: GoogleFonts.poppins(fontSize: 12),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  'Pilih menu "ke Rekening BCA Virtual Account"',
                                  style: GoogleFonts.poppins(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "4.",
                                style: GoogleFonts.poppins(fontSize: 12),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    text:
                                        'Masukkan Nomor Virtual Account Anda ',
                                    style: bodyStyle,
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: '${accountNumber}',
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            '. Tekan "Benar" untuk melanjutkan',
                                        style:
                                            GoogleFonts.poppins(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "5.",
                                style: GoogleFonts.poppins(fontSize: 12),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  'Di halaman konfirmasi, pastikan detil pembayaran sudah sesuai seperti No VA, Nama, Perus/Produk dan Total Tagihan, tekan "Benar" untuk melanjutkan',
                                  style: GoogleFonts.poppins(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "6.",
                                style: GoogleFonts.poppins(fontSize: 12),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  'Pastikan nama kamu dan Total Tagihannya benar',
                                  style: GoogleFonts.poppins(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "7.",
                                style: GoogleFonts.poppins(fontSize: 12),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  'Tekan "Ya" jika sudah benar',
                                  style: GoogleFonts.poppins(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "LANGKAH 3: TRANSAKSI BERHASIL",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: const Color(0xff2CBFCD),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "1. Transaksi Anda telah selesai",
                            style: GoogleFonts.poppins(fontSize: 12),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "2. Setelah transaksi anda selesai, invoice ini akan diupdate secara otomatis. Proses ini mungkin memakan waktu hingga 5 menit",
                            style: GoogleFonts.poppins(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              builder: (_, collapsed, expanded) {
                return Expandable(
                  collapsed: collapsed,
                  expanded: expanded,
                  theme: const ExpandableThemeData(crossFadePoint: 0),
                );
              },
            ),
            ExpandablePanel(
              theme: const ExpandableThemeData(
                headerAlignment: ExpandablePanelHeaderAlignment.top,
                tapBodyToCollapse: true,
                iconPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              ),
              header: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                child: Row(
                  children: [
                    GSText.body(
                      "Mobile Banking Bank Lain",
                    ),
                  ],
                ),
              ),
              collapsed: Container(),
              expanded: Container(
                padding: const EdgeInsets.only(
                    top: 0, left: 24, bottom: 5, right: 11),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "LANGKAH-LANKAH PEMBAYARAN",
                          style: GoogleFonts.poppins(
                              fontSize: 12, color: const Color(0xff2CBFCD)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("1.",
                                  style: GoogleFonts.poppins(fontSize: 12)),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Text(
                                  "Masukan User ID dan Password",
                                  style: GoogleFonts.poppins(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("2.",
                                  style: GoogleFonts.poppins(fontSize: 12)),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                  child: Text(
                                "Pilih Transfer",
                                style: GoogleFonts.poppins(fontSize: 12),
                              )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("3.",
                                  style: GoogleFonts.poppins(fontSize: 12)),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                  child: Text(
                                "Pilih ke rek. Bank lain",
                                style: GoogleFonts.poppins(fontSize: 12),
                              )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("4.",
                                  style: GoogleFonts.poppins(fontSize: 12)),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                  child: Text(
                                "Pilih bank tujuan",
                                style: GoogleFonts.poppins(fontSize: 12),
                              )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("5.",
                                  style: GoogleFonts.poppins(fontSize: 12)),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                  child: Text(
                                "Masukkan nomor Virtual Account ${accountNumber}",
                                style: GoogleFonts.poppins(fontSize: 12),
                              )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("6.",
                                  style: GoogleFonts.poppins(fontSize: 12)),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                  child: Text(
                                "Input Nominal yang ditagihkan sebagai Nominal Transfer",
                                style: GoogleFonts.poppins(fontSize: 12),
                              )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("7.",
                                  style: GoogleFonts.poppins(fontSize: 12)),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                  child: Text(
                                "Selesai, transaksi berhasil",
                                style: GoogleFonts.poppins(fontSize: 12),
                              )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              builder: (_, collapsed, expanded) {
                return Expandable(
                  collapsed: collapsed,
                  expanded: expanded,
                  theme: const ExpandableThemeData(crossFadePoint: 0),
                );
              },
            ),
            ExpandablePanel(
              theme: const ExpandableThemeData(
                headerAlignment: ExpandablePanelHeaderAlignment.top,
                tapBodyToCollapse: true,
                iconPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              ),
              header: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                child: Row(
                  children: [
                    GSText.body(
                      "Internet Banking Bank Lain",
                    ),
                  ],
                ),
              ),
              collapsed: Container(),
              expanded: Container(
                padding: const EdgeInsets.only(
                    top: 0, left: 24, bottom: 5, right: 11),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "LANGKAH-LANKAH PEMBAYARAN",
                          style: GoogleFonts.poppins(
                              fontSize: 12, color: const Color(0xff2CBFCD)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("1.",
                                  style: GoogleFonts.poppins(fontSize: 12)),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Text(
                                  "Masukan User ID dan Password",
                                  style: GoogleFonts.poppins(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("2.",
                                  style: GoogleFonts.poppins(fontSize: 12)),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                  child: Text(
                                "Pilih Transfer",
                                style: GoogleFonts.poppins(fontSize: 12),
                              )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("3.",
                                  style: GoogleFonts.poppins(fontSize: 12)),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                  child: Text(
                                "Pilih ke rek. Bank lain",
                                style: GoogleFonts.poppins(fontSize: 12),
                              )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("4.",
                                  style: GoogleFonts.poppins(fontSize: 12)),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                  child: Text(
                                "Pilih bank tujuan",
                                style: GoogleFonts.poppins(fontSize: 12),
                              )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("5.",
                                  style: GoogleFonts.poppins(fontSize: 12)),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                  child: Text(
                                "Masukkan nomor Virtual Account ${accountNumber}",
                                style: GoogleFonts.poppins(fontSize: 12),
                              )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("6.",
                                  style: GoogleFonts.poppins(fontSize: 12)),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                  child: Text(
                                "Input Nominal yang ditagihkan sebagai Nominal Transfer",
                                style: GoogleFonts.poppins(fontSize: 12),
                              )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("7.",
                                  style: GoogleFonts.poppins(fontSize: 12)),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                  child: Text(
                                "Selesai, transaksi berhasil",
                                style: GoogleFonts.poppins(fontSize: 12),
                              )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              builder: (_, collapsed, expanded) {
                return Expandable(
                  collapsed: collapsed,
                  expanded: expanded,
                  theme: const ExpandableThemeData(crossFadePoint: 0),
                );
              },
            ),
            ExpandablePanel(
              theme: const ExpandableThemeData(
                headerAlignment: ExpandablePanelHeaderAlignment.top,
                tapBodyToCollapse: true,
                iconPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              ),
              header: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                child: Row(
                  children: [
                    GSText.body(
                      "ATM Bank Lain",
                    ),
                  ],
                ),
              ),
              collapsed: Container(),
              expanded: Container(
                padding: const EdgeInsets.only(
                    top: 0, left: 24, bottom: 5, right: 11),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "LANGKAH-LANKAH PEMBAYARAN",
                          style: GoogleFonts.poppins(
                              fontSize: 12, color: const Color(0xff2CBFCD)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("1.",
                                  style: GoogleFonts.poppins(fontSize: 12)),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Text(
                                  "Pilih Menu lain",
                                  style: GoogleFonts.poppins(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("2.",
                                  style: GoogleFonts.poppins(fontSize: 12)),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                  child: Text(
                                "Pilih Transfer",
                                style: GoogleFonts.poppins(fontSize: 12),
                              )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("3.",
                                  style: GoogleFonts.poppins(fontSize: 12)),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                  child: Text(
                                "Pilih dari rekening tabungan",
                                style: GoogleFonts.poppins(fontSize: 12),
                              )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("4.",
                                  style: GoogleFonts.poppins(fontSize: 12)),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                  child: Text(
                                "Pilih ke rek. Bank lain",
                                style: GoogleFonts.poppins(fontSize: 12),
                              )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("5.",
                                  style: GoogleFonts.poppins(fontSize: 12)),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                  child: Text(
                                "Masukkan kode bank BCA (014) dilanjutkan dengan nomor Virtual Account  (Masukkan: 014-${accountNumber})",
                                style: GoogleFonts.poppins(fontSize: 12),
                              )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("6.",
                                  style: GoogleFonts.poppins(fontSize: 12)),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                  child: Text(
                                "Input Nominal yang ditagihkan sebagai Nominal Transfer",
                                style: GoogleFonts.poppins(fontSize: 12),
                              )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("7.",
                                  style: GoogleFonts.poppins(fontSize: 12)),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                  child: Text(
                                "Selesai, transaksi berhasil",
                                style: GoogleFonts.poppins(fontSize: 12),
                              )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              builder: (_, collapsed, expanded) {
                return Expandable(
                  collapsed: collapsed,
                  expanded: expanded,
                  theme: const ExpandableThemeData(crossFadePoint: 0),
                );
              },
            ),
          ],
        ));
  }
}
