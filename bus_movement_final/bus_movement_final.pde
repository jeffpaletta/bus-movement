float busX;
float circleY;

import java.awt.MouseInfo;
import java.awt.Point;
import spacebrew.*;

String server="sandbox.spacebrew.cc";
String name="TheBussery";
String description ="Client that sends and receives string messages.";

Spacebrew sb;

// Keep track of our current place in the range
String local_string = "";
String remote_string  = "Say Something";
String last_string = "";

void setup(){
//  fullScreen(1);
  frameRate(60);
  fullScreen();
  noCursor();
 
  // instantiate the spacebrewConnection variable
  sb = new Spacebrew( this );

  // for computer
  sb.addSubscribe( "say_something", "string" );

  // connect!
  sb.connect(server, name, description );
}

float mapMouse = 0;

void draw(){
  background(0);
  
  pushMatrix();
      textAlign(LEFT);
      translate(500, 300);
      rotate( radians(180) );
      
      textSize(30);
      fill(255);
      text("tell your coworkers something", -1008, -15);
      
      fill(1, 200, 255);
      textSize(20);
      text("go to  bit.ly/thebussery  to post", -1000, 15);
      
  popMatrix();
  
  noCursor();
  
  Point mouse;
  mouse = MouseInfo.getPointerInfo().getLocation();
  
  mapMouse = map(mouse.x, 5500, 0, width, 0);
  
  pushMatrix();
      noCursor();
      fill(255);
      textAlign(LEFT);
      translate(mapMouse, 620);
      rotate( radians(180) );
      textSize(50);
      text(remote_string, -150, -10);
      
  popMatrix();
  
//  fill (0);
//rect(0, 580, 220, 80);
}

//void keyPressed() {
//  if (key != CODED) {
//    if (key == DELETE || key == BACKSPACE) {
//      if (remote_string.length() - 1 >= 0) {
//        remote_string = remote_string.substring(0, (remote_string.length() - 1));  
//      }
//    }

//    else if (key == ENTER || key == RETURN) {
//      sb.send("listen_to_me", remote_string);
//      last_string = remote_string;
//      remote_string = remote_string.substring(0, 10);  
//    } 

//    else {
//      if (remote_string.length() > 5) {
//        remote_string = remote_string.substring(0, 9);
//      }
//    }
//  } 
//}

void onStringMessage( String name, String value ){
  println("got string message " + name + " : " + value);
  remote_string = value;
  
  if ( remote_string.length() >= 15 ){
    remote_string = remote_string.substring(0, 15) +"...";
  }
}