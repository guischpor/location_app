import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:localtion_app/providers/great_places_provider.dart';

class ProvidersList {
  final List<SingleChildWidget> providers = [
    ChangeNotifierProvider(
      create: (_) => GreatPlaceProvider(),
    ),
  ];
}
