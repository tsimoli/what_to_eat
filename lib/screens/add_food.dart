import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:what_to_eat/utils/filter_list.dart';
import 'package:what_to_eat/utils/queries.dart';
import 'package:what_to_eat/utils/toast_service.dart';
import 'package:what_to_eat/widgets/filter_button.dart';

class AddFood extends StatefulWidget {
  final Function refetchFoods;

  const AddFood({Key key, this.refetchFoods}) : super(key: key);

  @override
  _AddFoodState createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  TextEditingController _nameController;
  List<String> tags = [];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lisää ruoka"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                decoration: new InputDecoration(
                    hintText: 'Ruoan nimi', labelText: "Ruoan nimi"),
                controller: _nameController,
              ),
              Center(
                  child: Text("Ominaisuudet", style: TextStyle(fontSize: 20))),
              Container(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: filters
                      .map(
                        (filter) => Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (tags.contains(filter.filterName)) {
                                        tags.remove(filter.filterName);
                                      } else
                                        tags.add(filter.filterName);
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                tags.contains(filter.filterName)
                                                    ? Colors.red
                                                    : Colors.transparent,
                                            width: 5),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(40.0))),
                                    child: Text(
                                      filter.emoji,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                                Text(filter.name,
                                    style: TextStyle(fontSize: 15))
                              ],
                            ),
                      )
                      .toList(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Mutation(
                      options: MutationOptions(
                        document: createFood,
                      ),
                      update: (Cache cache, QueryResult result) {
                        if (!result.hasErrors) {
                          ToastService.successToast("Ruoka lisätty");
                          widget.refetchFoods();
                          _navigateBack();
                        } else {
                          print(result.errors);
                          ToastService.errorToast(
                              "Ruoan lisääminen epäonnistui");
                        }
                      },
                      builder: (
                        RunMutation createFood,
                        QueryResult result,
                      ) {
                        return RaisedButton(
                          color: Color(0xFF00C851),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          onPressed: () {
                            _createFood(createFood);
                          },
                          child: Text(
                            "Lisää",
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      }),
                  RaisedButton(
                    color: Color(0xFF33B5E5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    onPressed: () => _navigateBack(),
                    child: Text(
                      "Peruuta",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateBack() {
    Navigator.pop(context);
  }

  void _createFood(Function createFood) {
    var food = {
      "name": _nameController.value.text,
      "tags": tags,
    };

    createFood({
      'input': food,
    });
  }
}
