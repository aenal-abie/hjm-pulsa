import 'package:core/component/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class GSListShimmer extends StatefulWidget {
  const GSListShimmer({Key? key}) : super(key: key);

  @override
  State<GSListShimmer> createState() => _GSListShimmerState();
}

class _GSListShimmerState extends State<GSListShimmer> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(),
      itemCount: 10,
      itemBuilder: (context, int key) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[700]!,
            highlightColor: Colors.grey[200]!,
            child: Container(
              height: 90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                        color: neutralColor50.withOpacity(0.1),
                        blurRadius: 0.5,
                        offset: const Offset(0, 1))
                  ]),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: neutralColor50.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: [
                            BoxShadow(
                                color: neutralColor50.withOpacity(0.1),
                                blurRadius: 0.5,
                                offset: const Offset(0, 1))
                          ]),
                      height: 10,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: neutralColor50.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: [
                            BoxShadow(
                                color: neutralColor50.withOpacity(0.1),
                                blurRadius: 0.5,
                                offset: const Offset(0, 1))
                          ]),
                      height: 10,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: neutralColor50.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: [
                            BoxShadow(
                                color: neutralColor50.withOpacity(0.1),
                                blurRadius: 0.5,
                                offset: const Offset(0, 1))
                          ]),
                      height: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
