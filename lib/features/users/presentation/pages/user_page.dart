import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/posts_bloc.dart';
import '../bloc/user_bloc.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Users & Posts'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Users'),
              Tab(text: 'Posts'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Users List
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is UserLoaded) {
                  return ListView.builder(
                    itemCount: state.users.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.users[index].name),
                        subtitle: Text(state.users[index].email),
                      );
                    },
                  );
                } else if (state is UserError) {
                  return Center(child: Text(state.message));
                }
                return Center(child: Text('Press the button to load users'));
              },
            ),

            // Posts List
            BlocBuilder<PostsBloc, PostsState>(
              builder: (context, state) {
                if (state is PostsLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is PostsLoaded) {
                  return ListView.builder(
                    itemCount: state.post.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text({state.post[index].userId}.toString()),
                        title: Text({state.post[index].title}.toString()),
                        subtitle: Text({state.post[index].body}.toString()),
                      );
                    },
                  );
                } else if (state is PostsFailed) {
                  return Center(child: Text(state.message));
                }
                return Center(child: Text('Press the button to load posts'));
              },
            ),
          ],
        ),

        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'users',
              onPressed: () => context.read<UserBloc>().add(LoadUsers()),
              child: Icon(Icons.person),
            ),
            SizedBox(height: 10),
            FloatingActionButton(
              heroTag: 'posts',
              onPressed: () => context.read<PostsBloc>().add(LoadPost()),
              child: Icon(Icons.article),
            ),
          ],
        ),
      ),
    );
  }
}
