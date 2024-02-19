import 'package:domotic_ease/core/constant/colors.dart';
import 'package:domotic_ease/core/constant/values_manager.dart';
import 'package:domotic_ease/data/model/rooms_model.dart';
import 'package:domotic_ease/logic/controller/home_controller.dart';
import 'package:domotic_ease/view/widget/home/rooms/room_selector_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListRoomsWidget extends GetView<HomeControllerImp> {
  const ListRoomsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizeH.s120,
      padding: EdgeInsets.symmetric(horizontal: AppSizeW.s5),
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: AppSizeW.s10),
        itemCount: controller.rooms.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Rooms(
            roomsModel: RoomsModel.fromJson(controller.rooms[index]),
          );
        },
      ),
    );
  }
}

class Rooms extends StatelessWidget {
  final RoomsModel roomsModel;
  const Rooms({Key? key, required this.roomsModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizeW.s80,
      height: AppSizeH.s120,
      child: GetBuilder<HomeControllerImp>(
        builder: (controller) => Container(
          child: GestureDetector(
            child: RoomSelector(
              roomName: roomsModel.roomName,
              roomImageURL: 'assets/icons/${roomsModel.image}',
              isSelected: controller.id_room == roomsModel.roomId.toString()
                  ? true
                  : false,
            ),
            onTap: () {
              controller.changeRoom(roomsModel.roomId.toString(),roomsModel.roomName);
            },
          ),
        ),
      ),
    );
  }
}
