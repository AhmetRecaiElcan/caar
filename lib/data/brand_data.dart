
class Brand {
  String name;
  String image;
  int productCount;
  bool isVerified;

  Brand({
    required this.name, 
    required this.image, 
    required this.productCount, 
    this.isVerified = false
  });
}

List<Brand> getBrandList() {
  return <Brand>[
    Brand(
      name: "Ford",
      image: "https://drive.google.com/uc?id=1IGiDqyrsjVBMQbatwcF5UeCgGxUQRH13",
      productCount: 265,
      isVerified: false
    ),
    Brand(
      name: "Toyota",
      image: "https://drive.google.com/uc?id=1_EkAjdbfOOYMLWZW2fiWktDDRrLYrhBb",
      productCount: 95,
      isVerified: false
    ),
    Brand(
      name: "Fiat",
      image: "https://drive.google.com/uc?id=1eB9KTa8n_jXGbaIHy609bUda_5ZTn43S",
      productCount: 85
    ),
    Brand(
      name: "Tesla",
      image: "https://drive.google.com/uc?id=1qiFsondPEnOctmi_Pub1ZVvRmIgIxH52",
      productCount: 36,
      isVerified: false
    ),
    Brand(
      name: "Chery",
      image: "https://drive.google.com/uc?id=1W-l9OBnbJZf9tJvEU4W9BzO_SO3RLuko",
      productCount: 65
    ),
    Brand(
      name: "Audi",
      image: "https://drive.google.com/uc?id=1ITdYBcfmsW01_CT2LXc6uzLDCgd5erQz",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Dacia",
      image: "https://drive.google.com/uc?id=1MIs3T1Jj6r7Yhs5WLOkXfk0ND14nTAjE",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Hyundai",
      image: "https://drive.google.com/uc?id=1B9WB2JDuIIdcYfldVLw2owzw12QCL0t5",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Kia",
      image: "https://drive.google.com/uc?id=1eSmx90Ziu_ZgJDU-Dzqs5klG4S1SZPq5",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Opel",
      image: "https://drive.google.com/uc?id=11UsCq9OaVBpMKOJeaFl4Z9k2xwioQzRC",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Togg",
      image: "https://drive.google.com/uc?id=11UsCq9OaVBpMKOJeaFl4Z9k2xwioQzRC",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Toyota",
      image: "https://drive.google.com/uc?id=1_EkAjdbfOOYMLWZW2fiWktDDRrLYrhBb",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Volkswagen",
      image: "https://drive.google.com/uc?id=1ZdCXrZU4INPImW3xj5zMEC41EpRldE9P",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Renault",
      image: "https://drive.google.com/uc?id=16XbbWfuJjiUYOkTFfMlmgb2nlfm7Qq-2",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Mercedes",
      image: "https://drive.google.com/uc?id=1vsAtRBPagC7Xlw83N0xWy254Dz_klTrY",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Volvo",
      image: "https://drive.google.com/uc?id=1z0J74PZQtHn8q94bofhs9Ash5iZfJpAy",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Nissan",
      image: "https://drive.google.com/uc?id=1i5JzoI7CtQAnO4W7FXc1elOFgbcwd_t4",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Land Rover",
      image: "https://drive.google.com/uc?id=1KSboFkXTc84aPUAgEbc3iw72OT_w4yrz",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Byd",
      image: "https://drive.google.com/uc?id=1v6GiF09x7_G1LRX7X61wTNxHvdYNikDS",
      productCount: 6,
      isVerified: false
    ),
    Brand(
      name: "Honda",
      image: "https://drive.google.com/uc?id=17xuTpufli8SRSRfr7UC2nJ4BpZsic3Cw",
      productCount: 7,
      isVerified: false
    ),
    Brand(
      name: "Bmw",
      image: "https://drive.google.com/uc?id=1VYKrfElkeWbWOEbhvxOoxL1OMlKaqbRS",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Alfa Romeo",
      image: "https://drive.google.com/uc?id=1Mg-IlTN5G_wwxF5t-PWHpHEUwc64D05L",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Cupra",
      image: "https://drive.google.com/uc?id=1_PCT_OopmdF-8Ujjca4F3emm-N6seY4D",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Citroen",
      image: "https://drive.google.com/uc?id=1nPKLbD44YsCGWg6tkSUWPm1teIWeJFg6",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Dfsk",
      image: "https://drive.google.com/uc?id=1Tvz27GvPQNxmlhW1VThla_BHAUMV4Nc9",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Ds",
      image: "https://drive.google.com/uc?id=1KW75sXJLBFQi5VF1W9fRTOR3S-KGV85F",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Jaecco",
      image: "https://drive.google.com/uc?id=1U199GWxgTJqjADqXQ4bm3L6SkyUOk4hS",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Jeep",
      image: "https://drive.google.com/uc?id=1x-IxkJ3NJCe0cfdvmQslknFMTuDmfFBX",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Lexus",
      image: "https://drive.google.com/uc?id=1t4N2V5HruoSvR71b3MJHRvtiKeqQoWzY",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Mg",
      image: "https://drive.google.com/uc?id=1uTbKMTsfqZzfMui_SKx3rMGMX8KAMEMY",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Mini",
      image: "https://drive.google.com/uc?id=1pr_EL0WA-NiwDvY_iBR84CcFPOrFazvK",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Mitsubishi",
      image: "https://drive.google.com/uc?id=1phSiUMKOud4TXhWajs4H4cSQbwfzlq-4",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Peugeot",
      image: "https://drive.google.com/uc?id=1daRt1C2NtptpLUUggmiaHmGFNRruRY-3",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Skoda",
      image: "https://drive.google.com/uc?id=1xxmsMJjKXbLnrJH_dsXwutgFdCmrdLok",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Ssangyong",
      image: "https://drive.google.com/uc?id=1rvq-6LLt3hFgbpEOT3J_x_afwdX93oH8",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Subaru",
      image: "https://drive.google.com/uc?id=1ktFLsZIB81Wmeiilq-FjCjxglRTSQz4u",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Suzuki",
      image: "https://drive.google.com/uc?id=17eGn1uA8mXhQ5GqiW-7Y4bqXNno9obuK",
      productCount: 88,
      isVerified: false
    ),
  ];
}
