/** //<>//
 Bubble Sort Visualization
 By Nathan Breunig
 Last Updated: 1/23/19
 **/
import processing.sound.*;
import javax.swing.*;

SoundFile sound;
float[] values; //Array to sort
int i; 
int j; //Varibales for the loops within the draw method
int recWidth; 
int rectangles;
int swaps; 
int sorted, unsorted; //Variables for stats on the sort
SimpleTimer timer = new SimpleTimer(); //Timer class for timing sort
boolean teacherMode, looping;

void setup() {
  size(1400, 800);
  frameRate(60);
  //reset variables
  i = 0; 
  j = 0; 
  swaps = 0;
  sound = new SoundFile(this, "ding.wav");

  //user input
  rectangles = getNumOfRectangles(); //Number of items to sort
  teacherMode = isTeacherMode();

  recWidth = width / rectangles; //Width of each rectangle to draw
  values = new float[rectangles];

  //Fill array with random values
  for (int i = 0; i < values.length; i++) {
    values[i] = random(height);
  }
  looping = true;
  timer.start();
}

void draw() {
  //Initial Setup of frame
  background(0);
  stroke(150);
  strokeWeight(2);
  fill(255);

  //Draw the visualization of the array at its current state
  disp();

  //Update sorted and unsorted values
  sorted = i;
  unsorted = values.length - i;

  //Draw text/stats
  fill(255);
  textSize(20);
  text("Bubble Sort Visualization by Nathan Breunig. 1/23/19. ", 10, 25);
  text("Array Size: " + width/recWidth + ", Sorted: " + sorted + ", Unsorted: " + unsorted, 10, 50);
  text("Swaps: " + swaps, 10, 75);
  text("Time Elapsed: " + timer.getElapsedSec() + " sec", 10, 100);

  //For loop logic within the draw loop
  //Bubble sort
  if (i < values.length) {
    //Draw j and j+1 in different colors to visualize which elements are currently being compared
    drawJRect(j);
    if (values[j] > values[j+1]) {
      //Swap the values
      swaps++;
      float temp = values[j]; 
      values[j] = values[j+1]; 
      values[j+1] = temp;
    }
    j++;
    if (j >= values.length-i-1) {
      j = 0;
      i++;
      sound.play();
    }
  } else {
    noLoop();
    fill(0, 128, 0); //Make rectangles green
    stroke(255);
    disp();
  }

  if (teacherMode) {
    noLoop();
  }
}

//Draws the rectangles to display the values within the array
void disp() {
  for (int n = 0; n < values.length; n++) {
    textSize(recWidth / 3);
    //Draw white rectangle if unsorted
    if (n < values.length - i) {
      fill(255);
      rect(n*recWidth, height, recWidth, -values[n]);
      fill(0);
      text((int)values[n], n*recWidth, height - values[n] + 35);
    } 
    //Draw green rectangle is sorted since in correct position
    else {
      fill(0, 128, 0);
      rect(n*recWidth, height, recWidth, -values[n]);
      fill(255);
      text((int)values[n], n*recWidth, height -values[n] + 35);
    }
  }
}

//Draw the two values being compared at each iteration of the for loop
void drawJRect(int j) {
  textSize(recWidth / 3);
  fill(255, 255, 0);
  rect(j*recWidth, height, recWidth, -values[j]);
  fill(0);
  text((int)values[j], j*recWidth, height -values[j] + 35);
  fill(0, 0, 255);
  rect((j+1)*recWidth, height, recWidth, -values[j+1]);
  fill(255);
  text((int)values[j+1], (j+1)*recWidth, height -values[j+1] + 35);
}

//User input from # of items to sort
int getNumOfRectangles() {
  String strNum = "";
  int num = 50;

  do {
    strNum = JOptionPane.showInputDialog(null, "Enter the number of items to sort (between 10 and 100)", "Enter a value", JOptionPane.INFORMATION_MESSAGE);
    if (strNum != null) {
      num = Integer.parseInt(strNum);
    }
  } while (num < 10 || num > 100);
  return num;
}

void keyPressed() {
  if (key == 'r') {
    //restart sketch
    setup();
    loop();
  } else if (key == 't' && teacherMode) {
    loop();
  } else if (key == 's') {
    if (looping) {
      noLoop();
      looping = false;
    } else {
      loop();
      looping = true;
    }
  }
}

//User input for teacher mode
boolean isTeacherMode() {
  if (JOptionPane.showConfirmDialog(null, "Enable Teacher Mode?", "Teacher Mode?", JOptionPane.YES_NO_OPTION) == JOptionPane.YES_OPTION) {
    noLoop();
    return true;
  } else {
    return false;
  }
}
