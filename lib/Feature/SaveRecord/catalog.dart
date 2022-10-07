class CatalogModel {
  static final items = [
    Item(
        name: "iPhone 12",
        image:
            "https://cdn.pocket-lint.com/r/s/970x/assets/images/154302-phones-review-iphone-12-pro-review-product-shots-image3-wd487ybwpf.jpg"),
    Item(
        name: "iPhone 13 pro",
        image:
            "https://www.apple.com/v/iphone-13-pro/c/images/overview/design/finishes_1_sierra_blue__2bovafkl4yaa_large.jpg"),
    Item(
        name: "IPhone 13",
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfOxwodBL81UDhB4syHn3gYZOhD3EqjD_LDMyvmBaOt8JUxrcEVgA85FbJT4IJGyqhJfU&usqp=CAU"),
    Item(
        name: "iPhone 11",
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2YWQPNddTCfot6bCPOcq5wuc2D_LothyquLDIwTyxG6GVguUeSmUNHuVIT2v-arNIV-E&usqp=CAU"),
    Item(
        name: "iPhone 10",
        image:
            "https://www.gizmochina.com/wp-content/uploads/2019/09/Apple-iPhone-11-1.jpg"),
  ];
}

class Item {
  final String name;
  final String image;

  Item({required this.name, required this.image});
}
