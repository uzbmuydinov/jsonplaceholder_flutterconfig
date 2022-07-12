import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:jsonplaceholder_flutterconfig/controller/home_controller.dart';
import 'package:jsonplaceholder_flutterconfig/pages/edit_page.dart';
import 'package:jsonplaceholder_flutterconfig/services/constants/app_colors.dart';

class HomePage extends StatefulWidget {
  static String id = "HomePage";

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<HomeController>().apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.colorGrey,
        appBar: AppBar(
          elevation: 0.3,
          title: Text(
            FlutterConfig.get('BASE_NAME'),
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: AppColors.mainColorOrange,
          centerTitle: true,
        ),
        body: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (HomeController controller) => Stack(
            children: [
              ListView.builder(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  padding: const EdgeInsets.only(bottom: 18),
                  itemCount: controller.items.length,
                  itemBuilder: (context, index) {
                    return Slidable(
                      //for delete
                      startActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            //padding: const EdgeInsets.only(bottom: 18),
                            onPressed: (context) {
                              controller.apiPostDelete(controller.items[index]);
                            },
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: "Delete",
                          ),
                        ],
                      ),
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (BuildContext context) async {
                              Get.to(
                                  () => EditPage(
                                        post: controller.items[index],
                                      ),
                                  transition: Transition.rightToLeftWithFade,
                                  duration: const Duration(milliseconds: 300));
                            },
                            backgroundColor: AppColors.mainColorOrange,
                            foregroundColor: Colors.white,
                            icon: Icons.edit,
                            label: "Edit",
                          ),
                        ],
                      ),
                      child: Container(
                        margin: EdgeInsets.only(top: 15, left: 7, right: 7),
                        decoration: BoxDecoration(
                            color: AppColors.mainWhiteColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: ExpansionTile(
                          title: Text(controller.items[index].title,
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Poppins")),
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                controller.items[index].body,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontFamily: "Poppins",
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
              controller.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white70,
          foregroundColor: Colors.black,
          onPressed: () {
            Get.find<HomeController>().goToCreatePage(context);
            //Get.changeTheme(ThemeData.dark());
          },
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ));
  }
}
