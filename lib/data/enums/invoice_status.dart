enum InvoiceStatus {
  paid('تم الدفع'),
  unpaid('لم يتم الدفع'),
  pending('قيد الانتظار');

  final String value;
  const InvoiceStatus(this.value);

  factory InvoiceStatus.fromValue(String value) {
    return InvoiceStatus.values.firstWhere(
      (e) => e.value == value,
      orElse: () => InvoiceStatus.pending,
    );
  }
}
