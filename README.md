# Brain-Tumor-Detection-Using-MATLAB
Brain Tumor Detection Using Image Processing Filters 

In order to find the tumors on brain MRI images, these image processing filters are applied to image sequently.

I used a few data from this dataset which label is 'yes', to test the code:
https://www.kaggle.com/navoneel/brain-mri-images-for-brain-tumor-detection

```
Gray Scale
Salt-Pepper Noise 
Median Filter
Canny Edge Detection 
Combining Canny and Original Image
Thresholding
Morphological Processes
Drawing bounding boxes and center detection of the tumor
```
Here's the output of the code step by step;

Original Image\
![Original Image](Images/Original%20Image.png)\

Sharpened\
![Sharpened Image](Images/Sharpened%20Image.png)\

Gray Scale\
It's not changed because already gray\
![Gray Scaled Image](Images/Gray%20Scale%20Image.png)\

Salt-Peper Noise\
![Gray Scaled Image](Images/Salt-Pepper%20Added%20Image.png)\

Median Filter\
![Median Filter Image](Images/Noise%20Removed%20Image.png)\

Median Filter\
![Median Filter Image](Images/Noise%20Removed%20Image.png)\

Canny Edge Detection\
![Canny Image](Images/Canny%20Applied%20Image.png)\

Combined original image and canny\
![Combined Image](Images/Combined%20Image.png)\

Morphological processes\
![Morphological Processes](Images/After%20Morphological%20Processes.png)\

Tumor detected\
![Tumor Image](Images/Tumor%20Detected%20Image.png)\

