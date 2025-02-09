import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pulsa/core/presentation/atoms/style/text_style.dart';

import '../../../core/presentation/atoms/style/colors.dart';
import '../../../core/presentation/atoms/text/p_text.dart';
import '../../../core/presentation/atoms/utils/gap.dart';
import '../../../core/presentation/atoms/widgets/app_bar.dart';
import '../../../product/domain/entities/category_entity.dart';
import '../manager/buy_controller.dart';

Future<bool> requestPermission() async {
  var status = await Permission.contacts.status;
  if (!status.isGranted) {
    status = await Permission.contacts.request();
  }
  return status.isGranted;
}

class ContactsScreen extends StatefulWidget {
  const ContactsScreen(
      {super.key, required this.buyController, required this.packetType});

  final BuyController buyController;
  final Category packetType;

  @override
  State<ContactsScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactsScreen> {
  List<Contact> contacts = [];
  List<Contact> filteredContacts = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getContacts();
    searchController.addListener(_filterContacts);
  }

  Future<void> _getContacts() async {
    if (await requestPermission()) {
      List<Contact> fetchedContacts =
          await FlutterContacts.getContacts(withProperties: true);
      setState(() {
        contacts = fetchedContacts;
        filteredContacts = contacts;
      });
    }
  }

  void _filterContacts() {
    String query = searchController.text.toLowerCase();
    setState(() {
      filteredContacts = contacts
          .where((contact) => contact.displayName.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PAppBar(
        title: "Kontak",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  labelText: "Cari kontak",
                  labelStyle: body1Medium,
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: natural[300]!),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: bluePothan[700]!),
                  ),
                  fillColor: natural[50],
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: natural[300]!),
                  ),
                ),
              ),
            ),
            Expanded(
              child: filteredContacts.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: filteredContacts.length,
                      itemBuilder: (context, index) {
                        Contact contact = filteredContacts[index];
                        return ListTile(
                          leading: (contact.photo != null)
                              ? CircleAvatar(
                                  backgroundImage: MemoryImage(contact.photo!))
                              : CircleAvatar(
                                  backgroundColor: bluePothan,
                                  child: PText(
                                    contact.displayName.isNotEmpty
                                        ? contact.displayName[0]
                                        : "-",
                                    color: Colors.white,
                                  ),
                                ),
                          title: PText.body1Semibold(
                              contact.displayName.isNotEmpty
                                  ? contact.displayName
                                  : "(Nama Belum Ada)"),
                          subtitle: PText(contact.phones.isNotEmpty
                              ? contact.phones.first.number
                              : "Tidak Ada Nomor"),
                          onTap: () {
                            widget.buyController.setPhoneNumberFromContact(
                                contact.phones.isNotEmpty
                                    ? contact.phones.first.number
                                    : "",
                                widget.packetType);

                            Get.back();
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
