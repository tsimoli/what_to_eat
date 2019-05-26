import 'package:flutter/material.dart';
import 'package:what_to_eat/screens/food_search.dart';
import 'package:provider/provider.dart';
import 'models/filters.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HttpLink httpLink = HttpLink(
        //endPoint: 'http://192.168.1.177:4000/api',
        uri: 'http://91.159.8.163:4000/api');

    /*final AuthLink authLink = AuthLink(
      getToken: () =>
          SecureStorage.getApiToken().then((token) => 'Bearer $token'),
    );

    final Link link = authLink.concat(httpLink as Link);
*/
    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        cache: NormalizedInMemoryCache(
          dataIdFromObject: typenameDataIdFromObject,
        ),
        link: httpLink as Link,
      ),
    );

    return GraphQLProvider(
      client: client,
      child: CacheProvider(
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: MyHomePage(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ChangeNotifierProvider<Filters>(
          builder: (_) => Filters([], false),
          child: FoodSearch(),
        ),
      ),
    );
  }
}
