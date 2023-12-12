class productModel {
  int? id;
  String? bookName;
  String? bookDesc;
  String? bookImagePath;
  int? bookPrice;
  String? bookAuthorName;
  String? bookPublisherName;
  String? bookReleaseDate;
  bool? isRentable;
  bool? isAvailable;

  productModel(
      {this.id,
      this.bookName,
      this.bookDesc,
      this.bookImagePath,
      this.bookPrice,
      this.bookAuthorName,
      this.bookPublisherName,
      this.bookReleaseDate,
      this.isRentable,
      this.isAvailable});

  productModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookName = json['bookName'];
    bookDesc = json['bookDesc'];
    bookImagePath = json['bookImagePath'];
    bookPrice = json['bookPrice'];
    bookAuthorName = json['bookAuthorName'];
    bookPublisherName = json['bookPublisherName'];
    bookReleaseDate = json['bookReleaseDate'];
    isRentable = json['isRentable'];
    isAvailable = json['isAvailable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bookName'] = this.bookName;
    data['bookDesc'] = this.bookDesc;
    data['bookImagePath'] = this.bookImagePath;
    data['bookPrice'] = this.bookPrice;
    data['bookAuthorName'] = this.bookAuthorName;
    data['bookPublisherName'] = this.bookPublisherName;
    data['bookReleaseDate'] = this.bookReleaseDate;
    data['isRentable'] = this.isRentable;
    data['isAvailable'] = this.isAvailable;
    return data;
  }
}
