enum ProviderType {
  telkomsel,
  indosat,
  xl,
  tri,
  smartfren,
  unknown,
}

ProviderType getProviderType(String phoneNumber) {
  // Bersihkan nomor telepon dari karakter non-angka
  phoneNumber = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');

  // Pastikan nomor menggunakan format lokal tanpa kode negara
  if (phoneNumber.startsWith('62')) {
    phoneNumber = '0${phoneNumber.substring(2)}';
  }

  // Daftar prefix berdasarkan provider
  const Map<String, ProviderType> providerPrefixes = {
    '0811': ProviderType.telkomsel,
    '0812': ProviderType.telkomsel,
    '0813': ProviderType.telkomsel,
    '0821': ProviderType.telkomsel,
    '0822': ProviderType.telkomsel,
    '0823': ProviderType.telkomsel,
    '0851': ProviderType.telkomsel,
    '0852': ProviderType.telkomsel,
    '0853': ProviderType.telkomsel,
    '0855': ProviderType.indosat,
    '0856': ProviderType.indosat,
    '0857': ProviderType.indosat,
    '0858': ProviderType.indosat,
    '0817': ProviderType.xl,
    '0818': ProviderType.xl,
    '0819': ProviderType.xl,
    '0859': ProviderType.xl,
    '0877': ProviderType.xl,
    '0878': ProviderType.xl,
    '0896': ProviderType.tri,
    '0897': ProviderType.tri,
    '0898': ProviderType.tri,
    '0899': ProviderType.tri,
    '0881': ProviderType.smartfren,
    '0882': ProviderType.smartfren,
    '0883': ProviderType.smartfren,
    '0884': ProviderType.smartfren,
    '0885': ProviderType.smartfren,
    '0886': ProviderType.smartfren,
    '0887': ProviderType.smartfren,
  };

  // Ambil prefix 4 digit pertama
  String prefix = phoneNumber.length >= 4 ? phoneNumber.substring(0, 4) : '';

  // Cari provider berdasarkan prefix
  return providerPrefixes[prefix] ?? ProviderType.unknown;
}
