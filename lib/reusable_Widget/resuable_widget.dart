import 'package:flutter/material.dart';

Image covidlogo(String imagename) {
  return Image.asset(imagename);
}

TextField reusabletextFormField(String text, IconData icon, bool ispasswordtype,
    TextEditingController controller) {
  return TextField(
      controller: controller,
      obscureText: ispasswordtype,
      enableSuggestions: !ispasswordtype,
      autocorrect: !ispasswordtype,
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white.withOpacity(0.9)),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(113, 255, 255, 255),
        hintText: text,
        prefixIcon: Icon(icon, color: const Color.fromARGB(242, 255, 253, 253)),
        hintStyle: const TextStyle(color: Color.fromARGB(242, 255, 253, 253)),
        border: OutlineInputBorder(
            gapPadding: Checkbox.width * 0.1,
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none),
      ),
      keyboardType: ispasswordtype
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress);
}
