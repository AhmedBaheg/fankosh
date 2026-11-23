import 'package:flutter/material.dart';

import '../../data/models/country_model.dart';
import 'country_dropdown_field.dart';
import 'country_dropdown_menu.dart';

/// Clean modular Country dropdown picker matching Figma Frame 35.
class CountryDropdown extends StatefulWidget {
  const CountryDropdown({
    super.key,
    this.initialCountry,
    this.onCountryChanged,
  });

  final CountryModel? initialCountry;
  final ValueChanged<CountryModel>? onCountryChanged;

  @override
  State<CountryDropdown> createState() => _CountryDropdownState();
}

class _CountryDropdownState extends State<CountryDropdown> {
  late CountryModel _selectedCountry;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _selectedCountry =
        widget.initialCountry ?? CountryModel.defaultCountries.first;
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  void _selectCountry(CountryModel country) {
    setState(() {
      _selectedCountry = country;
      _isExpanded = false;
    });
    if (widget.onCountryChanged != null) {
      widget.onCountryChanged!(country);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1. Modular Country Header Field Box
        CountryDropdownField(
          selectedCountry: _selectedCountry,
          isExpanded: _isExpanded,
          onTap: _toggleExpanded,
        ),

        // 2. Modular Animated Country List Menu Container (Frame 35)
        CountryDropdownMenu(
          selectedCountry: _selectedCountry,
          isExpanded: _isExpanded,
          onSelectCountry: _selectCountry,
        ),
      ],
    );
  }
}
