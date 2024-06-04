import '../models/products_model.dart';

final List<ProductModel> dummyproducts = [
  ProductModel(
      productId: 1.toString(),
      productName: "SaRa Men's Slim Fit Casual Shirt",
      productPrice: 200,
      imageGallery: [
        ImageGallery(
            title: "",
            url:
                "https://www.google.com/search?q=tshhirtpicture&oq=tshhirtpicture&gs_lcrp=EgZjaHJvbWUyBggAEEUYOTIJCAEQABgNGIAEMgkIAhAAGA0YgAQyCQgDEAAYDRiABDIJCAQQABgNGIAEMgkIBRAAGA0YgAQyCQgGEAAYDRiABDIJCAcQABgNGIAEMgkICBAAGA0YgAQyCQgJEAAYDRiABNIBCDgxMjZqMGo3qAIIsAIB&sourceid=chrome&ie=UTF-8#vhid=8HPfymhnnFnahM&vssid=l")
      ],
      varient: [
        Varient(
          category: "size",
        )
      ],
      productDetails: """SaRa Men's Slim Fit Casual Shirt
Brand: SaRa 
Fabric: Cotton
Gender: Male
Color: Printed 
Fit Type: Slim Fit 
Length: Long
Collar/ Neck: Collar 
Sleeve: Full Sleeve
Available Size: S, M, L, XL.""")
];
