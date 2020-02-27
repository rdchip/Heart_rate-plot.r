# Heart_rate-plot.r

The R script plots the heart rate data to compare two devices. The input are CSV files. I attached two inputs files as example. Place garmin.csv and polar.csv in the same folder, edit the setwd("your_folder_location__") and run the script. The polar.csv comes from Polar H10 heart rate monitor which the device is placed in the chest with an elastic band. 

<img scr="readme_images/fenix5plus.jpg" width="50">
![](readme_images/fenix5plus.jpg)

The garmin.csv comes from the Garmin watch Fenix 5 Plus, which use optic wrist technology.


I extracted the garmin.csv from garmin.fit using a Python script "FIT_to_CSV_forWin.py" here is the link: https://github.com/rdchip/FIT-to-CSV-converter-for-windows  
