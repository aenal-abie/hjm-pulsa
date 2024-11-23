import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../atoms/index.dart';
import '../../styles/colors.dart';

class BsiManualInstruction extends StatelessWidget {
  final String? accountNumber;

  const BsiManualInstruction({Key? key, required this.accountNumber})
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
                  iconPadding:
                      EdgeInsets.symmetric(horizontal: 30, vertical: 8)),
              header: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                child: Row(
                  children: [
                    GSText.body(
                      "BSI Mobile",
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
                                  " Buka aplikasi BSI Mobile",
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
                                "Masukkan User ID dan Password",
                                style: GoogleFonts.poppins(fontSize: 12),
                              )),
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
                          "LANGKAH 2: DETAIL PEMBAYARAN ",
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
                                  "Pilih \"Pembayaran\" ",
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
                                  "Pilih Nomor Rekening BSI Anda",
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
                              Text("3.",
                                  style: GoogleFonts.poppins(fontSize: 12)),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Text(
                                  "Pilih menu \"Institusi\"",
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
                              Text("4.",
                                  style: GoogleFonts.poppins(fontSize: 12)),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Text(
                                  "Masukkan nama institusi Xendit (kode 9347)",
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
                              Text("5.",
                                  style: GoogleFonts.poppins(fontSize: 12)),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Text(
                                  "Masukkan Nomor Virtual Account tanpa diikuti kode institusi (tanpa 4 digit pertama) $accountNumber",
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
                              Text("6.",
                                  style: GoogleFonts.poppins(fontSize: 12)),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Text(
                                  "Konfirmasi detail transaksi anda",
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
                              Text("7.",
                                  style: GoogleFonts.poppins(fontSize: 12)),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Text(
                                  "Masukkan otentikasi transaksi/token",
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
                              fontWeight: FontWeight.w500),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Transaksi Anda telah selesai,  invoice ini akan diupdate secara otomatis. Proses ini mungkin memakan waktu hingga 5 menit",
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
                  iconPadding:
                      EdgeInsets.symmetric(horizontal: 30, vertical: 8)),
              header: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                child: Row(
                  children: [
                    GSText.body(
                      "Internet Banking BSI",
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
                                child: RichText(
                                  text: TextSpan(
                                      text: "Buka situs ",
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 12,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "https://bsinet.bankbsi.co.id",
                                          style: GoogleFonts.poppins(
                                            color: primaryColor500,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ]),
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
                                "Masukkan User ID dan Password",
                                style: GoogleFonts.poppins(fontSize: 12),
                              )),
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
                                  "Pilih \"Pembayaran\"",
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
                                  "Pilih Nomor Rekening BSI Anda",
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
                              Text("3.",
                                  style: GoogleFonts.poppins(fontSize: 12)),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Text(
                                  "Pilih menu \"Institusi\"",
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
                              Text("4.",
                                  style: GoogleFonts.poppins(fontSize: 12)),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Text(
                                  "Masukkan nama institusi Xendit (kode 9347)",
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
                              Text("5.",
                                  style: GoogleFonts.poppins(fontSize: 12)),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Text(
                                  "Masukkan Nomor Virtual Account tanpa diikuti kode institusi (tanpa 4 digit pertama)  $accountNumber",
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
                              Text("6.",
                                  style: GoogleFonts.poppins(fontSize: 12)),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Text(
                                  "Konfirmasi detail transaksi anda",
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
                              Text("7.",
                                  style: GoogleFonts.poppins(fontSize: 12)),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Text(
                                  "Masukkan otentikasi transaksi/token",
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
                              fontWeight: FontWeight.w500),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Setelah transaksi anda selesai, invoice ini akan diupdate secara otomatis. Proses ini mungkin memakan waktu hingga 5 menit",
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
                  iconPadding:
                      EdgeInsets.symmetric(horizontal: 30, vertical: 8)),
              header: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                child: Row(
                  children: [
                    GSText.body(
                      "ATM BSI",
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
                                  "Masukkan kartu ATM BSI anda",
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
                                  "Pilih menu \"Pembayaran/Pembelian\"",
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
                                  "Pilih menu \"Institusi\"",
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
                              Text("3.",
                                  style: GoogleFonts.poppins(fontSize: 12)),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Text(
                                  "Masukkan Nomor Virtual Account anda $accountNumber",
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
                              Text("4.",
                                  style: GoogleFonts.poppins(fontSize: 12)),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Text(
                                  "Detail yang ditampilkan: NIM, Nama, & Total Tagihan",
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
                              Text("5.",
                                  style: GoogleFonts.poppins(fontSize: 12)),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Text(
                                  "Konfirmasi detail transaksi anda",
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
                              fontWeight: FontWeight.w500),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Setelah transaksi anda selesai, invoice ini akan diupdate secara otomatis. Proses ini mungkin memakan waktu hingga 5 menit",
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
                                    "Masukkan nomor Virtual Account $accountNumber",
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
                                    "Masukkan nomor Virtual Account $accountNumber",
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
                                    "Masukkan kode bank BRI (002) dilanjutkan dengan nomor Virtual Account  (Masukkan: 002-$accountNumber)",
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
