import 'package:flutter/material.dart';

class VacancyCard extends StatelessWidget {
  final String name, address, shift, imageAsset;
  final int salary, distance;

  const VacancyCard({
    Key key,
    this.name,
    this.address,
    this.shift,
    this.salary,
    this.distance,
    this.imageAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // название, адрес, время
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(this.name,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Адрес',
                        style: TextStyle(
                          fontSize: 9,
                          color: Colors.black38,
                        ),
                      ),
                      Text(
                        this.address,
                        style: TextStyle(
                          fontSize: 9,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Время',
                        style: TextStyle(
                          fontSize: 9,
                          color: Colors.black38,
                        ),
                      ),
                      Text(
                        this.shift,
                        style: TextStyle(
                          fontSize: 9,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // зарплата, расстояние, эмблема
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text('${this.salary} ₽',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Image.asset('assets/images/address_icon.png'),
                      SizedBox(width: 4),
                      Text(
                        '${this.distance} км',
                        style:
                            TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Image.asset(this.imageAsset),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
