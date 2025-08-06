class UserInvoiceDto {
  final List<PurchaseItemDto> previous;
  final List<CurrentPurchaseItemDto> current;

  UserInvoiceDto({required this.previous, required this.current});

  factory UserInvoiceDto.fromJson(Map<String, dynamic> json) => UserInvoiceDto(
    previous:
        (json['previous'] as List)
            .map((e) => PurchaseItemDto.fromJson(e))
            .toList(),
    current:
        (json['current'] as List)
            .map((e) => CurrentPurchaseItemDto.fromJson(e))
            .toList(),
  );
}

class PurchaseItemDto {
  final int id;
  final String date;
  final String reason;
  final String paymentMethod;
  final int amount;
  final String status;
  final String invoiceImage;

  PurchaseItemDto({
    required this.id,
    required this.date,
    required this.reason,
    required this.paymentMethod,
    required this.amount,
    required this.status,
    required this.invoiceImage,
  });

  factory PurchaseItemDto.fromJson(Map<String, dynamic> json) =>
      PurchaseItemDto(
        id: json['id'] ?? 0,
        date: json['date'] ?? '',
        reason: json['reason'] ?? '',
        paymentMethod: json['payment_method'] ?? '',
        amount: json['amount'] ?? 0,
        status: json['status'] ?? '',
        invoiceImage: json['invoiceImage'] ?? '',
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'date': date,
    'reason': reason,
    'payment_method': paymentMethod,
    'amount': amount,
    'status': status,
    'invoiceImage': invoiceImage,
  };
  factory PurchaseItemDto.empty() => PurchaseItemDto(
    id: 0,
    date: '',
    reason: '',
    paymentMethod: '',
    amount: 0,
    status: '',
    invoiceImage: '',
  );
}

class CurrentPurchaseItemDto {
  final int id;
  final String reason;
  final int amount;
  final String status;
  final String deadline;

  CurrentPurchaseItemDto({
    required this.id,
    required this.reason,
    required this.amount,
    required this.status,
    required this.deadline,
  });

  factory CurrentPurchaseItemDto.fromJson(Map<String, dynamic> json) =>
      CurrentPurchaseItemDto(
        id: json['id'] ?? 0,
        reason: json['reason'] ?? '',
        amount: json['amount'] ?? 0,
        status: json['status'] ?? '',
        deadline: json['deadline'] ?? '',
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'reason': reason,
    'amount': amount,
    'status': status,
    'deadline': deadline,
  };

  factory CurrentPurchaseItemDto.empty() => CurrentPurchaseItemDto(
    id: 0,
    reason: '',
    amount: 0,
    status: '',
    deadline: '',
  );
}
