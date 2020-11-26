import 'package:flutter/material.dart';

class Reader extends StatefulWidget {
  @override
  _ReaderState createState() => _ReaderState();
}

class _ReaderState extends State<Reader> {

  void setUpReader(String url){
    
  }
  String demostring = //dummy string here, wish to replace it with the text we get from the scraper
      '''   Million years later, the Chaos Sea is calm and tranquil. Knowing that one day, someone who is detached will pass through the life forbidden zone to the Chaos Sea, Yang Xuan reappears in front of everyone.

        He is too strong, even facing the depths of the restricted area, those from the so-called Supreme Secret Realm can easily be killed.

        On that day, all the detached people from the restricted area of ​​life were killed by him alone, and the sky was bloody.

        After this battle, no one dares to ignore Dao Ting, Dao Ting has also become the most powerful force in the chaotic sea. Every day there will be many cultivators and taboo creatures who choose to join Dao Ting.

        For a time, there are countless experts gathering like clouds in the Taoist court.

        This scene has never happened in the past, and it will be difficult to reproduce in the future.

        Yang Xuan didn’t care about this.

        All day long, I spent the whole day mingling with the girls, and I never thought about leading them to fight in various life restricted areas.

        In the depths of the life forbidden zone, there are channels leading to the Supreme Secret Realm. As long as you cross the past, you will be a Supreme Secret Realm. Some of them are long gone, and even the main road is not visible.

        Some Supreme is grand and prosperous, and a large number of detached people gather.

        But all this has nothing to do with Yang Xuan. His cultivation base has reached the extreme of transcendence a few years ago. However, the way forward has been cut off. Since ancient times, there seems to be no one. Beyond Supreme.

        “Daddy, come soon!”

        “Hehe, Daddy is in a daze again. Mom is right, Daddy is a fool.”

        “Okay Ah, you group of Little Brat dare to scold Dad, let’s see if Dad doesn’t fix your meal today!”

        In the Dao Palace Small World in the depths of the Taoist court, Yang Xuan chases and fights with his children After making trouble and playing together, after reaching the extreme of detachment and seeing that the road has been broken, he and his daughters began to make people.

        Among the women, almost every woman gave birth to a child with him. The oldest child is now an adult, going to the Chaos Realm under the sea of ​​chaos to experience.

        Not far away, Qin Lan and the other women saw Yang Xuan playing like an ordinary person, playing with a group of children, and they all showed a knowing smile on their faces.

        This kind of day is the day they want to live, and they are very satisfied with it.

        PS: Because of various things, this book ends here. How to say it, a little relief, and some disappointments. After all, this book has undergone several rectifications and was blocked. For a period of time, so even my heart was burned out later, and the later writing was really unsatisfactory. I can only say sorry to the brothers and sisters. 
      ''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Text(
            '$demostring',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
