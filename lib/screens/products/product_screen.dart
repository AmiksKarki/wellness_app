import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_wellness_app/screens/products/model/product_model.dart';

class ProductScreen extends StatefulWidget{

  const ProductScreen({super.key});
  @override
  State<ProductScreen> createState() => _ProductScreenState();

}
class _ProductScreenState extends State<ProductScreen>{
  bool _isLoading = true;
  List<ProductModel> _productList=[];

  void _fetchProduct()async{
    setState(() {
      _isLoading= true;
    });
    try {
      final Dio dio = Dio();
      Response<dynamic> response = await dio.get(
          'https://dummyjson.com/products'
      );
      if (response.statusCode == 200) {
        List<dynamic> dynamicList = response.data["products"];
        _productList =
            dynamicList.map((e) => ProductModel.fromJson(e)).toList();
      }
    }
    catch (e){
      print("error while fetching the product");
      rethrow;
    }
    setState(() {
      _isLoading=false;
    });
  }

  @override
  void initState() {
  _fetchProduct();
  super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Products',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : _productList.isEmpty
              ? Center(
                  child: Text(
                    'No products available',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                    ),
                  ),
                )
              : Padding(
                  padding: EdgeInsets.all(16.w),
                  child: ListView.builder(
                    itemCount: _productList.length,
                    itemBuilder: (ctx, i) {
                      ProductModel productModel = _productList[i];
                      return Container(
                        margin: EdgeInsets.only(bottom: 12.h),
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2A2A2A),
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: Colors.grey.shade800,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Product thumbnail
                                Container(
                                  width: 60.w,
                                  height: 60.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    color: Colors.grey.shade700,
                                  ),
                                  child: productModel.thumbnail != null
                                      ? ClipRRect(
                                          borderRadius: BorderRadius.circular(8.r),
                                          child: Image.network(
                                            productModel.thumbnail!,
                                            fit: BoxFit.cover,
                                            errorBuilder: (context, error, stackTrace) {
                                              return Icon(
                                                Icons.image_not_supported,
                                                color: Colors.grey,
                                                size: 24.w,
                                              );
                                            },
                                          ),
                                        )
                                      : Icon(
                                          Icons.image_not_supported,
                                          color: Colors.grey,
                                          size: 24.w,
                                        ),
                                ),
                                SizedBox(width: 12.w),
                                // Product details
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        productModel.title ?? 'No title',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 4.h),
                                      Text(
                                        productModel.category ?? 'No category',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 13.sp,
                                        ),
                                      ),
                                      SizedBox(height: 8.h),
                                      Row(
                                        children: [
                                          if (productModel.price != null)
                                            Text(
                                              '\$${productModel.price!.toStringAsFixed(2)}',
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          SizedBox(width: 8.w),
                                          if (productModel.rating != null) ...[
                                            Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 16.w,
                                            ),
                                            SizedBox(width: 4.w),
                                            Text(
                                              productModel.rating!.toStringAsFixed(1),
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13.sp,
                                              ),
                                            ),
                                          ],
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            if (productModel.description != null) ...[
                              SizedBox(height: 12.h),
                              Text(
                                productModel.description!,
                                style: TextStyle(
                                  color: Colors.grey.shade300,
                                  fontSize: 14.sp,
                                  height: 1.4,
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ],
                        ),
                      );
                    },
                  ),
                ),
    );
  }
}