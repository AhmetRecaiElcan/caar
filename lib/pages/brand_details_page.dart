import 'package:caar/cars/honda/honda_city.dart';
import 'package:flutter/material.dart';
import 'package:caar/constants.dart';
import 'package:caar/data.dart';
import 'package:caar/cars/ford_details.dart';
import 'package:caar/cars/tesla_details.dart';
import 'package:caar/data/car_data.dart';
import 'package:caar/cars/byd/byd_dolphin.dart';
import 'package:caar/cars/alfa_romeo_c4.dart';
import 'package:caar/cars/land_rover_discovery.dart';
import 'package:caar/cars/byd/byd_atto_3.dart';
import 'package:caar/cars/byd/byd_seal_u_ev.dart';
import 'package:caar/cars/byd/byd_seal_u_dm-i.dart';
import 'package:caar/cars/byd/byd_seal_u_awd.dart';
import 'package:caar/cars/byd/byd_seal_han.dart';
import 'package:caar/cars/honda/honda_civic.dart';
import 'package:caar/cars/honda/honda_crv_ehev.dart';
import 'package:caar/cars/honda/honda_hrv_ehev.dart';
import 'package:caar/cars/honda/honda_jazz_ehev.dart';
import 'package:caar/cars/honda/honda_typer.dart';
import 'package:caar/cars/honda/honda_zrv_ehev.dart';
import 'package:caar/cars/fiat/fiat_egeacross.dart';
import 'package:caar/cars/fiat/fiat_egeasedan.dart';
import 'package:caar/cars/fiat/fiat_topolino.dart';
import 'package:caar/cars/fiat/fiat_600.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BrandDetailsPage extends StatefulWidget {
  final String brandName;
  final String brandImage;

  const BrandDetailsPage({
    Key? key, 
    required this.brandName,
    required this.brandImage,
  }) : super(key: key);

  @override
  _BrandDetailsPageState createState() => _BrandDetailsPageState();
}

class _BrandDetailsPageState extends State<BrandDetailsPage> {
  bool isListView = false;
  late List<Car> brandCars;

  @override
  void initState() {
    super.initState();
    // Seçilen markaya ait arabaları filtrele
    brandCars = getCarList().where((car) => 
      car.brand.toLowerCase() == widget.brandName.toLowerCase()
    ).toList();
  }

  Widget _getDetailsPage(Car car) {
    print("Selected car brand: ${car.brand.toLowerCase()}"); // Debug için
    switch(car.brand.toLowerCase()) {
      case "ford":
        return FordDetails(car: car);
      case "tesla":
        return TeslaDetails(car: car);
      case "land rover":
      if (car.model == "Discovery") {
        return LandRoverDiscoveryDetails(car: car);
      }
      return LandRoverDiscoveryDetails(car: car);
      case "honda":
        if (car.model == "City") {
          return HondaCityDetails(car: car);
        } else if (car.model == "Civic") {
          return HondaCivicDetails(car: car);
        } else if (car.model == "CR-V E:HEV") {
          return HondaCrvEhevDetails(car: car);
        } else if (car.model == "HR-V E:HEV") {
          return HondaHrvEhevDetails(car: car);
        } else if (car.model == "JAZZ E:HEV") {
          return HondaJazzEhevDetails(car: car);
        } else if (car.model == "Type R") {
          return HondaTyperDetails(car: car);
        } else if (car.model == "ZR-V E:HEV") {
          return HondaZervEhevDetails(car: car);
        }
        return HondaCityDetails(car: car); // varsayılan Honda City sayfası
      case "byd":
        if (car.model == "Dolphin") {
          return BydDolphinDetails(car: car);
        } else if (car.model == "Atto 3") {
          return BydAtto3Details(car: car);
        } else if(car.model == "Seal U Ev") {
          return BydSealUEvDetails(car: car);
        } else if(car.model == "Byd Seal U DM-İ") {
          return BydSealUdmiDetails(car: car);
        } else if(car.model == "Byd Seal U AWD") {
          return BydSealUAwdDetails(car: car);
        } else if(car.model == "Byd Seal Han") {
          return BydSealHanDetails(car: car);
        }
        return BydDolphinDetails(car: car);// varsayılan BYD sayfası
      case "alfa romeo":
        return AlfaRomeoC4Details(car: car);
      case"fiat":
        if (car.model == "Egea Cross") {
          return FiatEgeaCrossDetails(car: car);
        }else if (car.model == "Egea Sedan") {
        return FiatEgeaSedanDetails(car: car);
       }else if (car.model == "Topolino") {
        return FiatTopolinoDetails(car: car);
       }else if (car.model == "Egea HB") {
        return Fiat600Details(car: car);
       }
      //}//else if (car.model == "Egea HB") {
        //return FiatEgeaCrossDetails(car: car);
      //}
       return FiatEgeaCrossDetails(car: car);
      // Diğer markalar için case'ler eklenecek
      default:
        return FordDetails(car: car); // Geçici olarak Ford detaylarını göster
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
        title: Row(
          children: [
            CachedNetworkImage(
              imageUrl: widget.brandImage,
              height: 30,
              width: 30,
              placeholder: (context, url) => Container(
                height: 30,
                width: 30,
                child: Center(child: CircularProgressIndicator(strokeWidth: 2.0)),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            SizedBox(width: 10),
            Text(
              widget.brandName,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
         actions: [
    IconButton(
      icon: Icon(
        isListView ? Icons.grid_view : Icons.list,
        color: Colors.black,
      ),
      onPressed: () {
        setState(() {
          isListView = !isListView;
        });
      },
    ),
  ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "${brandCars.length} Araç Bulundu",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: isListView ? _buildListView() : _buildGridView(),
          ),
        ],
      ),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: brandCars.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => _getDetailsPage(brandCars[index]),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                  width: 120,
                  height: 80,
                  child: CachedNetworkImage(
                    imageUrl: brandCars[index].images[0],
                    fit: BoxFit.contain,
                    placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        brandCars[index].model,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "\₺${brandCars[index].price}",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        brandCars[index].condition,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: brandCars.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => _getDetailsPage(brandCars[index]),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Center(
                      child: CachedNetworkImage(
                        imageUrl: brandCars[index].images[0],
                        fit: BoxFit.contain,
                        placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        brandCars[index].model,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "\₺${brandCars[index].price}",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        brandCars[index].condition,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}