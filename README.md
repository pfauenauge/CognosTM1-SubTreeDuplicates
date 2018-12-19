# CognosTM1-SubTreeDuplicates
In a TM1 Dimension the hierarchy of elements could contain duplicates. Duplicates could be duplicate single elements or duplicate subtrees. 

This repository provides a ready to use, general purpose TI-process for finding duplicates within a subtree in a TM1 Dimension.


# Functions and Options
- Name of dimension
- Element name of subtree root

# Setup
## Option 1

## Option 2

# Example
This example shows a TM1 dimension with a subtree **C1**. Here we want to remove all duplicates within this subtree **C1**. The duplicates are:
1) **N1** is both, directly below **C1** and below **C2** again --> need to remove **N1** below **C2**
2) **N3** is below **C2** and again below the parallel subtree **C3** --> need to remove **N3** below **C3**
3) The subtree **C3** is duplicated below **C3** --> need to remove the entire **C3** subtree (keep ancestors untouched) from **C3**

![TM1TIProcess](https://github.com/pfauenauge/CognosTM1-SubTreeDuplicates/blob/master/TM1-Subtree-example-with-duplicates.png)

To remove all the duplicates execute the process **SubtreeDuplicates_Find**. Specify the parameters for Dimension name and Subtree **C1**

![TM1TIProcess](https://github.com/pfauenauge/CognosTM1-SubTreeDuplicates/blob/master/TM1-Process_SubtreeDuplicates_Find.PNG)

After a successful execution, the subtree is cleaned up:

![TM1TIProcess](https://github.com/pfauenauge/CognosTM1-SubTreeDuplicates/blob/master/TM1-Subtree-duplicates-found-and-removed.png)


