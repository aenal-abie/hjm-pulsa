import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../atoms/index.dart';
import '../../styles/index.dart';

class BniManualInstruction extends StatelessWidget {
  final String? accountNumber;

  const BniManualInstruction({Key? key, required this.accountNumber})
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
                      EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                  hasIcon: true),
              header: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                child: Row(
                  children: [
                    GSText.body(
                      "BNI Mobile Banking",
                    ),
                    const Expanded(child: SizedBox()),
                  ],
                ),
              ),
              collapsed: const SizedBox(),
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
                                  "Akses BNI Mobile Banking melalui handphone",
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
                                " Pilih menu \"Transfer\"",
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
                                  "Pilih menu \"Virtual Account Billing\", lalu pilih rekening debet",
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
                                  "Masukkan Nomor Virtual Account $accountNumber pada menu \"Input Baru\"",
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
                                  "Tagihan yang harus dibayarkan akan muncul pada layar konfirmasi",
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
                                  "Konfirmasi transaksi dan masukkan Password Transaksi",
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
                      EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                  hasIcon: true),
              header: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                child: Row(
                  children: [
                    GSText.body(
                      "BNI Internet Banking",
                    ),
                    const Expanded(child: SizedBox()),
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
                                          text: "https://ibank.bni.co.id/",
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
                                  "Pilih menu \"Transfer\"",
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
                                  " Pilih menu \"Virtual Account Billing\"",
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
                                  "Masukkan Nomor Virtual Account $accountNumber (tanpa -)",
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
                                  "Lalu pilih rekening debet yang akan digunakan. Kemudian tekan \"Lanjut\"",
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
                                  "Tagihan yang harus dibayarkan akan muncul pada layar konfirmasi",
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
                                  "Masukkan Kode Otentikasi Token",
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
                      "ATM BNI",
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
                                  "Masukkan kartu ATM anda",
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
                                "Pilih bahasa",
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
                                "Masukkan PIN ATM anda",
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
                                  "Pilih \"Menu Lainnya\"",
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
                                  "Pilih \"Transfer\"",
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
                                  "Pilih jenis rekening yang akan anda gunakan (contoh: \"Dari Rekening Tabungan\")",
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
                                  "Pilih \"Virtual Account Billing\"",
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
                                  "Tagihan yang harus dibayarkan akan muncul pada layar konfirmasi",
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
                                  "Konfirmasi, apabila telah sesuai, lanjutkan transaksi",
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
                                    "Masukkan kode bank BNI (009) dilanjutkan dengan nomor Virtual Account  (Masukkan: 009-$accountNumber)",
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
