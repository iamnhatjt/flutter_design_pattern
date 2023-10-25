import 'package:flutter_design_pattern/contact.dart';
import 'package:flutter_design_pattern/i_contacts_adapter.dart';
import 'package:flutter_design_pattern/xml_contact_api.dart';

class XmlContactAdapter implements IContactsAdapter {
  const XmlContactAdapter({this.api = const XmlContactApi()});

  final XmlContactApi api;

  @override
  List<Contact> getContact() {
    return [const Contact(email: '', favourite: false, fullName: '')];
  }
}
