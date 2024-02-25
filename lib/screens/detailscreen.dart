import 'package:covid_counter/Api/model.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final Regional region;

  const DetailScreen({super.key, required this.region});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.fromLTRB(
          12, MediaQuery.sizeOf(context).height * 0.05, 12, 12),
      height: MediaQuery.sizeOf(context).height * 1,
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 139, 201, 252),
            Color.fromARGB(238, 1, 141, 255),
          ],
        ),
        // color: Color.fromARGB(255, 162, 235, 181), // Container color
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 255, 76, 76), // Shadow color
            blurRadius: 9.0, // Spread of the shadow
            offset: Offset(0, 0), // Offset in x and y direction
          ),
        ],
        borderRadius:
            BorderRadius.circular(10.0), // Optional: Set border radius
      ),
      child: Column(
        children: [
          Text(
            widget.region.loc,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0)),
          ),
          const SizedBox(height: 20),
          Table(
            border: TableBorder.all(),
            children: [
              TableRow(
                children: [
                  const TableCell(
                    child: SizedBox(
                        height: 100,
                        child: Center(
                            child: Text(
                          'TotalConfirmed',
                          style: TextStyle(
                            color: Color.fromARGB(255, 242, 255, 0),
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ))),
                  ),
                  TableCell(
                    child: SizedBox(
                        height: 100,
                        child: Center(
                            child: Text(
                          '${widget.region.totalConfirmed}',
                          style: const TextStyle(fontSize: 22),
                        ))),
                  ),
                ],
              ),
              TableRow(
                children: [
                  const TableCell(
                    child: SizedBox(
                        height: 100,
                        child: Center(
                            child: Text(
                          'Recovered',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 255, 26),
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ))),
                  ),
                  TableCell(
                    child: SizedBox(
                        height: 100,
                        child: Center(
                            child: Text(
                          '${widget.region.discharged}',
                          style: const TextStyle(fontSize: 22),
                        ))),
                  ),
                ],
              ),
              TableRow(
                children: [
                  const TableCell(
                    child: SizedBox(
                        height: 100,
                        child: Center(
                            child: Text(
                          'Death',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 0, 0),
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ))),
                  ),
                  TableCell(
                    child: SizedBox(
                        height: 100,
                        child: Center(
                            child: Text(
                          '${widget.region.deaths}',
                          style: const TextStyle(fontSize: 22),
                        ))),
                  ),
                ],
              ),
              TableRow(
                children: [
                  const TableCell(
                    child: SizedBox(
                        height: 100,
                        child: Center(
                            child: Text(
                          'Foreign case',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 38, 255),
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ))),
                  ),
                  TableCell(
                    child: SizedBox(
                        height: 100,
                        child: Center(
                            child: Text(
                          '${widget.region.confirmedCasesForeign}',
                          style: const TextStyle(fontSize: 22),
                        ))),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    ));
  }
}
