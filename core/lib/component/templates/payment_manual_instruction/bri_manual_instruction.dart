import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../atoms/index.dart';
import '../../styles/index.dart';

class BriManualInstruction extends StatelessWidget {
  final String? accountNumber;

  const BriManualInstruction({Key? key, required this.accountNumber})
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
                      "BRI Mobile Banking (Briva)",
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
                                  "Buka aplikasi BRI Mobile Banking, masukkan USER ID dan PIN anda",
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
                                "Pilih \"Pembayaran\" dan pilih \"Briva\"",
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
                                  "Masukkan Nomor Virtual Account anda $accountNumber dan jumlah y?ang ingin anda bayarkan",
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
                                  "Masukkan PIN Mobile Banking BRI",
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
                      "BRI Internet Banking",
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
                                          text: "https://ib.bri.co.id/ib-bri/",
                                          style: GoogleFonts.poppins(
                                            color: primaryColor500,
                                            fontSize: 12,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              ", dan masukkan USER ID dan PASSWORD anda",
                                          style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontSize: 12,
                                          ),
                                        )
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
                                "Pilih \"Pembayaran\" dan pilih \"Briva\"",
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
                                  "Masukkan Nomor Virtual Account anda $accountNumber dan jumlah y?ang ingin anda bayarkan",
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
                                  "Masukkan password anda kemudian masukkan mToken internet banking",
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
                      "ATM BRI",
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
                                  "Masukkan kartu, kemudian pilih bahasa dan masukkan PIN anda",
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
                                "Pilih \"Transaksi Lain\" dan pilih \"Pembayaran\"",
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
                                "Pilih menu \"Lainnya\" dan pilih \"Briva\"",
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
                                  "Masukkan Nomor Virtual Account anda $accountNumber  dan jumlah  y?ang ingin anda bayarkan",
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
                                  "Periksa data transaksi dan tekan \"YA\"",
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
