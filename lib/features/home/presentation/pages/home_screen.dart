import 'package:CreativeFabrica/features/home/presentation/manager/photos_bloc.dart';
import 'package:CreativeFabrica/features/home/presentation/pages/photo_detail_page.dart';
import 'package:CreativeFabrica/injection.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../widgets/placeholders.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mars Images'),
      ),
      body: BlocProvider<PhotosBloc>(
        create: (_) => serviceLocator<PhotosBloc>()..add(PhotosInitialEvent()),
        child: BlocBuilder<PhotosBloc, PhotosState>(
          builder: (context, state) {
            switch (state.runtimeType) {
              case PhotosResponseState:
                final responseState = state as PhotosResponseState;
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.separated(
                      itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PhotoDetailScreen(
                                    imageURL: responseState
                                        .photosResponse.photos![index].imgSrc!),
                              ));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.blue[200]),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 60,
                                    width: 60,
                                    child: ClipOval(
                                      child: CachedNetworkImage(
                                        fit: BoxFit.fill,
                                        imageUrl: responseState.photosResponse
                                            .photos![index].imgSrc!,
                                        errorWidget: (context, url, error) =>
                                            Image.asset('assets/nasa_logo.jpg'),
                                        progressIndicatorBuilder: (context, url,
                                                progress) =>
                                            const CircularProgressIndicator(),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(responseState.photosResponse
                                      .photos![index].camera!.fullName!),
                                ],
                              ),
                            ),
                          ),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                      itemCount: responseState.photosResponse.photos!.length),
                );
              case PhotosServerErrorState:
                return Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                            '${(state as PhotosServerErrorState).message}\n${(state).statusCode}'),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<PhotosBloc>(context)
                                  .add(RetryPhotoEvent());
                            },
                            child: const Text('Retry'))
                      ],
                    ),
                  ),
                );
              case PhotosInternetErrorState:
                return Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Center(
                    child: Column(
                      children: [
                        Text((state as PhotosInternetErrorState).message),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<PhotosBloc>(context)
                                  .add(RetryPhotoEvent());
                            },
                            child: const Text('Retry'))
                      ],
                    ),
                  ),
                );
            }
            return Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                enabled: true,
                child: const SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(height: 16.0),
                      TitlePlaceholder(width: double.infinity),
                      SizedBox(height: 16.0),
                      ContentPlaceholder(
                        lineType: ContentLineType.threeLines,
                      ),
                      SizedBox(height: 16.0),
                      TitlePlaceholder(width: 200.0),
                      SizedBox(height: 16.0),
                      ContentPlaceholder(
                        lineType: ContentLineType.twoLines,
                      ),
                      SizedBox(height: 16.0),
                      TitlePlaceholder(width: 200.0),
                      SizedBox(height: 16.0),
                      ContentPlaceholder(
                        lineType: ContentLineType.twoLines,
                      ),
                    ],
                  ),
                ));
          },
        ),
      ),
    );
  }
}
