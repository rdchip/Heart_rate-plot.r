# Heart_rate-plot.r

The R script plots the heart rate data to compare two devices. The input are CSV files. I attached two inputs files as example. Place garmin.csv and polar.csv in the same folder, edit the setwd("your_folder_location__") and run the script. The polar.csv comes from Polar H10 heart rate monitor which the device is placed in the chest with an elastic band. The garmin.csv comes from the Garmin watch Fenix 5 Plus, which use optic wrist technology.

![Rplot](https://user-images.githubusercontent.com/11890977/75213806-28aa6300-5740-11ea-8df4-b6295f358f1d.png)

I extracted the garmin.csv from garmin.fit using a Python script "FIT_to_CSV_forWin.py" here is the link: https://github.com/rdchip/FIT-to-CSV-converter-for-windows  
