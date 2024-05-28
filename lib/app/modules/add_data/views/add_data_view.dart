import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/colors.dart';
import '../../../widgets/button_widget.dart';
import '../controllers/add_data_controller.dart';

class AddDataView extends GetView<AddDataController> {
  const AddDataView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Data'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 2, color: AppColors.primary),
            ),
            alignment: Alignment.center,
            width: 350,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                const SizedBox(
                  height: 30,
                  child: Text(
                    'URL Youtube',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 45,
                  child: TextFormField(
                    controller: controller.TFUrl,
                    style: const TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                      hintText: 'Contoh : https://www.youtube.com/watch?v=3qjDC6H_X-M',
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 10),
                      fillColor: Colors.grey.shade600,
                      filled: false,
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20,),
                    const SizedBox(
                      height: 30,
                      child: Text(
                        'Tanggal Kejadian',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 45,
                      child: TextFormField(
                        onTap: ()=> controller.pickDate(),
                        readOnly: true,
                        controller: controller.TFDate,
                        style: const TextStyle(fontSize: 15),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 10),
                          fillColor: Colors.grey.shade600,
                          filled: false,
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ),
                      ),
                    ),

                const SizedBox(height: 20,),
                const SizedBox(
                  height: 30,
                  child: Text(
                    'Nomor Plat',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),

                SizedBox(
                  height: 45,
                  child: TextFormField(
                    controller: controller.TFPlat,
                    style: const TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                      hintText: 'Contoh : B 6708 WJF',
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 10),
                      fillColor: Colors.grey.shade600,
                      filled: false,
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20,),
                const SizedBox(
                  height: 30,
                  child: Text(
                    'Lokasi Kejadian',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),

                TextFormField(
                  maxLines: 2,
                  maxLength: 100,
                  controller: controller.TFLocation,
                  style: const TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    fillColor: Colors.grey.shade600,
                    filled: false,
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 30,
                  child: Text(
                    'Kronologi (Opsional)',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),

                TextFormField(
                  maxLines: 3,
                  maxLength: 200,
                  controller: controller.TFKronologi,
                  style: const TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    hintText: 'Makasimal 200 karakter',
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    fillColor: Colors.grey.shade600,
                    filled: false,
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30,),
                ButtonWidget(
                    width: 200,
                    title: 'Add Data',
                    onTap: (){
                      controller.createData();
                      // Navigator.pop(context);
                    }),
                const SizedBox(height: 30,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
