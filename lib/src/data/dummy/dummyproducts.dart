import '../models/finalproductmodel.dart';
import '../models/products_model.dart';

final List<ProductModel> dummyproducts = [
  ProductModel(
      productId: ' ',
      productName: "Winter T-shirt",
      productPrice: 200.0,
      imageGallery: [
        ImageGallery(
            title: "Image-1",
            url:
                "https://images.othoba.com/images/thumbs/0574991_winter-long-full-sleeves-t-shirt.jpeg"),
        ImageGallery(
            title: "Image-2",
            url:
                "https://images.othoba.com/images/thumbs/0574988_winter-long-full-sleeves-t-shirt.jpeg")
      ],
      varient: [
        Varient(category: "Size", items: [
          VarientItem(title: "S", description: ""),
          VarientItem(title: "M", description: ""),
          VarientItem(title: "XL", description: "")
        ])
      ],
      productDetails: """
Winter Long Full Sleeves T shirt  
Item code: WST-13
Material: Propylene
Sleeve: Full Sleeve
Style: Casual
Made in Bangladesh
Color: As given picture
Size- M, L, XL
""",
      brand: "")
//   ProductModel(
//       productId: 1.toString(),
//       productName: "SaRa Men's Slim Fit Casual Shirt",
//       productPrice: 200,
//       imageGallery: [
//         ImageGallery(
//             title: "",
//             url:
//                 "https://www.google.com/search?q=tshhirtpicture&oq=tshhirtpicture&gs_lcrp=EgZjaHJvbWUyBggAEEUYOTIJCAEQABgNGIAEMgkIAhAAGA0YgAQyCQgDEAAYDRiABDIJCAQQABgNGIAEMgkIBRAAGA0YgAQyCQgGEAAYDRiABDIJCAcQABgNGIAEMgkICBAAGA0YgAQyCQgJEAAYDRiABNIBCDgxMjZqMGo3qAIIsAIB&sourceid=chrome&ie=UTF-8#vhid=8HPfymhnnFnahM&vssid=l")
//       ],
//       varient: [
//         Varient(
//           category: "size",
//         )
//       ],
//       productDetails: """SaRa Men's Slim Fit Casual Shirt
// Brand: SaRa
// Fabric: Cotton
// Gender: Male
// Color: Printed
// Fit Type: Slim Fit
// Length: Long
// Collar/ Neck: Collar
// Sleeve: Full Sleeve
// Available Size: S, M, L, XL.""")
];
