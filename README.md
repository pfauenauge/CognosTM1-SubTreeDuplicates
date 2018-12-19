# CognosTM1-SubTreeDuplicates
In a TM1 Dimension the hierarchy of elements could contain duplicates. Duplicates could be duplicate single elements or duplicate subtrees. 

This repository provides a ready to use, general purpose TI-process for finding duplicates within a subtree in a TM1 Dimension. Elements are never deleted. Only the relation of an element to a parent is disconnected.

# Functions and Options
- Name of dimension
- Element name of subtree root
- Delete duplicates(=1), otherwise elements are not removed from consolidation
- Temporary Subset: Only need to change this in case of name collisions
- Subset name where the found duplicate elements are stored. You can use it to post-process the changes made to the dimension
- Keep subset with duplicates (=1). If you don't need the subset of duplicate elements, the process will delete it at the end (=0)
- Last process parameter: **Don't change it!**

# Setup
## Option 1 (preferred)
Copy file [SubtreeDuplicates_Find.pro](https://github.com/pfauenauge/CognosTM1-SubTreeDuplicates/blob/master/SubtreeDuplicates_Find.pro) to your TM1 data directory and restart the TM1 server

## Option 2
- Create a new TM1 process
- Define the sections in the process based on the description in [SubtreeDuplicates_Find.txt](https://github.com/pfauenauge/CognosTM1-SubTreeDuplicates/blob/master/SubtreeDuplicates_Find.txt)
- Save process with any name you like

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


