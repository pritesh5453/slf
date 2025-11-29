class PreApprovedLoanResponse {
  final bool status;
  final String message;
  final List<LoanModel> loans;
  final String totalPreApprovedLoan;

  PreApprovedLoanResponse({
    required this.status,
    required this.message,
    required this.loans,
    required this.totalPreApprovedLoan,
  });

  factory PreApprovedLoanResponse.fromJson(Map<String, dynamic> json) {
    return PreApprovedLoanResponse(
      status: json['status'],
      message: json['message'],
      loans: (json['Loans'] as List).map((e) => LoanModel.fromJson(e)).toList(),
      totalPreApprovedLoan: json['TotalPreApprovedLoan'],
    );
  }
}

class LoanModel {
  final int id;
  final int borrowerId;
  final int coBorrowerId;
  final String borrower;
  final String scheme;
  final int schemeId;
  final String schemeType;
  final String printName;
  final String productName;
  final String mobileNumber;
  final String alternateNumber;
  final String coBorrower;
  final String relation;
  final String nominee;
  final String nomineeRelation;
  final String ornamentPhoto;

  final List<PledgeItem> pledgeItemList;

  final String loanAmount;
  final String docCharges;
  final String netPayable;
  final String valuer1;
  final String valuer2;
  final int loanTenure;

  final String? bidderId;
  final String? bidderCloseAmt;
  final String? assignBidderName;
  final int auctionStatus;
  final String? auctionRemark;

  final String minLoan;
  final String maxLoan;

  final String approvedBy;
  final String approvalDate;
  final int branchId;

  final List<InterestRateModel> effectiveInterestRates;

  final List<PaymentDetails> paymentsDetails;

  final String status;
  final String? remark;

  final String? interestPaidAmount;
  final String? interestDueAmount;
  final String? interestPaidDayCount;

  final String interestPaidUpto;
  final String? lastInterestPaidDate;

  final String loanAmountPaid;
  final String loanPendingAmount;
  final String advanceInterestPaid;
  final String? lastInterestPaidPercentage;

  final String createdAt;
  final String updatedAt;

  final String totalValuation;
  final String ltv;
  final String maxEligible;
  final String takenLoan;
  final String preApprovedLoan;

  LoanModel({
    required this.id,
    required this.borrowerId,
    required this.coBorrowerId,
    required this.borrower,
    required this.scheme,
    required this.schemeId,
    required this.schemeType,
    required this.printName,
    required this.productName,
    required this.mobileNumber,
    required this.alternateNumber,
    required this.coBorrower,
    required this.relation,
    required this.nominee,
    required this.nomineeRelation,
    required this.ornamentPhoto,
    required this.pledgeItemList,
    required this.loanAmount,
    required this.docCharges,
    required this.netPayable,
    required this.valuer1,
    required this.valuer2,
    required this.loanTenure,
    this.bidderId,
    this.bidderCloseAmt,
    this.assignBidderName,
    required this.auctionStatus,
    this.auctionRemark,
    required this.minLoan,
    required this.maxLoan,
    required this.approvedBy,
    required this.approvalDate,
    required this.branchId,
    required this.effectiveInterestRates,
    required this.paymentsDetails,
    required this.status,
    this.remark,
    this.interestPaidAmount,
    this.interestDueAmount,
    this.interestPaidDayCount,
    required this.interestPaidUpto,
    this.lastInterestPaidDate,
    required this.loanAmountPaid,
    required this.loanPendingAmount,
    required this.advanceInterestPaid,
    this.lastInterestPaidPercentage,
    required this.createdAt,
    required this.updatedAt,
    required this.totalValuation,
    required this.ltv,
    required this.maxEligible,
    required this.takenLoan,
    required this.preApprovedLoan,
  });

  factory LoanModel.fromJson(Map<String, dynamic> json) {
    return LoanModel(
      id: json['id'],
      borrowerId: json['BorrowerId'],
      coBorrowerId: json['CoBorrowerId'],
      borrower: json['Borrower'],
      scheme: json['Scheme'],
      schemeId: json['Scheme_ID'],
      schemeType: json['Scheme_type'],
      printName: json['Print_Name'],
      productName: json['Product_Name'],
      mobileNumber: json['Mobile_Number'],
      alternateNumber: json['Alternate_Number'],
      coBorrower: json['Co_Borrower'],
      relation: json['Relation'],
      nominee: json['Nominee'],
      nomineeRelation: json['Nominee_Relation'],
      ornamentPhoto: json['Ornament_Photo'],

      pledgeItemList: (json['Pledge_Item_List'] as List)
          .map((e) => PledgeItem.fromJson(e))
          .toList(),

      loanAmount: json['Loan_amount'],
      docCharges: json['Doc_Charges'],
      netPayable: json['Net_Payable'],
      valuer1: json['Valuer_1'],
      valuer2: json['Valuer_2'],
      loanTenure: json['Loan_Tenure'],

      bidderId: json['BidderId']?.toString(),
      bidderCloseAmt: json['BidderCloseAmt']?.toString(),
      assignBidderName: json['AssignBidderName']?.toString(),
      auctionStatus: json['AuctionStatus'],
      auctionRemark: json['AuctionRemark']?.toString(),

      minLoan: json['Min_Loan'],
      maxLoan: json['Max_Loan'],

      approvedBy: json['approved_by'],
      approvalDate: json['approval_date'],
      branchId: json['branch_id'],

      effectiveInterestRates: (json['Effective_Interest_Rates'] as List)
          .map((e) => InterestRateModel.fromJson(e))
          .toList(),

      paymentsDetails: (json['payments_Details'] as List)
          .map((e) => PaymentDetails.fromJson(e))
          .toList(),

      status: json['status'],
      remark: json['remark']?.toString(),

      interestPaidAmount: json['InterestPaidAmount']?.toString(),
      interestDueAmount: json['InterestDueAmount']?.toString(),
      interestPaidDayCount: json['InterestPaidDayCount']?.toString(),

      interestPaidUpto: json['InterestPaidUpto'],
      lastInterestPaidDate: json['LastInterestPaidDate']?.toString(),

      loanAmountPaid: json['LoanAmountPaid'],
      loanPendingAmount: json['LoanPendingAmount'],
      advanceInterestPaid: json['AdvanceInterestPaid'],
      lastInterestPaidPercentage: json['LastInterestPaidPercentage']
          ?.toString(),

      createdAt: json['created_at'],
      updatedAt: json['updated_at'],

      totalValuation: json['TotalValuation'],
      ltv: json['LTV'],
      maxEligible: json['MaxEligible'],
      takenLoan: json['TakenLoan'],
      preApprovedLoan: json['PreApprovedLoan'],
    );
  }
}

class InterestRateModel {
  final String term;
  final int rate;

  InterestRateModel({required this.term, required this.rate});

  factory InterestRateModel.fromJson(Map<String, dynamic> json) {
    return InterestRateModel(term: json['term'], rate: json['rate']);
  }
}

class PledgeItem {
  final int id;
  final String particular;
  final int nos;
  final int gross;
  final int netWeight;
  final String purity;
  final String calculatedPurity;
  final double rate;
  final double valuation;
  final String remark;

  PledgeItem({
    required this.id,
    required this.particular,
    required this.nos,
    required this.gross,
    required this.netWeight,
    required this.purity,
    required this.calculatedPurity,
    required this.rate,
    required this.valuation,
    required this.remark,
  });

  factory PledgeItem.fromJson(Map<String, dynamic> json) {
    return PledgeItem(
      id: json['id'],
      particular: json['particular'] ?? "",
      nos: json['nos'],
      gross: json['gross'],
      netWeight: json['netWeight'],
      purity: json['purity'],
      calculatedPurity: json['Calculated_Purity'] ?? "",
      rate: json['rate'].toDouble(),
      valuation: json['valuation'].toDouble(),
      remark: json['remark'] ?? "",
    );
  }
}

class PaymentDetails {
  final String bank;
  final String paidBy;
  final String utrNumber;
  final String customerBank;
  final String customerAmount;

  PaymentDetails({
    required this.bank,
    required this.paidBy,
    required this.utrNumber,
    required this.customerBank,
    required this.customerAmount,
  });

  factory PaymentDetails.fromJson(Map<String, dynamic> json) {
    return PaymentDetails(
      bank: json['bank'] ?? "",
      paidBy: json['paidBy'],
      utrNumber: json['utrNumber'] ?? "",
      customerBank: json['customerBank'] ?? "",
      customerAmount: json['customerAmount'] ?? "0",
    );
  }
}
