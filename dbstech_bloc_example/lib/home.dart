
import 'package:dbstech_bloc_example/app_blocs.dart';
import 'package:dbstech_bloc_example/app_events.dart';
import 'package:dbstech_bloc_example/app_states.dart';
import 'package:dbstech_bloc_example/data_screen.dart';
import 'package:dbstech_bloc_example/repository.dart';
import 'package:dbstech_bloc_example/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(
        RepositoryProvider.of<UserRepository>(context),
      )..add(LoadUserEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('The BLoC App'),
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if(state is UserLoadedState){
              List<UserModel> userList = state.users;
              return ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (_,index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: InkWell(
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                e: userList[index],
                              ),
                            ),
                          );
                        },
                        child: Card(
                          color: Colors.blue,
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                            title: Text(userList[index].firstname, style: const TextStyle(
                                color: Colors.white
                            ),),
                            subtitle: Text(userList[index].lastname, style: const TextStyle(
                                color: Colors.white
                            )),
                            trailing: CircleAvatar(
                              backgroundImage: NetworkImage(userList[index].avatar),
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            }

            if(state is UserErrorState){
              return Center(child:Text("Error"));
            }

            return Container();
          },
        ),
      ),
    );
  }
}