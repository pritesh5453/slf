import 'package:slf/model/homescreen/interest_rateModel.dart';
import 'package:slf/model/homescreen/payment_detailsMode.dart';
import 'package:slf/model/homescreen/pledgeItems_model.dart';

class LoanData {
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

  final List<InterestRate> interestRates;
  final List<PaymentDetails> paymentDetails;

  final String status;
  final String? remark;

  final String? interestPaidAmount;
  final String? interestDueAmount;
  final String? interestPaidDayCount;
  final String? interestPaidUpto;
  final String? lastInterestPaidDate;

  final String loanAmountPaid;
  final String loanPendingAmount;
  final String advanceInterestPaid;
  final String? lastInterestPaidPercentage;

  final String createdAt;
  final String updatedAt;

  LoanData({
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
    required this.bidderId,
    required this.bidderCloseAmt,
    required this.assignBidderName,
    required this.auctionStatus,
    required this.auctionRemark,
    required this.minLoan,
    required this.maxLoan,
    required this.approvedBy,
    required this.approvalDate,
    required this.branchId,
    required this.interestRates,
    required this.paymentDetails,
    required this.status,
    required this.remark,
    required this.interestPaidAmount,
    required this.interestDueAmount,
    required this.interestPaidDayCount,
    required this.interestPaidUpto,
    required this.lastInterestPaidDate,
    required this.loanAmountPaid,
    required this.loanPendingAmount,
    required this.advanceInterestPaid,
    required this.lastInterestPaidPercentage,
    required this.createdAt,
    required this.updatedAt,
  });

  factory LoanData.fromJson(Map<String, dynamic> json) {
    return LoanData(
      id: json["id"],
      borrowerId: json["BorrowerId"],
      coBorrowerId: json["CoBorrowerId"],
      borrower: json["Borrower"],
      scheme: json["Scheme"],
      schemeId: json["Scheme_ID"],
      schemeType: json["Scheme_type"],
      printName: json["Print_Name"],
      productName: json["Product_Name"],
      mobileNumber: json["Mobile_Number"],
      alternateNumber: json["Alternate_Number"],
      coBorrower: json["Co_Borrower"],
      relation: json["Relation"],
      nominee: json["Nominee"],
      nomineeRelation: json["Nominee_Relation"],
      ornamentPhoto: json["Ornament_Photo"],
      pledgeItemList: (json["Pledge_Item_List"] as List)
          .map((e) => PledgeItem.fromJson(e))
          .toList(),
      loanAmount: json["Loan_amount"],
      docCharges: json["Doc_Charges"],
      netPayable: json["Net_Payable"],
      valuer1: json["Valuer_1"],
      valuer2: json["Valuer_2"],
      loanTenure: json["Loan_Tenure"],
      bidderId: json["BidderId"]?.toString(),
      bidderCloseAmt: json["BidderCloseAmt"]?.toString(),
      assignBidderName: json["AssignBidderName"]?.toString(),
      auctionStatus: json["AuctionStatus"],
      auctionRemark: json["AuctionRemark"]?.toString(),
      minLoan: json["Min_Loan"],
      maxLoan: json["Max_Loan"],
      approvedBy: json["approved_by"],
      approvalDate: json["approval_date"],
      branchId: json["branch_id"],
      interestRates: (json["Effective_Interest_Rates"] as List)
          .map((e) => InterestRate.fromJson(e))
          .toList(),
      paymentDetails: (json["payments_Details"] as List)
          .map((e) => PaymentDetails.fromJson(e))
          .toList(),
      status: json["status"],
      remark: json["remark"]?.toString(),
      interestPaidAmount: json["InterestPaidAmount"]?.toString(),
      interestDueAmount: json["InterestDueAmount"]?.toString(),
      interestPaidDayCount: json["InterestPaidDayCount"]?.toString(),
      interestPaidUpto: json["InterestPaidUpto"]?.toString(),
      lastInterestPaidDate: json["LastInterestPaidDate"]?.toString(),
      loanAmountPaid: json["LoanAmountPaid"],
      loanPendingAmount: json["LoanPendingAmount"],
      advanceInterestPaid: json["AdvanceInterestPaid"],
      lastInterestPaidPercentage: json["LastInterestPaidPercentage"]
          ?.toString(),
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
    );
  }
}
