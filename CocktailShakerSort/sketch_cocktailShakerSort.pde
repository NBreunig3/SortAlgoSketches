/**
 Cocktail Shaker Sort Visulization
 By Nathan Breunig
 Last Updated: 3/26/19
 **/
import processing.sound.*;
import javax.swing.*;

SoundFile sound;
float[] values; //Array to sort
int lowerBound, upperBound;
int i;
int recWidth; 
int rectangles;
int swaps; 
int sorted, unsorted; //Variables for stats on the sort
SimpleTimer timer = new SimpleTimer(); //Timer class for timing sort
boolean up, down;

void setup() {
  size(1400, 800);
  frameRate(60);
  //reset variables
  lowerBound = 0;
  swaps = 0;
  i = 0;
  sound = new SoundFile(this, "ding.wav");
  up = true;
  down = false;

  //user input
  rectangles = getNumOfRectangles(); //Number of items to sort

  recWidth = width / rectangles; //Width of each rectangle to draw
  values = new float[rectangles];
  upperBound = values.length - 1;

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

  //Draw text/stats
  fill(255);
  textSize(20);
  text("Cocktail Shaker Sort Visualization by Nathan Breunig. 3/26/19. ", 10, 25);
  text("Array Size: " + width/recWidth + ", Sorted: " + sorted + ", Unsorted: " + unsorted, 10, 50);
  text("Swaps: " + swaps, 10, 75);
  text("Time Elapsed: " + timer.getElapsedSec() + " sec", 10, 100);

  //For loop logic within the draw loop
  //Cocktail Shaker sort
  if (lowerBound != upperBound) {
    if (up) {
      drawComparisonRecs(i, i+1);
      if (values[i] > values[i+1]) {
        swap(i, i+1);
        swaps++;
      }
      if (i == upperBound - 1) {
        sound.play();
        up = false;
        down = true;
        upperBound--;
        i = upperBound;
      } else {
        i++;
      }
    } else if (down) {
      drawComparisonRecs(i-1, i);
      if (values[i-1] > values[i]) {
        swap(i, i-1);
        swaps++;
      }
      if (i == lowerBound + 1) {
        sound.play();
        up = true;
        down = false;
        lowerBound++;
        i = lowerBound;
      } else {
        i--;
      }
    }
  } else {
    noLoop();
    print("done");
    fill(0, 128, 0); //Make rectangles green
    stroke(255);
    sorted = values.length;
    unsorted= 0;
    disp();
  }
  if (isSorted()) {
    noLoop();
    print("done");
    fill(0, 128, 0); //Make rectangles green
    stroke(255);
    sorted = values.length;
    unsorted= 0;
    dispFinal();
  }

  sorted = lowerBound + (values.length - upperBound - 1);
  unsorted = values.length - sorted;
}

void dispFinal() {
  background(0);
  //Draw text/stats
  fill(255);
  textSize(20);
  text("Cocktail Shaker Sort Visualization by Nathan Breunig. 3/26/19. ", 10, 25);
  text("Array Size: " + width/recWidth + ", Sorted: " + sorted + ", Unsorted: " + unsorted, 10, 50);
  text("Swaps: " + swaps, 10, 75);
  text("Time Elapsed: " + timer.getElapsedSec() + " sec", 10, 100);
  for (int n = 0; n < values.length; n++) {
    textSize(recWidth / 3);
    //Draw green rectangle is sorted since in correct position
    fill(0, 128, 0);
    rect(n*recWidth, height, recWidth, -values[n]);
    fill(255);
    if (rectangles <= 50) {
      if (height - values[n] + 35 > height) {
        text((int)values[n], n*recWidth, height -values[n]);
      } else {
        text((int)values[n], n*recWidth, height -values[n] + 35);
      }
    }
  }
}

//Draws the rectangles to display the values within the array
void disp() {
  for (int n = 0; n < values.length; n++) {
    textSize(recWidth / 3);
    //Draw white rectangle if unsorted
    if (n == lowerBound && n == upperBound) {
      fill(0, 128, 0);
      rect(n*recWidth, height, recWidth, -values[n]);
      fill(255);
      if (rectangles <= 50) {
        if (height - values[n] + 35 > height) {
          text((int)values[n], n*recWidth, height -values[n]);
        } else {
          text((int)values[n], n*recWidth, height -values[n] + 35);
        }
      }
    } else if (n >= lowerBound && n <= upperBound) {
      fill(255);
      rect(n*recWidth, height, recWidth, -values[n]);
      fill(0);
      if (rectangles <= 50) {
        if (height - values[n] + 35 > height) {
          text((int)values[n], n*recWidth, height - values[n]);
        } else {
          text((int)values[n], n*recWidth, height - values[n] + 35);
        }
      }
    } 
    //Draw green rectangle is sorted since in correct position
    else {
      fill(0, 128, 0);
      rect(n*recWidth, height, recWidth, -values[n]);
      fill(255);
      if (rectangles <= 50) {
        if (height - values[n] + 35 > height) {
          text((int)values[n], n*recWidth, height -values[n]);
        } else {
          text((int)values[n], n*recWidth, height -values[n] + 35);
        }
      }
    }
  }
}

//Draw the two values being compared at each iteration of the for loop
void drawComparisonRecs(int a, int b) {
  textSize(recWidth / 3);
  fill(255, 255, 0);
  rect(a*recWidth, height, recWidth, -values[a]);
  fill(0);
  if (rectangles <= 50) {
    text((int)values[a], a*recWidth, height -values[a] + 35);
  }
  fill(0, 0, 255);
  rect((b)*recWidth, height, recWidth, -values[b]);
  fill(255);
  if (rectangles <= 50) {
    text((int)values[b], (b)*recWidth, height -values[b] + 35);
  }
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

void swap(int index1, int index2) {
  float item1 = values[index1];
  float item2 = values[index2];
  values[index2] = item1;
  values[index1] = item2;
}

boolean isSorted() {
  for (int i = 0; i < values.length - 1; i++) {
    if (values[i] > values[i+1]) {
      return false;
    }
  }
  return true;
}
