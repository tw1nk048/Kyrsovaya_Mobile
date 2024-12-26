import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _username;
  String? _password;
  String? _fullName;
  String? _dateOfBirth;
  String? _omsNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Регистрация"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Регистрация",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Имя пользователя",
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) => _username = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Введите имя пользователя";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Пароль",
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  onSaved: (value) => _password = value,
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return "Пароль должен быть не менее 6 символов";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "ФИО",
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) => _fullName = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Введите ФИО";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Дата рождения",
                    border: OutlineInputBorder(),
                    hintText: "дд.мм.гггг",
                  ),
                  onSaved: (value) => _dateOfBirth = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Введите дату рождения";
                    }
                    // Простая проверка формата
                    if (!RegExp(r"^\d{2}\.\d{2}\.\d{4}$").hasMatch(value)) {
                      return "Введите дату в формате дд.мм.гггг";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Полис ОМС",
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) => _omsNumber = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Введите номер полиса ОМС";
                    }
                    if (value.length != 16) {
                      return "Полис ОМС должен содержать 16 цифр";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() == true) {
                      _formKey.currentState?.save();
                      // Здесь добавьте логику сохранения данных пользователя
                      Navigator.pushReplacementNamed(context, '/home');
                    }
                  },
                  child: Text("Зарегистрироваться"),
                ),
                SizedBox(height: 5),
                TextButton(
                  onPressed: () {
                    // Здесь добавьте логику сохранения данных пользователя
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: Text("Уже есть аккаунт, войти"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
