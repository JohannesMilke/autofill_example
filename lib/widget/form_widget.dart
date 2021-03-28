import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({Key? key}) : super(key: key);

  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final email2Controller = TextEditingController();
  final password2Controller = TextEditingController();

  final address = TextEditingController();

  final creditCardName = TextEditingController();
  final creditCardNumber = TextEditingController();
  final creditCardExpirationDate = TextEditingController();
  final creditCardSecurityCode = TextEditingController();

  final phoneNumber = TextEditingController();

  @override
  void dispose() {
    [
      nameController,
      emailController,
      firstNameController,
      lastNameController,
      usernameController,
      passwordController,
      email2Controller,
      password2Controller,
      address,
      creditCardName,
      creditCardNumber,
      creditCardExpirationDate,
      creditCardSecurityCode,
      phoneNumber,
    ].forEach((controller) => controller.dispose());

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          buildHeader('Personal Details'),
          buildName(),
          buildEmail(),
          buildHeader('Firstname & Lastname'),
          buildFirstAndLastname(),
          buildHeader('Username & Password'),
          buildUsernameAndPassword(),
          buildHeader('Email & Password'),
          buildEmailAndPassword(),
          buildHeader('Credit Card Information'),
          buildCreditCard(),
          buildHeader('Shipping address'),
          buildShippingAddress(),
          buildHeader('Phone Number'),
          buildPhoneNumber(),
          SizedBox(height: 20),
          buildSubmit()
        ],
      );

  Widget buildName() => TextField(
        controller: nameController,
        decoration: InputDecoration(labelText: 'Name'),
        keyboardType: TextInputType.name,
        autofillHints: [AutofillHints.name],
      );

  Widget buildEmail() => TextField(
        controller: emailController,
        decoration: InputDecoration(labelText: 'Email'),
        keyboardType: TextInputType.emailAddress,
        autofillHints: [AutofillHints.email],
      );

  Widget buildFirstAndLastname() => AutofillGroup(
        child: Column(
          children: [
            TextField(
              controller: firstNameController,
              decoration: InputDecoration(labelText: 'First Name'),
              keyboardType: TextInputType.name,
              autofillHints: [AutofillHints.givenName],
            ),
            TextField(
              controller: lastNameController,
              decoration: InputDecoration(labelText: 'Last Name'),
              keyboardType: TextInputType.name,
              autofillHints: [AutofillHints.familyName],
            ),
          ],
        ),
      );

  Widget buildUsernameAndPassword() => AutofillGroup(
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              autofillHints: [AutofillHints.username],
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              keyboardType: TextInputType.visiblePassword,
              autofillHints: [AutofillHints.password],
              onEditingComplete: () => TextInput.finishAutofillContext(),
            ),
          ],
        ),
      );

  Widget buildEmailAndPassword() => AutofillGroup(
        child: Column(
          children: [
            TextField(
              controller: email2Controller,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              autofillHints: [AutofillHints.email],
            ),
            TextField(
              controller: password2Controller,
              decoration: InputDecoration(labelText: 'Password'),
              keyboardType: TextInputType.visiblePassword,
              autofillHints: [AutofillHints.password],
              onEditingComplete: () => TextInput.finishAutofillContext(),
            ),
          ],
        ),
      );

  Widget buildCreditCard() => AutofillGroup(
        child: Column(
          children: <Widget>[
            TextField(
              controller: creditCardNumber,
              decoration: InputDecoration(labelText: 'Card Number'),
              autofillHints: [AutofillHints.creditCardNumber],
            ),
            TextField(
              controller: creditCardSecurityCode,
              decoration: InputDecoration(labelText: 'Security Code'),
              obscureText: true,
              autofillHints: [AutofillHints.creditCardSecurityCode],
            ),
          ],
        ),
      );

  Widget buildShippingAddress() => TextField(
        controller: address,
        decoration: InputDecoration(labelText: 'Address'),
        keyboardType: TextInputType.streetAddress,
        autofillHints: [AutofillHints.postalAddress],
      );

  Widget buildPhoneNumber() => TextFormField(
        controller: phoneNumber,
        decoration: InputDecoration(labelText: 'Phone Number'),
        keyboardType: TextInputType.phone,
        autofillHints: [
          AutofillHints.telephoneNumber, // typically with country code
          //AutofillHints.telephoneNumberNational, // without country code
        ],
      );

  Widget buildSubmit() => ElevatedButton(
        child: Text('Save'),
        onPressed: () {
          print('Name: ' + nameController.text);
          print('Email: ' + emailController.text);
        },
      );

  Widget buildHeader(String text) => Container(
        margin: EdgeInsets.only(top: 32),
        child: Text(
          text,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      );
}
