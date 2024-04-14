class GenerateMonthAndYear{


String generateInstallmentMonth(int startMonth, int index) {
  int? firstPaymentMonth;
  int newIndex = index;
  String underTen;

  if (startMonth == 12) {
    firstPaymentMonth = 1;
  } else {
    firstPaymentMonth = startMonth + 1;
  }

  if (firstPaymentMonth + newIndex <= 12) {
    firstPaymentMonth = firstPaymentMonth + newIndex;
  } else if (firstPaymentMonth + newIndex > 12) {
    firstPaymentMonth = (firstPaymentMonth + newIndex) % 12;
  }

  if (firstPaymentMonth < 10) {
    underTen = "0${firstPaymentMonth.toString()}";
    return underTen;
  } else {
    return firstPaymentMonth.toString();
  }
}

String generateInstallmentYear(int startYear, int startMonth, int index) {
  int? firstPaymentMonth;
  int? firstPaymentYear;
  int newIndex = index + 1;

  if (startMonth == 12) {
    firstPaymentMonth = 1;
    if (index == 12) {
      firstPaymentYear = startYear;
    } else {
      firstPaymentYear = startYear + 1;
    }
  } else {
    firstPaymentMonth = startMonth;
    firstPaymentYear = startYear;
  }

  if (firstPaymentMonth + newIndex > 12) {
    if (index == 12) {
      firstPaymentYear = startYear;
    } else {
      firstPaymentYear = startYear + 1;
    }
  }

  return firstPaymentYear.toString();
}

}