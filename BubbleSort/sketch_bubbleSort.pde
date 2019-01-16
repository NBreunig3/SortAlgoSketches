/** //<>//
Bubble Sort Visualization
By Nathan Breunig
Last Updated: 1/15/19
**/
import processing.sound.*;

SoundFile sound;
float[] values; //Array to sort
int i = 0; int j = 0; //Varibales for the loops within the draw method
int recWidth; int rectangles;
int swaps = 0; int sorted, unsorted; //Variables for stats on the sort
SimpleTimer timer = new SimpleTimer(); //Timer class for timing sort

void setup() {
  size(1400, 800);
  frameRate(60);
  sound = new SoundFile(this, "ding.wav");
  rectangles = 40; //Number of items to sort
  recWidth = width / rectangles; //Width of each rectangle to draw
  values = new float[rectangles];
  
  //Fill array with random values
  for (int i = 0; i < values.length; i++) {
    values[i] = random(height);
  }
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
  text("Bubble Sort Visualization by Nathan Breunig. 1/15/19. ", 10, 25);
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
