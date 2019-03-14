# Sorting Algorithms Visulized
Various animations of different sorting algorithms using Processing by Nathan Breunig.
#
## Bubble Sort
### Description:
From [Wikipedia](https://en.wikipedia.org/wiki/Bubble_sort): Bubble sort, sometimes referred to as sinking sort, is a simple sorting algorithm that repeatedly steps through the list, compares adjacent pairs and swaps them if they are in the wrong order. The pass through the list is repeated until the list is sorted. 
### O(n) Performance:
| Best Case | Average Case | Worst Case |
|:---------:|:------------:|:----------:|
| O(n)      | O(n^2)       | O(n^2)     |
### My Bubble Sort Processing Animation: 
|Color |Meaning|
|:----:|:--------------------------------------:|
|White |Unsorted                                |
|Green |Sorted                                  |
|Yellow|Current highest value of unsorted array |
|Blue  |Value being compared to the yellow value|
#### Slow motion sort with 10 items:
![](https://i.imgur.com/nPuNXGu.gif)
#### Sort with 40 items:
![](https://i.imgur.com/dz1hRSK.gif)
#
## Selection Sort
### Description:
From [Wikipedia](https://en.wikipedia.org/wiki/Selection_Sort): The algorithm proceeds by finding the smallest (or largest, depending on sorting order) element in the unsorted sublist, exchanging (swapping) it with the leftmost unsorted element (putting it in sorted order), and moving the sublist boundaries one element to the right.
### O(n) Performance:
| Best Case | Average Case | Worst Case |
|:---------:|:------------:|:----------:|
| O(n^2)      | O(n^2)       | O(n^2)     |
### My Selection Sort Processing Animation: 
|Color |Meaning|
|:----:|:--------------------------------------:|
|White |Unsorted                                |
|Green |Sorted                                  |
|Yellow|Current lowest value of unsorted array  |
|Blue  |Value being compared to the yellow value|
#### Slow motion sort with 10 items:
![](https://i.imgur.com/OKfZ29q.gif)
#### Sort with 40 items:
![](https://i.imgur.com/8qUWd4f.gif)
#
## Insertion Sort
### Description:
From [Wikipedia](https://en.wikipedia.org/wiki/Insertion_sort): Insertion sort is a simple sorting algorithm that builds the final sorted array (or list) one item at a time.
### O(n) Performance:
| Best Case | Average Case | Worst Case |
|:---------:|:------------:|:----------:|
| O(n)      | O(n^2)       | O(n^2)     |
### My Insertion Sort Processing Animation: 
|Color |Meaning|
|:----:|:--------------------------------------:|
|White |Unsorted                                |
|Green |Sorted                                  |
|Yellow|Value being compared to the blue        |
|Blue  |Current item being sorted               |
#### Slow motion sort with 10 items:
![](https://i.imgur.com/uMp0URi.gif)
#### Sort with 40 items:
![](https://i.imgur.com/SJDj0px.gif)
#
#
## Download Interactive Animations
Download the zip file below to be able to customize the animation to your liking. You get to set the number of items to sort as well as play/pause the animation. Enable "Teacher Mode" in order to "step through" the algorithm step by step.  
#### Controls
| Key       | Average Case |
|:---------:|:------------:|
| r      | Restarts the sketch|
| p      | Play/Pause animation|
| t      | Use this key to "step" through each iteration of the algorithm one frame at a time|
#### Downloads for Windows:
[Bubble Sort Download](http://bit.ly/2HiPwtL) <br />
[Selection Sort Download](http://bit.ly/2T7BEno) <br />
[Insertion Sort Download](http://bit.ly/2O73Ju9) <br />
