import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slicing_ui/app/config/asset_paths.dart';
import 'package:slicing_ui/widgets/inputs/textfield_general.dart';

class SliverSearchBar extends SliverPersistentHeaderDelegate {
  final double height;
  final VoidCallback? onFilterPressed;

  SliverSearchBar({this.height = 68, this.onFilterPressed}); // ↓ lebih kecil

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ), // ↓ no vertical padding
      alignment: Alignment.center,
      child: Row(
        children: [
          // Search Field
          Expanded(
            child: TextFieldGeneral(
              hintText: "Search clothes...",
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: SvgPicture.asset(AssetPaths.iconSearch),
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Filter Button
          GestureDetector(
            onTap: onFilterPressed,
            child: Container(
              padding: EdgeInsets.all(12),
              height: 44,
              width: 44,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(16),
              ),
              child: SvgPicture.asset(AssetPaths.iconFilter),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant SliverSearchBar oldDelegate) => false;
}
