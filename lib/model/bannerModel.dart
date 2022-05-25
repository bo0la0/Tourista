
class bannerModel {

  String? providerName;
  List<String>? banners;

  bannerModel({
    this.providerName,
    this.banners,
  });

  bannerModel.fromJson(Map<String, dynamic> json) {
    providerName = json['ProviderName'];
    banners = json['banners'];

  }

  Map<String, dynamic> toMap() {
    return {
      'ProviderName': providerName,
      'banners': banners,
    };
  }
}