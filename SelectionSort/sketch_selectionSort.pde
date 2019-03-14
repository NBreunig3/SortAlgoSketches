/**
 Selection Sort Visulization
 By Nathan Breunig
 Last Updated: 1/23/19
 **/
import processing.sound.*;
import javax.swing.*;

SoundFile sound;
float[] values; //Array to sort
boolean looping, teacherMode;
int i; 
int j; //For for loop logic inside draw loop
int recWidth; 
int rectangles; 
int swaps; 
int sorted; 
int unsorted; //Variables for stats on sort
SimpleTimer timer = new SimpleTimer(); //Timer class for timing the algorithm
int smallestIndex; //Use for selection sort algorithm

void setup() {
  size(1400, 800);
  background(0);
  frameRate(60);
  //reset variables
  i = 0;
  j = 0;
  smallestIndex = 0;
  sound = new SoundFile(this, "ding.wav");
  teacherMode = false;
  //User Input
  rectangles= getNumOfRectangles();
  recWidth = width / rectangles; //width of each rectangle
  values = new float[rectangles];

  //Fill array with random values
  for (int i = 0; i < values.length; i++) {
    values[i] = random(height);
  }
  looping = true;
  timer.start();
}

void draw() {
  //Setup window
  background(0);
  stroke(150);
  strokeWeight(2);
  fill(255);

  //Draw array
  disp();

  //Update sorted and unsorted values
  sorted = i;
  unsorted = values.length - i;

  //Draw text/stats
  fill(255);
  textSize(20);
  text("Selection Sort Visualization by Nathan Breunig. 1/23/19. ", 10, 25);
  text("Array Size: " + width/recWidth + ", Sorted: " + sorted + ", Unsorted: " + unsorted, 10, 50);
  text("Swaps: " + swaps, 10, 75);
  text("Time Elapsed: " + timer.getElapsedSec() + " sec", 10, 100);

  //Selection Sort
  if (i < values.length) {
    if (j < values.length) {
      drawComparisonRectangles(j, smallestIndex);
      if (values[j] < values[smallestIndex]) {
        smallestIndex = j;
      }
      j++;
    } else {
      swap(i, smallestIndex);
      sound.play();
      swaps++;
      i++;
      j = i + 1;
      smallestIndex = i;
    }
  } else {
    noLoop();
    stroke(255);
    disp();
  }

  if (teacherMode) {
    noLoop();
  }
}

//Draws the rectangles to display the values within the array
void disp() {
  textSize(recWidth / 3);
  for (int n = 0; n < values.length; n++) {
    if (n >= i) {
      fill(255);
      rect(n*recWidth, height, recWidth, -values[n]);
      if (rectangles <= 50) {
        fill(0);
        text((int)values[n], (n*recWidth), height - values[n] + 20);
      }
    } else {
      //draw green
      fill(0, 128, 0); //Make rectangles green
      rect(n*recWidth, height, recWidth, -values[n]);
      if (rectangles <= 50) {
        fill(255);
        text((int)values[n], (n*recWidth), height - values[n] + 20);
      }
    }
  }
}

//Draw the two values being compared at each iteration of the for loop
void drawComparisonRectangles(int j, int smallest) {
  textSize(recWidth / 3);
  fill(0, 0, 255);
  rect(j*recWidth, height, recWidth, -values[j]);
  if (rectangles <= 50) {
    fill(255);
    text((int)values[j], (j*recWidth), height - values[j] + 20);
  }
  fill(255, 255, 0);
  rect(smallest*recWidth, height, recWidth, -values[smallest]);
  if (rectangles <= 50) {
    fill(0);
    text((int)values[smallest], (smallest*recWidth), height - values[smallest] + 20);
  }
}

//Swapping two items in an array
//Used for the selection sort algorithm
void swap(int i1, int i2) {
  float temp = values[i1];
  values[i1] = values[i2];
  values[i2] = temp;
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
  } else if (key == 't') {
    if(teacherMode){
      loop();
    }else{
      noLoop();
      teacherMode = true;
    }
  } else if (key == 'p') {
    if (looping) {
      noLoop();
      looping = false;
    } else {
      loop();
      looping = true;
    }
  }
}
