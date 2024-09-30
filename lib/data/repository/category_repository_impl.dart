import 'package:injectable/injectable.dart';



import '../../domain/Result.dart';
import '../../domain/repository/category_repository.dart';
import '../api_model/Results.dart';
import '../data_source/category_online_data_source.dart';



@Injectable(as: CategoryRepository)

class CategoryRepositoryImpl implements CategoryRepository{
  CategoryOnlineDataSource dataSource;

 @factoryMethod
 CategoryRepositoryImpl(this.dataSource);

  @override
  Future<Result<List<Results>?>> getCategory(String genresId){
      return dataSource.getCategory(genresId);
  }


  }


