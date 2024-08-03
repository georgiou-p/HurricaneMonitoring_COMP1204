# Data Management Coursework

This coursework for the University of Southampton's COMP1204 module involves cleaning and transforming hurricane monitoring data from KML files into CSV format. It emphasizes Unix scripting for file processing, LaTeX for report writing, and Git for version control. Students must extract specific data points such as storm latitude, longitude, sea level pressure, and wind intensity, and convert them into a structured CSV file. Additionally, students are required to handle Git conflicts and document their approach in a LaTeX report. The assignment is worth 20% of the module grade and includes automated testing for instant feedback.

You can find the instructions of the coursework in [UNIX_Coursework.pdf](UNIX_Coursework.pdf).

These are files provided for COMP1204 CW1:
File info:
- [al*.kml](al*.kml)
  These are the kml files containing storm data that you need to process.
  We've added five files to develop your script against.
  You should generate a storm map for each one (using create_map_plot.sh).
  Any three of these five map plots should then be added to your report.
- [create_map_plot.sh](create_map_plot.sh)
  This script generates plots from csv files.
  Your create_csv script should make csv files based on data extracted from the kml files.
  You can then run
    ```sh
    ./create_map_plot.sh storm_data.csv plot.png 
    ```
  to create a map of the storm data.
  NOTE: For this script to work correctly, it must be in the same location as plot-locations-on-map.gpi and world-50m.txt.
- [plot-locations-on-map.gpi](plot-locations-on-map.gpi)
  This is the gnuplot code for creating the storm plots.
  It is run by the create_map_plot.sh script, so you shouldn't need to run it yourself or modify it in any way.
- [report.tex](report.tex)
  This is the LaTeX report template that you should use for your report.
- [world-50m.txt](world-50m.txt)
  This contains information used to draw the world map background in your storm plots.
  It is used by the plot-locations-on-map.gpi script.
