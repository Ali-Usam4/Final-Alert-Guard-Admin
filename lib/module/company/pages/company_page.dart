import 'package:final_alert_guard_admin/utils/extensions/extended_context.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/asset_paths.dart';
import '../../../ui/widgets/base_scaffold.dart';
import '../../../ui/widgets/circular_cached_image.dart';

class CompanyPage extends StatefulWidget {
  const CompanyPage({super.key});

  @override
  State<CompanyPage> createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  bool isEditModeEnabled = true;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return BaseScaffold(
        body: SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: width * 0.06, vertical: height * 0.01),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 2,
                    child: Text(
                      'Manager & Company',
                      textAlign: TextAlign.center,
                      style: context.textTheme.titleSmall?.copyWith(
                        color: Colors.black,
                      ),
                    )),
                const SizedBox(
                  height: 12,
                ),
                Expanded(
                    flex: 2,
                    child: Text(
                      'Email',
                      textAlign: TextAlign.center,
                      style: context.textTheme.titleSmall?.copyWith(
                        color: Colors.black,
                      ),
                    )),
                const SizedBox(
                  height: 12,
                ),
                Expanded(
                    flex: 2,
                    child: Text(
                      'Address',
                      textAlign: TextAlign.center,
                      style: context.textTheme.titleSmall?.copyWith(
                        color: Colors.black,
                      ),
                    )),
                const SizedBox(
                  height: 12,
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'PIN',
                    textAlign: TextAlign.center,
                    style: context.textTheme.titleSmall?.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListView.separated(
            padding: const EdgeInsets.only(bottom: 16),
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                color: AppColors.lightGrey,
              );
            },
            itemCount: 6,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              //PackageModel package = state.packagesData.docs[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: ListTile(
                        leading: const SizedBox(
                          height: 60,
                          width: 60,
                          child: CircularCachedImage(
                            borderRadius: 4,
                            imageUrl: '',
                            errorPath: AssetPaths.placeholder,
                          ),
                        ),
                        title: Text(
                          'Company Name',
                          style: context.textTheme.titleMedium?.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.secondary,
                          ),
                        ),
                        subtitle: Text(
                          'Manager Name',
                          style: context.textTheme.bodySmall,
                        ),
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Expanded(
                        flex: 2,
                        child: Text(
                          'debra.holt@example.com',
                          style: context.textTheme.bodyMedium,
                        )),
                    const SizedBox(
                      height: 12,
                    ),
                    Expanded(
                        flex: 2,
                        child: Text(
                          '4140 Parker Rd. Allentown, New Mexico 31134',
                          style: context.textTheme.bodyMedium,
                        )),
                    const SizedBox(
                      height: 12,
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        '12wda3423',
                        style: context.textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          // Pagination(
          //   totalDocs: state.packagesData.totalDocs,
          //   limit: state.packagesData.limit,
          //   totalPages: state.packagesData.totalPages,
          //   page: state.packagesData.page,
          //   pagingCounter: state.packagesData.pagingCounter,
          //   hasPrevPage: state.packagesData.hasPrevPage,
          //   hasNextPage: state.packagesData.hasNextPage,
          //   onPageChanged: (currentPage) {
          //     context
          //         .read<PackagesCubit>()
          //         .getPackages(searchQuery: searchQuery, loading: false, status: selectedStatus.toLowerCase(), page: currentPage);
          //   },
          // ),
        ],
      ),
    ));
  }
}
