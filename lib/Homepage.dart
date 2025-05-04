
import 'package:ecomarce/model/modelecomarce.dart';
import 'package:ecomarce/service/serviceecomarce.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  Tween<double> tween = Tween(begin: 0.2, end: 1.0);
  final QuizService quizService = QuizService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
        actions: [
          Column(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
              Text("My basket"),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text(
                "Hello Tony,",
                style: TextStyle(
                  fontSize: MediaQuery.sizeOf(context).height * 0.022,
                ),
              ),
              Text(
                " What fruit salad ",
                style: TextStyle(
                  fontSize: MediaQuery.sizeOf(context).height * 0.028,
                ),
              ),
            ],
          ),

          Row(
            children: [
              Text(
                "combo do you want today?",
                style: TextStyle(
                  fontSize: MediaQuery.sizeOf(context).height * 0.025,
                ),
              ),
            ],
          ),
          TweenAnimationBuilder(
            tween: tween,
            duration: Duration(seconds: 4),
            builder: (context, value, child) {
              return Opacity(
                opacity: value,
                child: Padding(
                  padding: EdgeInsets.all(value * 20),
                  child: Text(
                    "Recommended Combo",
                    style: TextStyle(fontSize: value * 25),
                  ),
                ),
              );
            },
          ),

          FutureBuilder<List<modelecomarce>>(
            future: quizService.getAlleMeal(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("حدث خطأ: ${snapshot.error}"));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text("لا توجد وجبات"));
              }

              final meals = snapshot.data!;
              return SizedBox(
                // width: MediaQuery.sizeOf(context).width * 152 / 372,
                height: 400,
                // height: MediaQuery.sizeOf(context).height * 183 / 812,
                child: GridView.builder(
                  padding: const EdgeInsets.all(12),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: meals.length,
                  itemBuilder: (context, index) {
                    final meal = meals[index];
                    return Card(
                      elevation: 3,
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.network(
                              meal.strMealThumb,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              meal.strMeal,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
