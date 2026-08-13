import 'dart:developer';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController birthDateController;
  late TextEditingController passwordController;

  bool keepMeInformed = false;
  bool isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    birthDateController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    birthDateController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void handleRegister() {
    if (_formKey.currentState!.validate()) {
      log("Registering: ${firstNameController.text} ${lastNameController.text}");
      Navigator.pushReplacementNamed(context, "/home");
    }
  }

  @override
  Widget build(BuildContext context) {
    log("This from Register Page");

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.deepPurpleAccent),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Expanded(
                      child: Text(
                        "Verve",
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text("Egypt", style: TextStyle(fontSize: 18)),
                    SizedBox(width: 20),
                    Icon(Icons.language_rounded, size: 30),
                  ],
                ),

                const Text("I'am New Here", style: TextStyle(fontSize: 24)),

                TextFormField(
                  controller: firstNameController,
                  decoration: const InputDecoration(
                    labelText: "First name",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      (value == null || value.isEmpty) ? "اكتب الاسم الأول" : null,
                ),

                TextFormField(
                  controller: lastNameController,
                  decoration: const InputDecoration(
                    labelText: "Last name",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      (value == null || value.isEmpty) ? "اكتب اسم العائلة" : null,
                ),

                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: "Email address",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) return "اكتب الإيميل";
                    if (!value.contains("@")) return "صيغة الإيميل غلط";
                    return null;
                  },
                ),

                TextFormField(
                  controller: birthDateController,
                  decoration: const InputDecoration(
                    labelText: "Date of birth",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.calendar_today_outlined),
                  ),
                  validator: (value) =>
                      (value == null || value.isEmpty) ? "اكتب تاريخ الميلاد" : null,
                ),

                TextFormField(
                  controller: passwordController,
                  obscureText: !isPasswordVisible,
                  decoration: InputDecoration(
                    labelText: "Password (6-18 characters)",
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_outlined,
                      ),
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) return "اكتب كلمة المرور";
                    if (value.length < 6 || value.length > 18) {
                      return "كلمة المرور لازم بين 6 و 18 حرف";
                    }
                    return null;
                  },
                ),

                const Divider(),

                Row(
                  children: [
                    Checkbox(
                      value: keepMeInformed,
                      onChanged: (value) {
                        setState(() {
                          keepMeInformed = value ?? false;
                        });
                      },
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Text(
                        "Yes, keep me informed via email about the latest trends and special offers.",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),

                GestureDetector(
                  onTap: handleRegister,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "Create account",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 5,
                  children: const [
                    Text(
                      "Terms of use",
                      style: TextStyle(fontSize: 16, color: Colors.blue),
                    ),
                    Text("&", style: TextStyle(fontSize: 16)),
                    Text(
                      "Privacy Policy",
                      style: TextStyle(fontSize: 16, color: Colors.blue),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}