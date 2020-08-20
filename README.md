# Context Impacts in Hunan Activity Recognition
This is an implementation of paper **Context Impacts in Accelerometer-Based Walk Detection and Step Counting**.

Walk detection scripts:
- *Thresholdtest.m*: Walk detection based on threshold detection
- *STFTtest.m*: Walk detection based on Short Time Fourier Transform (STFT)
- *DWTtest.m*: Walk detection based on Discrete Wavelet Transform (DWT)
- *KNNtest.m*: Walk detection based on k-Nearest Neighboor (KNN)
- *SVMtest.m*: Walk detection based on Support Vector Machine (SVM)

Instruction of walk detection scripts:
`Parameters_h` defines common variables.
You could run any script above directly. For example, in `Thresholdtest.m` if the `onDownsample` is false then the `accuracyArrayWinTHR` has the accuracies upon different window sizes. If the `onDownsample` is true then the `accuracyArrayTHRDS` is the accuracies of different sampling rates.

Step counting scripts:
- *StepCountingTest.m*: Step counting script
- *StepCalc.m*: Step calcuation function

Instruction of Step counting scripts:
Run `StepCountingTest.m` directly and the variable `setMethod` indicates the method you want.

Note:
The code is not a fully recurrence of papers [[1]](#1) and [[2]](#2).


<a id="1">[1]</a> 
Buke, Ao, et al. "**Healthcare algorithms by wearable inertial sensors: a survey.**" China Communications 12.4 (2015): 1-12.

<a id="2">[2]</a> 
Ao, Buke, et al. "**Context Impacts in Accelerometer-Based Walk Detection and Step Counting.**" Sensors 18.11 (2018): 3604.
