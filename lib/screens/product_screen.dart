import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mueble_app/models/categories_model.dart';
import 'package:mueble_app/models/mueble_model.dart';
import 'package:mueble_app/screens/screens.dart';
import 'package:mueble_app/services/category_service.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
   
/// _onMueblePressed(MuebleModelData muebles, BuildContext context) async{
/// 
/// }
/// 
/// Args:
///   muebles (MuebleModelData): muebles,
///   context (BuildContext): The current BuildContext.
/// 
/// Returns:
///   A widget.
  _onMueblePressed(MuebleModelData muebles, BuildContext context) async{
    await Navigator.of(context).push( PageRouteBuilder(
      pageBuilder:(context, animation, secondaryAnimation) {
        return FadeTransition(
          opacity: animation,
          child:ProductDetailsScreen(muebles: muebles,), 
          
          );
      } ,));


  }
  
  const ProductScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final opcCa = Provider.of<CategoryService>(context);
    final dataFilterMueble = mueble_data.where((mueble) => mueble.category.startsWith( opcCa.opcCategoryGet )); 

    return Scaffold(
      backgroundColor: Color(0xFFf6f6f6),
      body: SafeArea(
        child: Column(
          children: [
            _HeaderProduct(),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child:  GridView.builder(
                  physics:const BouncingScrollPhysics(),
                  itemCount: dataFilterMueble.length,
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20.0,
                    crossAxisSpacing: 20.0,
                    childAspectRatio: 0.75

                    ) , 
                  itemBuilder:(context,int index){

                    final dataMuebles = mueble_data[index];
                    
                    return  _CardItemProduct(
                      dataMueble: dataMuebles,
                      onTap:(){
                        _onMueblePressed(dataMuebles, context);
                      });
                      
                  }
                  
                  )
            )),

          ],
        )
        
        )
    );
  }
} 

class _CardItemProduct extends StatelessWidget {
  
  final MuebleModelData dataMueble;
  final VoidCallback onTap;
  const _CardItemProduct({Key? key, required this.dataMueble, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap:onTap,
      child: Container(
        padding:const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(dataMueble.img.first),
            Text(dataMueble.name,style:const TextStyle(color:Colors.black, fontSize: 18, fontWeight: FontWeight.w500 ),),
            
            Row(
              children: [
                Text('\$${dataMueble.price}', style:const TextStyle(color: Color(0xFF780000), fontWeight: FontWeight.bold, fontSize: 20),),
                Spacer(),
                Container(
                  width: 25,
                  height: 25,
                  child:Icon(Icons.arrow_forward_rounded, size: 18,),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFFe5cedc)
                    ),
                    borderRadius: BorderRadius.circular(7)
                  ),
                )
    
              ],
            ),
          ],
        ),
      ),
    );

  }
}

class _HeaderProduct extends StatelessWidget {
  const _HeaderProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(left: 25, right: 25, top: 15),
      width: w,
      height: h * 0.25,
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children:const [
              Text('Furniture Co.', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              Spacer(),
              Icon(Icons.shopping_cart_outlined,size: 25,)
            ],
          ),
          SizedBox(height: 15,),
          _SearcHeader(), 
          SizedBox(height: 15,),
          _CategoryItems()

        ],
      ),
    );
  }
}

class _CategoryItems extends StatelessWidget {
  const _CategoryItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data_category = Provider.of<CategoryService>(context).data_category; 
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
      itemCount: data_category.length,
      itemBuilder:(context, index) {
        final categoria = data_category[index];
        return _ItemCategory(
          categorie: categoria,
          );
      }, 
      
      ),
    );
  }
}



class _ItemCategory extends StatelessWidget {

  final Categories categorie;
  const _ItemCategory({Key? key, required this.categorie, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final opcCategory = Provider.of<CategoryService>(context);
    return GestureDetector(
      onTap: () {
        final opcCategory = Provider.of<CategoryService>(context,listen: false);
        opcCategory.opcCategorySet = categorie.category;
          
        
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: (opcCategory.opcCategoryGet == categorie.category) ? Colors.black : Color(0xFFf8f8f8)
        ),
        child: (opcCategory.opcCategoryGet == categorie.category)
        ? Icon(categorie.icon, size: 30, color: Colors.white,)
        : Icon(categorie.icon, size: 25, color: Color(0xFFadb5bd),)
      ),
    );
  }
}


class _SearcHeader extends StatelessWidget {
  
  const _SearcHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width:w,
        height: h*0.06,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFFf8f8f8)
        ),
        child: Row(
          children: [
            Container(
              width: w * 0.75,
              height: double.infinity,
              child:const Align(
                alignment: Alignment.center,
                child: TextField(
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search)
                  ),
                ),
              ),
            ), 
            Expanded(
              child: Container(
                alignment: Alignment.center,
                height: double.infinity,
                color: Colors.black,
                child: FaIcon(FontAwesomeIcons.sliders, color: Colors.white, size: 25,),
              )
              
              )
          ],
        ),
      ),
    );
  }
}