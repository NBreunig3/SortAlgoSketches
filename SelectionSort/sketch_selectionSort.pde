/**
 Selection Sort Visulization
 By Nathan Breunig
 Last Updated: 1/15/19
 **/

float[] values; //Array to sort
int i = 0; 
int j = 0; //For for loop logic
int recWidth; 
int rectangles; 
int swaps; 
int sorted; 
int unsorted; //Variables for stats on sort
SimpleTimer timer = new SimpleTimer(); //Timer class for timing the algorithm
int smallestIndex = 0;

void setup() {
  size(1400, 800);
  frameRate(60);
  rectangles= 40;
  recWidth = width / rectangles;
  values = new float[rectangles];

  //Fill array with random values
  for (int i = 0; i < values.length; i++) {
    values[i] = random(height);
  }
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
  text("Selection Sort Visualization by Nathan Breunig. 1/15/19. ", 10, 25);
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
}

void disp() {
  textSize(recWidth / 3);
  for (int n = 0; n < values.length; n++) {
    if (n >= i) {
      fill(255);
      rect(n*recWidth, height, recWidth, -values[n]);
      fill(0);
      text((int)values[n], (n*recWidth), height - values[n] + 20);
    } else {
      //draw green
      fill(0, 128, 0); //Make rectangles green
      rect(n*recWidth, height, recWidth, -values[n]);
      fill(255);
      text((int)values[n], (n*recWidth), height - values[n] + 20);
    }
  }
}

void drawComparisonRectangles(int j, int smallest) {
  textSize(recWidth / 3);
  fill(0, 0, 255);
  rect(j*recWidth, height, recWidth, -values[j]);
  fill(255);
  text((int)values[j], (j*recWidth), height - values[j] + 20);
  fill(255, 255, 0);
  rect(smallest*recWidth, height, recWidth, -values[smallest]);
  fill(0);
  text((int)values[smallest], (smallest*recWidth)+5, height - values[smallest] + 20);
}

void swap(int i1, int i2) {
  float temp = values[i1];
  values[i1] = values[i2];
  values[i2] = temp;
}
