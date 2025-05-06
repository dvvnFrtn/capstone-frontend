String? requiredField(String? value, {String name = 'Form'}) {
  if (value == null || value.isEmpty) {
    return '$name wajib diisi';
  }
  return null;
}

String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email wajib diisi';
  }

  final emRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
  if (!emRegex.hasMatch(value.trim())) {
    return 'Format email tidak valid';
  }
  return null;
}

String? fullnameValidator(String? value) {
  return requiredField(value, name: 'Nama lengkap');
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password wajib diisi';
  }

  if (value.length < 6) {
    return 'Password minimal 6 karakter';
  }
  return null;
}

String? confirmPasswordValidator(String? value, String original) {
  if (value == null || value.isEmpty) {
    return 'Konfirmasi password wajib diisi';
  }

  if (value != original) {
    return 'Password tidak cocok';
  }
  return null;
}
