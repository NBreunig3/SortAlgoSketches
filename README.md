# Sorting Algorithms Visulized
Various animations of different sorting algorithms using [Processing](https://www.processing.org) by Nathan Breunig.
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
## Cocktail Shaker Sort
### Description:
From [Wikipedia](https://en.wikipedia.org/wiki/Cocktail_shaker_sort): Cocktail shaker sort, also known as bidirectional bubble sort, cocktail sort, shaker sort (which can also refer to a variant of selection sort), ripple sort, shuffle sort, or shuttle sort, is a variation of bubble sort that is both a stable sorting algorithm and a comparison sort. The algorithm differs from a bubble sort in that it sorts in both directions on each pass through the list.
### O(n) Performance:
| Best Case | Average Case | Worst Case |
|:---------:|:------------:|:----------:|
| O(n)      | O(n^2)       | O(n^2)     |
### My Cocktail Shaker Sort Processing Animation: 
|Color |Meaning|
|:----:|:--------------------------------------:|
|White |Unsorted                                |
|Green |Sorted                                  |
|Yellow & Blue|Values being compared and swapped if needed |
#### Slow motion sort with 10 items:
![](https://i.imgur.com/lGfpnCC.gif)
#### Sort with 40 items:
![](https://i.imgur.com/aznuFsN.gif)
#
