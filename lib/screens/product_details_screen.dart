import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mueble_app/models/mueble_model.dart';
import 'package:mueble_app/services/unit_service.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatelessWidget {
   final MuebleModelData muebles;
  const ProductDetailsScreen({Key? key, required this.muebles}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final unitCantidad = Provider.of<UnitService>(context);
    final isActive = Provider.of<UnitService>(context);
    return Scaffold(
      body: Container(
        width: w,
        height: h,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: h * 0.46,
              color: Colors.white,
              child: _CardImg(muebles: muebles,),
              
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20,),
                    Text('${muebles.name}', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),),
                    Row(
                      children: [ 
                        Text('\$${muebles.price}', style:TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF780000), fontSize: 25),), 
                        Spacer(),

                        MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)
                          ),
                          elevation: 0,
                          height: 30,
                          minWidth: 25,
                          child: FaIcon(FontAwesomeIcons.plus, size: 20,),
                          color: Color(0xFFefefef),
                          onPressed: () {
                            unitCantidad.unitSet = unitCantidad.unitGet + 1;
                          },
                          ),
                          SizedBox(width: 10,),
                          Text('${unitCantidad.unitGet}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          SizedBox(width: 10,),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)
                          ),
                          elevation: 0,
                          height: 30,
                          minWidth: 25,
                          child: FaIcon(FontAwesomeIcons.minus, size: 20,),
                          color: Color(0xFFefefef),
                          onPressed: () {
                            unitCantidad.unitSet = unitCantidad.unitGet -1;
                          },
                          ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        Icon(Icons.star_rate_rounded, color: Color(0xFFffb703), size: 30,),
                        Text('${muebles.qualification}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)
                      ],
                    ),
                    SizedBox(height: 20,),
                    Text('${muebles.description}', style: TextStyle(fontSize: 18),),
                    SizedBox(height: 60,),
                    
                    Container(
                      width: double.infinity,
                      height:60,
                      child: Row(
                        children: [
                          MaterialButton(
                            elevation: 0,
                            height: 60,
                            minWidth: 60,
                            color: Color(0xFFefefef),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: (isActive.isActiveGet == false) 
                            ? Icon(Icons.bookmark_border, size: 30,)
                            : Icon(Icons.bookmark, size: 30,),
                            onPressed:() {
                              if (isActive.isActiveGet == false) {
                                isActive.isActiveSet = true;
                              }else if(isActive.isActiveGet == true){
                                isActive.isActiveSet = false;
                              }
                            
                          }, ),
                          Spacer(),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                            ),
                            height: double.infinity,
                            minWidth: 300,
                            color: Colors.black,
                            child: Text('Add to cart', style: TextStyle(color: Colors.white),),
                            onPressed: () {
                            
                          },)
                          
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}


/// _CardImg is a stateless widget that displays a stack of widgets, including a page view builder, a
/// list view builder, and a material button
class _CardImg extends StatelessWidget {

  final MuebleModelData muebles;
  const _CardImg({Key? key, required this.muebles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Positioned(
            right: 0,
            child: Container(
              width: 350,
              height: 330,
              padding: EdgeInsets.only(left: 2, bottom: 2),
              decoration:const BoxDecoration(
                color: Color(0xFFfafafc),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20)
                ),
    
              ),
              child: Container(
                decoration:const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))
                ),
                child: PageView.builder(
                  itemCount: muebles.img.length,
                  itemBuilder:(context, index){
                    return Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Image.asset(muebles.img[index], scale: 1.5,),
                    );
                  } 
                  
                  ),
              ),
            ),
          ),


          Positioned(
            top: 100,
            left:25,
            child: Container(
              height: 170,
              width: 50,
              decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  offset:Offset(1, 1),
                  blurRadius: 4,
                )
              ]),
              child: ListView.builder(
                itemCount: muebles.colors.length,
                itemBuilder:(_, index){
                  return Container(
                    margin: EdgeInsets.only(top: 20),
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                          color: Color(muebles.colors[index]),
                          shape: BoxShape.circle
                          ),
                     );
                  }
              ),
            ),
          ),

          Positioned(
            top: 25,
            left: 20,
            child: MaterialButton(
              elevation: 0,
              height: 40,
              minWidth: 40,
              color: Color(0xFFefefef),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7)
              ),
              child: FaIcon(FontAwesomeIcons.angleLeft, size: 20,),
              onPressed:() {
              Navigator.pop(context);
            }, )
          )
        
        
        ],
      ),
    );
  }
}

