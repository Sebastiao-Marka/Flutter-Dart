import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

extension IsNumeric on String? {
  bool isNumeric() {
    if (this == null) {
      return false;
    }
    return double.tryParse(this!) != null;
  }
}

extension StringExtension on String {
  String? capitalize(String? s) => (s != null && s.length > 1)
      ? s[0].toUpperCase() + s.substring(1).toLowerCase()
      : (s!.contains(".") != true)
          ? s.toLowerCase()
          : s.toUpperCase();

  String? capitalizeNames(String? s) => (s != null && s.length > 2)
      ? s[0].toUpperCase() + s.substring(1).toLowerCase()
      : s != null
          ? (s.contains(".") != true)
              ? s.toLowerCase()
              : s.toUpperCase()
          : null;
}

extension InverseBool on bool {
  bool get reverseBool => !this;
}

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get allInCaps => this.toUpperCase();
  String get allInLows => this.toLowerCase();
  String get capitalizeFirstOfEach =>
      this.split(" ").map((str) => capitalize(str)).join(" ");
  String get capitalizePersonalName =>
      this.split(" ").map((str) => capitalizeNames(str)).join(" ");
}

extension CCardObfuscate on String {
  String cCardObfuscate() {
    return this
        .substring(12)
        .padLeft(16, '*')
        .replaceAllMapped(RegExp(r".{4}"), (match) => "${match.group(0)} ");
  }
}

extension NumberToReal on double {
  String numberToReal() {
    return NumberFormat.currency(
            decimalDigits: 2, locale: 'pt-BR', symbol: 'R\$')
        .format(this);
  }
}

extension IsNullOrEmpty on String? {
  bool isNullOrEmpty() {
    if (this!.length <= 0 || this == null) {
      return false;
    }
    return true;
  }
}

extension SimNao on bool {
  String simNao() {
    if (this == true) {
      return 'Sim';
    }
    return 'Não';
  }
}

extension LimpaCpf on String? {
  String limpaCpf() {
    if (this != null || this!.length > 0) {
      return this!
          .replaceAll(" ", "")
          .replaceAll(".", "")
          .replaceAll("-", "")
          .replaceAll("/", "")
          .trim();
    }
    return '';
  }
}

extension CnpjMask on String {
  String toCnpjMask(bool labeled) {
    var saida = "";
    saida = (labeled) ? "CNPJ: " : "";
    saida += this.substring(0, 2) +
        "." +
        this.substring(2, 5) +
        "." +
        this.substring(5, 8) +
        "/" +
        this.substring(8, 12) +
        "-" +
        this.substring(12, 14);
    return saida;
  }
}

extension RetornaDDD on String {
  bool retornaDDD(String element) {
    var ddd = [
      '11',
      '12',
      '13',
      '14',
      '15',
      '16',
      '17',
      '18',
      '19',
      '21',
      '22',
      '24',
      '27',
      '28',
      '31',
      '32',
      '33',
      '34',
      '35',
      '37',
      '38',
      '41',
      '42',
      '43',
      '44',
      '45',
      '46',
      '47',
      '48',
      '49',
      '51',
      '53',
      '54',
      '55',
      '61',
      '62',
      '63',
      '64',
      '65',
      '66',
      '67',
      '68',
      '69',
      '71',
      '73',
      '74',
      '75',
      '77',
      '79',
      '81',
      '82',
      '83',
      '84',
      '85',
      '86',
      '87',
      '88',
      '89',
      '91',
      '92',
      '93',
      '94',
      '95',
      '96',
      '97',
      '98',
      '99'
    ];
    return ddd.contains(element);
  }
}

extension CpfCnpj on String {
  String toCpfCnpjMasked(labeled) {
    var saida = "";
    if (this.length < 12) {
      //! CPF
      saida = (labeled) ? "CPF: " : "";
      saida += this.substring(0, 3) +
          "." +
          this.substring(3, 6) +
          "." +
          this.substring(6, 9) +
          "-" +
          this.substring(9, 11);
    } else {
      //! CNPJ
      saida = (labeled) ? "CNPJ: " : "";
      saida += this.substring(0, 2) +
          "." +
          this.substring(2, 5) +
          "." +
          this.substring(5, 8) +
          "/" +
          this.substring(8, 12) +
          "-" +
          this.substring(12, 14);
    }
    return saida;
  }
}

extension CpfMasked on String {
  String toCpfMasked(labeled) {
    var saida = "";
    if (this.length < 12) {
      //! CPF
      saida = (labeled) ? "" : "";
      saida += ("***") +
          (".") +
          this.substring(3, 6) +
          "." +
          this.substring(6, 9) +
          "-" +
          ("**");
    }
    return saida;
  }
}

extension AtivoInativo on bool {
  String ativoInativo(String genero) {
    return (genero.toUpperCase() == "M")
        ? (this)
            ? 'Ativo'
            : 'Inativo'
        : (this)
            ? 'Ativa'
            : 'Inativa';
  }
}

extension IsCanceled on String? {
  bool isCanceld() {
    if (this == null) {
      return false;
    }

    if (this == 'C') {
      return true;
    }
    return false;
  }
}

extension ToCellPhone on String? {
  String toCellPhone() {
    if (this == null) {
      return "NÃO INFORMADO";
    }
    var value = "";

    if (this!.length <= 10) {
      value = this!.padLeft(11, 'X');
    } else {
      value = this!;
    }

    value = value
        .replaceAll('(', '')
        .replaceAll(')', '')
        .replaceAll(' ', '')
        .replaceAll('+', '')
        .replaceAll('-', '')
        .replaceAll('/', '');

    return "(" +
        value.substring(0, 2) +
        ") " +
        value.substring(2, 7) +
        "-" +
        value.substring(7);
  }
}

extension ToPinCode on String {
  String toPinCode() {
    return this.substring(0, 1).toUpperCase() + "-" + this.substring(2);
  }
}

extension ToDigitableLine on String {
  String toDigitableLine() {
    return this.substring(0, 5) +
        "." +
        this.substring(5, 10) +
        " " +
        this.substring(10, 15) +
        "." +
        this.substring(15, 21) +
        " " +
        this.substring(21, 26) +
        "." +
        this.substring(26, 32) +
        " " +
        this.substring(32, 33) +
        " " +
        this.substring(33);
  }
}

extension BrazilianDateFormat on DateTime {
  String brazilianDateFormat() {
    return DateFormat('dd/MM/yyyy').format(this).toString();
  }
}

extension BrazilianDateTimeFormat on DateTime {
  String brazilianDateTimeFormat() {
    return DateFormat('dd/MM/yyyy HH:mm').format(this).toString();
  }
}

extension EmailValidatorRegexp on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

extension BrazilianDateTimeFormatExtended on DateTime {
  String brazilianDateTimeFormatExtended() {
    return DateFormat('dd ||| MMMM ||| yyyy @@@ HH:mm', 'pt_BR')
        .format(this)
        .toString();
  }
}

extension TransactionDateTimeFormat on DateTime {
  String transactionDateTimeFormat() {
    return DateFormat('dd MMM yyyy - HH:mm', 'pt_BR').format(this).toString();
  }
}

extension BoletoDateTimeFormat on DateTime {
  String boletoDateTimeFormat() {
    return DateFormat('dd MMM yyyy', 'pt_BR').format(this).toString();
  }
}

extension DatePtBr on String? {
  String datePtBr({String msk = "dd/MM/yyyy"}) {
    if (this == null) {
      return "Data inválida";
    }
    return DateFormat(msk).parse(this!).toString();
  }
}

class CapitalCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.capitalizeFirstOfEach,
      selection: newValue.selection,
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

class LowerCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toLowerCase(),
      selection: newValue.selection,
    );
  }
}
