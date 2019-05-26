import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:what_to_eat/utils/queries.dart';
import 'package:what_to_eat/utils/toast_service.dart';

class AddFood extends StatefulWidget {
  final Function refetchFoods;

  const AddFood({Key key, this.refetchFoods}) : super(key: key);

  @override
  _AddFoodState createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  TextEditingController _nameController;
  TextEditingController _urlController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _urlController = TextEditingController();
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
              TextField(
                decoration: new InputDecoration(
                    hintText: 'Linkki reseptiin',
                    labelText: "Linkki reseptiin"),
                controller: _urlController,
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
      "url": _urlController.value.text,
      "tags": [],
    };

    createFood({
      'input': food,
    });
  }
}
