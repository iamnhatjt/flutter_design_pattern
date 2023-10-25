import 'dart:convert';

import 'package:flutter_design_pattern/contact.dart';
import 'package:flutter_design_pattern/i_contacts_adapter.dart';
import 'package:flutter_design_pattern/json_contact_api.dart';

class JsonContactsAdapter implements IContactsAdapter {
  const JsonContactsAdapter({this.api = const JsonContactApi()});

  final JsonContactApi api;

  @override
  List<Contact> getContact() {
    final contactsJson = api.getContactJson();
    final contactsList = _parseContactsJson(contactsJson);

    return contactsList;
  }

  List<Contact> _parseContactsJson(String contactsJson) {
    final contactsMap = json.decode(contactsJson) as Map<String, dynamic>;
    final contactsJsonList = contactsMap['contacts'] as List;
    final contactsList = contactsJsonList.map((json) {
      final contactJson = json as Map<String, dynamic>;

      return Contact(
        fullName: contactJson['fullName'] as String,
        email: contactJson['email'] as String,
        favourite: contactJson['favourite'] as bool,
      );
    }).toList();

    return contactsList;
  }
}
