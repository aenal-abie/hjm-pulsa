import 'package:core/core.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../atoms/index.dart';

class PermataManualInstruction extends StatelessWidget {
  final String? accountNumber;

  const PermataManualInstruction({Key? key, required this.accountNumber})
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
                      "Permata Mobile X",
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
                                  "Buka aplikasi PermataMobile Internet ",
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
                                "Masukkan User ID dan Password ",
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
                                  "Pilih \"Pembayaran Tagihan\" ",
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
                                  "Pilih \"Virtual Account\" ",
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
                                  "Masukkan Nomor Virtual Account Anda $accountNumber",
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
                                  "Masukkan otentikasi transaksi/token ",
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
                iconPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              ),
              header: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                child: Row(
                  children: [
                    GSText.body(
                      "Internet Banking Permata",
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
                                    text: "Buka situs internet banking permata",
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
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
                                  "Pilih \"Pembayaran Tagihan\"",
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
                                  "Pilih \"Virtual Account\"",
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
                                  "Masukkan Nomor Virtual Account $accountNumber",
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
                                  "Periksa kembali detail pembayaran anda",
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
                iconPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              ),
              header: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                child: Row(
                  children: [
                    GSText.body(
                      "Permata ATM",
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
                                  "Masukkan kartu ATM Permata anda",
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
                                  "Pilih menu \"Transaksi Lainnya\"",
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
                                  "Pilih menu \"Pembayaran\"",
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
                                  "Pilih menu \"Pembayaran Lainnya\"",
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
                                  "Pilih menu \"Virtual Account\"",
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
                              Text("6.",
                                  style: GoogleFonts.poppins(fontSize: 12)),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Text(
                                  "Lalu pilih rekening debet yang akan digunakan",
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
                                    "Masukkan kode bank Permata (013) dilanjutkan dengan nomor Virtual Account  (Masukkan: 013-$accountNumber)",
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

  Widget _splitter() {
    return Container(
      height: 5,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(0xDE8E4E4),
            width: 1.0,
          ),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xD707070),
            Colors.white10,
          ],
        ),
      ),
    );
  }
}
