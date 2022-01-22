import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:localtion_app/providers/grate_places_provider.dart';
import 'package:localtion_app/providers/place_form_provider.dart';
import 'package:localtion_app/providers/place_list_provider.dart';

class ProvidersList {
  final List<SingleChildWidget> providers = [
    ChangeNotifierProvider(
      create: (_) => PlaceListProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => PlaceFormProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => GratePlaceProvider(),
    ),
  ];
}
