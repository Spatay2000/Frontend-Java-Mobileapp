import 'package:flutter/material.dart';
import 'package:java_spring_frontend/service/user_service.dart';
import 'package:java_spring_frontend/utilities/constands.dart';
import 'package:java_spring_frontend/utilities/widgets.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  late Size size;

  int phoneNumber = 0;
  String password = '';

  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        overflow: Overflow.visible,
        children: [
          Container(
            height: size.height * 0.4,
            child: appBar('', size.height * 0.2, Icon(null), context),
          ),
          Positioned(
            top: size.height * 0.25,
            left: size.width * 0.1,
            right: size.width * 0.1,
            child: Container(
              height: size.height * 0.3,
              width: size.width * 0.8,
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [getBoxShadow()],
              ),
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget> [
                    Text(
                      'Вход/Регистраиця',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kLoginPageColor,
                      ),
                    ),
                    SizedBox(height: 25,),
                    buildNumber(),
                    buildPassword(),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.522,
            left: size.width * 0.3,
            right: size.width * 0.3,
            child: buildElevatedButton(),
          )
        ],
      ),
    );
  }
  Widget buildNumber() => TextFormField(
      controller: phoneController,
      decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Номер/email'
      ),
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value!.length < 10) {
          return 'Enter an 11 digit';
        } else if (value.isEmpty) {
          return 'Enter your phone number';
        } else if(value.length > 11) {
          return 'Phone number must be 11 digits';
        }
      },
      onSaved: (value) => phoneController.text = value!
  );

  Widget buildPassword() => TextFormField(
    obscureText: true,
    decoration: InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Пароль'
    ),
    validator: (value) {
      if (value!.length < 3) {
        return 'Password should contain at least 8 character';
      }
    },
    onSaved: (value) => passwordController.text = value!,
  );

  Widget buildElevatedButton() => ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: kMainColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
      ),
    ),
    child: Container(
      padding: EdgeInsets.only(right: 20, left: 20),
      child: Text(
          'Отправить'
      ),
    ),
    onPressed: () {
      final isValid = formKey.currentState!.validate();
      if (isValid) {
        formKey.currentState!.save();
        final message = 'Телефон: $phoneNumber\nPassword: $password';
      }
      UserService().loginByNumberAndPassword(phoneController.text, passwordController.text, context);
    },
  );
}