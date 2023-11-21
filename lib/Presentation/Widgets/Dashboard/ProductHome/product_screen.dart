import 'package:stc_health_app/Application/Services/Navigation/navigation.dart';
import 'package:stc_health_app/Data/DataSource/Extensions/extensions.dart';
import 'package:stc_health_app/Data/DataSource/Resources/color.dart';
import 'package:stc_health_app/Data/DataSource/Resources/imports.dart';
import 'package:stc_health_app/Data/DataSource/Resources/strings.dart';
import 'package:stc_health_app/Data/DataSource/Resources/styles.dart';
import 'package:stc_health_app/Presentation/Common/app_text.dart';
import 'package:stc_health_app/Presentation/Common/widget_functions.dart';
import 'package:stc_health_app/Presentation/Widgets/Dashboard/ProductDetail/Controller/Notifier/height_notifier.dart';
import 'package:stc_health_app/Presentation/Widgets/Dashboard/ProductDetail/product_detail.dart';
import 'package:stc_health_app/Presentation/Widgets/Dashboard/ProductHome/Component/CustomAppBar/cutom_product_app_bar.dart';
import 'package:stc_health_app/Presentation/Widgets/Dashboard/ProductHome/Component/card.dart';
import 'package:stc_health_app/Presentation/Widgets/Dashboard/ProductHome/Controller/product_cubit.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    context.read<ProductCubit>().getAllProducts();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.allProducts,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            BlocConsumer<ProductCubit, ProductState>(
              listener: (context, state) {
                if (state is ProductError) {
                  WidgetFunctions.instance.snackBar(
                    context,
                    text: state.error,
                  );
                }
              },
              builder: (context, state) {
                if (state is ProductSuccess) {
                  return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ProductCard(
                          pd: state.product[index],
                          onTap: () {
                            Navigate.to(context,
                                ProductDetail(pd: state.product[index]));
                            HeightNotifier.hNotifier.value = false;
                          },
                        );
                      },
                      separatorBuilder: (context, index) {
                        return 10.y;
                      },
                      itemCount: state.product.length);
                } else if (state is ProductLoading) {
                  return SizedBox(
                      width: 1.sw,
                      height: 1.sh,
                      child: const Padding(
                        padding: EdgeInsets.only(bottom: 38.0),
                        child: Center(child: CircularProgressIndicator()),
                      ));
                } else if (state is ProductError) {
                  return SizedBox(
                      width: 1.sw,
                      height: 1.sh,
                      child: Center(
                          child: AppText(
                        'An Error occured',
                        style: Styles.openSansStdBold(context,
                            color: AppColors.blackColor),
                      )));
                } else {
                  return const SizedBox();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
