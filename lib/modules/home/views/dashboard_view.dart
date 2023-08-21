import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:manajemen_tugas/assets/layout/layout_controller.dart';
import 'package:manajemen_tugas/data/models/task_model.dart';
import 'package:manajemen_tugas/modules/home/controllers/dashboard_controller.dart';
import 'package:manajemen_tugas/routes/app_pages.dart';


class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});
  final layoutC = Get.find<LayoutController>();
  final dashC = Get.find<DashboardController>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        dashC.isMenuVisible.value = false;
      },
      child: Container(
        height: layoutC.screenHeight * 100,
        width: layoutC.screenWidth * 100,
        color: Color(layoutC.colorPalette['biru1']!),
        child: Stack(
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: layoutC.screenWidth * 2),
              child: Container(
                padding: EdgeInsets.only(top: layoutC.screenHeight * 5.5),
                height: layoutC.screenHeight * 100,
                width: layoutC.screenWidth * 100,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(()=>Neumorphic(
                        duration: const Duration(milliseconds: 500),
                        style: NeumorphicStyle(
                          color: Color(layoutC.colorPalette['biru1']!),
                          depth: dashC.depthNeumorphic.value,
                          intensity: 0.8,
                          shape: NeumorphicShape.flat,
                          boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(12.0),
                          ),
                        ),
                        child: SizedBox(
                          height: layoutC.screenHeight * 5,
                          width: layoutC.screenWidth * 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: layoutC.screenHeight * 4,
                                width: layoutC.screenWidth * 80,
                                child: ListView(
                                  controller: dashC.scrollController,
                                  scrollDirection: Axis.horizontal,
                                  children: List.generate(
                                      dashC.categoryNames.length, (index) {
                                    return Obx(() {
                                      return CategoryWidget(
                                        layoutC: layoutC,
                                        title: dashC.categoryNames[index],
                                        colorActive: dashC.selectedCategoryIndex
                                                    .value ==
                                                index
                                            ? Color(
                                                layoutC.colorPalette['biru3']!)
                                            : Colors.grey,
                                        onTap: () =>
                                            dashC.selectCategory(index),
                                      );
                                    });
                                  }),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  dashC.isMenuVisible.toggle();
                                },
                                icon: Icon(
                                  Icons.more_vert_outlined,
                                  color: Color(layoutC.colorPalette['biru4']!),
                                  size: layoutC.screenHeight * 3,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: layoutC.screenHeight * 1,
                    ),
                    Container(
                      height: layoutC.screenHeight * 80,
                      width: layoutC.screenWidth * 90,
                      color: Colors.transparent,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: dashC.obx(
                          (state) {
                            final groupedData = <String, List<TaskModel>>{};
                            for (final task in state!) {
                              if (groupedData.containsKey(task.category)) {
                                groupedData[task.category!]!.add(task);
                              } else {
                                groupedData[task.category!] = [task];
                              }
                            }
                            // Generate UI based on grouped data
                            final uiWidgets =
                                groupedData.entries.map<Widget>((entry) {
                              final category = entry.key;
                              final tasksInCategory = entry.value;
                      
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    category,
                                    style: TextStyle(
                                      color:
                                          Color(layoutC.colorPalette['biru4']!),
                                      fontSize: layoutC.screenHeight * 2.5,
                                    ),
                                  ),
                                  ...tasksInCategory.map((e) {
                                    DateTime date = DateTime.parse(e.tenggatWaktu!);
                                    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
                                    String formattedDate = dateFormat.format(date);
                                    return Container(
                                      margin: const EdgeInsets.only(top: 5),
                                      height: layoutC.screenHeight * 8.5,
                                      width: layoutC.screenWidth * 90,
                                      alignment: Alignment.centerLeft,
                                      decoration: BoxDecoration(
                                          color: Color(
                                              layoutC.colorPalette['biru2']!),
                                          border: Border.all(
                                              color: Color(layoutC
                                                      .colorPalette['biru4']!)
                                                  .withOpacity(0.3),
                                              width: 3),
                                          borderRadius: BorderRadius.circular(5)),
                                      child: ListTile(
                                        contentPadding:
                                            const EdgeInsets.fromLTRB(0, 0, 0, 4),
                                        dense: true,
                                        tileColor:
                                            Color(layoutC.colorPalette['biru2']!),
                                        title: Text(
                                          e.title!,
                                          style: TextStyle(
                                              color: Color(
                                                  layoutC.colorPalette['biru4']!),
                                              fontSize: layoutC.screenHeight * 2),
                                        ),
                                        subtitle: Text(
                                          formattedDate,
                                          style: TextStyle(
                                              color: Color(
                                                  layoutC.colorPalette['biru4']!),
                                              fontSize:
                                                  layoutC.screenHeight * 1.5),
                                        ),
                                        leading: IconButton(
                                            padding: const EdgeInsets.all(0),
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.circle_outlined,
                                              size: layoutC.screenHeight * 2,
                                              color: Color(
                                                  layoutC.colorPalette['biru4']!),
                                            )),
                                      ),
                                    );
                                  }).toList(),
                                ],
                              );
                            }).toList();
                            return Column(
                              children: uiWidgets,
                            );
                          },
                          onLoading:Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: layoutC.screenHeight*40,),
                              Text(
                                "Loading...",
                                style: TextStyle(
                                  color: Color(layoutC.colorPalette['biru4']!),
                                  fontSize: layoutC.screenHeight * 2.5,
                                ),
                              )
                            ],
                          ),
                          onEmpty: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: layoutC.screenHeight*40,),
                              Text(
                                "Belum Ada Tugas",
                                style: TextStyle(
                                  color: Color(layoutC.colorPalette['biru4']!),
                                  fontSize: layoutC.screenHeight * 2.5,
                                ),
                              )
                            ],
                          ),
                          onError: (error) => Text("$error"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              left: layoutC.screenWidth * 60,
              top: layoutC.screenHeight * 10,
              child: Obx(() => Visibility(
                    visible: dashC.isMenuVisible.value,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      height: 75,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Color(layoutC.colorPalette['biru3']!),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          MenuItemWidget(
                              title: 'kelola_kategori'.tr,
                              onTap: () {
                                Get.toNamed(Routes.kelolakategoriPage);
                                dashC.isMenuVisible.value = false;
                              }),
                          const SizedBox(
                            height: 5,
                          ),
                          MenuItemWidget(
                            title: 'telusuri'.tr,
                            onTap: () {
                              final box = GetStorage();
                              print(box.read('categoryData'));
                            },
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key? key,
    required this.layoutC,
    required this.title,
    required this.colorActive,
    required this.onTap,
  }) : super(key: key);

  final LayoutController layoutC;
  final String title;
  final Color colorActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: EdgeInsets.only(left: layoutC.screenWidth * 5),
        height: layoutC.screenHeight * 4,
        width: layoutC.screenWidth * 25,
        decoration: BoxDecoration(
          color: colorActive,
          borderRadius: BorderRadius.circular(layoutC.screenHeight * 4),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontSize: layoutC.screenHeight * 1.7,
                color: Color(layoutC.colorPalette['biru1']!)),
          ),
        ),
      ),
    );
  }
}

class MenuItemWidget extends StatelessWidget {
  const MenuItemWidget({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 25,
      child: GestureDetector(
          onTap: onTap,
          child: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          )),
    );
  }
}
