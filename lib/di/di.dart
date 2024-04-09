import 'package:get_it/get_it.dart';
import 'package:hotel_app/remote/service/di.dart';
import 'package:hotel_app/repository/di.dart';

GetIt getIt = GetIt.instance;
void setupDependeciesInjection() {
  serviceModule(); 
  repoModule();
}