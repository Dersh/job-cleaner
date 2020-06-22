import 'package:flutter/material.dart';
import '../widgets/search_page/vacancy_card.dart';

class SearchPage extends StatefulWidget {
  final String title;

  SearchPage({this.title});

  @override
  _SearchPageState createState() => _SearchPageState();
}

enum _HomeDistance { km_3, km_5, km_10, no_matter }

class _SearchPageState extends State<SearchPage> {
  var _homeDistance = _HomeDistance.km_3;
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: Icon(Icons.arrow_back), // fake back arrow
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  // рамка
                  AnimatedContainer(
                    duration: Duration(milliseconds: 250),
                    height: _expanded ? 380 : 70,
                    margin: const EdgeInsets.only(top: 36, bottom: 20),
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          // поле ввода
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Продавец',
                              suffixIcon: Icon(Icons.search,
                                  size: 40,
                                  color: Theme.of(context).primaryColor),
                            ),
                          ),

                          // поля фильтров
                          if (_expanded)
                            _buildFilters(),
                        ],
                      ),
                    ),
                  ),

                  // лейбл на белом фоне
                  Positioned(
                    top: 27,
                    left: 9,
                    // отступы
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(color: Colors.white),
                      child: Text(
                        'Поиск вакансии',
                        style: TextStyle(
                          color: Colors.black38,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // кнопки "нет подходящих?", "добавить фильтры"
              if (!_expanded)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {},
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        'Нет подходящих?',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Добавить фильтры',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _expanded = true;
                            });
                          },
                          icon: ImageIcon(
                            AssetImage('assets/images/filter.png'),
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

              // Список карточек
              Container(
                  //decoration: BoxDecoration(border: Border.all()),
                  height: 450,
                  child: ListView(                  
                    children: <Widget>[
                      const VacancyCard(                        
                        name: 'Продавец-кассир',
                        address: 'ул. Московская, д.34, ст. Заречная',
                        shift: 'с 9:00 до 21:00',
                        salary: 350,
                        distance: 3,
                        imageAsset: 'assets/images/logo_pyaterochka.png',
                      ),
                      const VacancyCard(                        
                        name: 'Продавец',
                        address: 'ул. Росси, д.246/б, оф.12, ст. Калуга',
                        shift: 'с 21:00 до 2:00',
                        salary: 1450,
                        distance: 10,
                        imageAsset: 'assets/images/logo_G2A.png',
                      ),
                      const VacancyCard(                        
                        name: 'Продавец',
                        address: 'ул. Росси, д.246/б, оф.12, ст. Калуга',
                        shift: 'с 21:00 до 2:00',
                        salary: 1450,
                        distance: 10,
                        imageAsset: 'assets/images/logo_G2A.png',
                      ),                  
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilters() {
    return Column(
      children: <Widget>[
        // надписи: "Фильтры, очистить", иконка "закрыть"
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Фильтры',
              style: TextStyle(color: Colors.black38),
            ),
            SizedBox(width: 40),
            Text('Очистить'),
            IconButton(
              icon:
                  Icon(Icons.keyboard_arrow_up, size: 40, color: Colors.green),
              onPressed: () {
                setState(() {
                  _expanded = false;
                });
              },
            ),
          ],
        ),

        // надписи: "Заработная плата", "руб/час"
        Row(
          children: <Widget>[
            Text(
              'Заработная плата',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(' (руб/час)', style: TextStyle(fontSize: 11)),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('От', style: TextStyle(fontSize: 9)),
              SizedBox(width: 80, height: 20, child: TextField()),
              SizedBox(width: 40),
              Text('До', style: TextStyle(fontSize: 9)),
              SizedBox(width: 80, height: 20, child: TextField())
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Продолжительность смены',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('C', style: TextStyle(fontSize: 9)),
              SizedBox(width: 80, height: 20, child: TextField()),
              SizedBox(width: 40),
              Text('До', style: TextStyle(fontSize: 9)),
              SizedBox(width: 80, height: 20, child: TextField())
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Удаленность от места проживания',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),

        // радио-группа
        Row(
          children: <Widget>[
            Row(
              children: <Widget>[
                Radio(
                  groupValue: _homeDistance,
                  value: _HomeDistance.km_3,
                  onChanged: (_HomeDistance val) {
                    setState(() {
                      _homeDistance = val;
                    });
                  },
                ),
                Text('3 км'),
              ],
            ),
            Row(
              children: <Widget>[
                Radio(
                  groupValue: _homeDistance,
                  value: _HomeDistance.km_5,
                  onChanged: (_HomeDistance val) {
                    setState(() {
                      _homeDistance = val;
                    });
                  },
                ),
                Text('5 км'),
              ],
            ),
            Row(
              children: <Widget>[
                Radio(
                  groupValue: _homeDistance,
                  value: _HomeDistance.km_10,
                  onChanged: (_HomeDistance val) {
                    setState(() {
                      _homeDistance = val;
                    });
                  },
                ),
                Text('10 км'),
              ],
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Radio(
              groupValue: _homeDistance,
              value: _HomeDistance.no_matter,
              onChanged: (_HomeDistance val) {
                setState(() {
                  _homeDistance = val;
                });
              },
            ),
            Text('Не важно'),
          ],
        ),
      ],
    );
  }
}
