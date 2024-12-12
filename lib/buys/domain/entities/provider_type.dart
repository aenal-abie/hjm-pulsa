String? getOperatorName(String input) {
  final Map<String, List<String>> operatorCodes = {
    'TELKOMSEL': [
      '0811',
      '0812',
      '0813',
      '0821',
      '0822',
      '0823',
      '0851',
      '0852',
      '0853'
    ],
    'INDOSAT': ['0814', '0815', '0816', '0855', '0856', '0857', '0858'],
    'XL': ['0817', '0818', '0819', '0859', '0877', '0878'],
    'AXIS': ['0831', '0832', '0833', '0838'],
    'SMARTFREN': [
      '0881',
      '0882',
      '0883',
      '0884',
      '0885',
      '0886',
      '0887',
      '0888',
      '0889'
    ],
    'TRI': ['0895', '0896', '0897', '0898', '0899'],
  };

  // Ambil 4 digit pertama dari nomor HP
  String prefix = input.substring(0, 4);

  // Cari operator berdasarkan prefix
  String? operatorName;
  for (var entry in operatorCodes.entries) {
    if (entry.value.contains(prefix)) {
      operatorName = entry.key;
      break;
    }
  }

  return operatorName;
}
