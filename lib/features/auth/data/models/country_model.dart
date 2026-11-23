/// Data model representing a country for selector dropdowns (Figma Frame 35).
class CountryModel {
  final String nameAr;
  final String nameEn;
  final String flag;
  final String code;

  const CountryModel({
    required this.nameAr,
    required this.nameEn,
    required this.flag,
    required this.code,
  });

  static const List<CountryModel> defaultCountries = [
    CountryModel(
      nameAr: 'مصر',
      nameEn: 'Egypt',
      flag: '🇪🇬',
      code: '+20',
    ),
    CountryModel(
      nameAr: 'السعودية',
      nameEn: 'Saudi Arabia',
      flag: '🇸🇦',
      code: '+966',
    ),
    CountryModel(
      nameAr: 'الإمارات',
      nameEn: 'UAE',
      flag: '🇦🇪',
      code: '+971',
    ),
    CountryModel(
      nameAr: 'الكويت',
      nameEn: 'Kuwait',
      flag: '🇰🇼',
      code: '+965',
    ),
    CountryModel(
      nameAr: 'قطر',
      nameEn: 'Qatar',
      flag: '🇶🇦',
      code: '+974',
    ),
    CountryModel(
      nameAr: 'البحرين',
      nameEn: 'Bahrain',
      flag: '🇧🇭',
      code: '+973',
    ),
    CountryModel(
      nameAr: 'عمان',
      nameEn: 'Oman',
      flag: '🇴🇲',
      code: '+968',
    ),
    CountryModel(
      nameAr: 'الأردن',
      nameEn: 'Jordan',
      flag: '🇯🇴',
      code: '+962',
    ),
    CountryModel(
      nameAr: 'المغرب',
      nameEn: 'Morocco',
      flag: '🇲🇦',
      code: '+212',
    ),
    CountryModel(
      nameAr: 'الجزائر',
      nameEn: 'Algeria',
      flag: '🇩🇿',
      code: '+213',
    ),
  ];
}
