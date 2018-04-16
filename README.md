# Tracking by State - NB

1. Open SAS 

2. Click “Program” > “Open Program” > “TrackingByStateNB v2” (\\mktg-app01\E\Production\Master Files and Instructions\Code - Tracking\TrackingByStateNB v2.sas)

3. Repeat for “TrackingByStateNB_bychecksize v2”:
-   a. Click “Program” > “Open Program” > “TrackingByStateNB_bychecksize v2” (\\mktg-app01\E\ Production\Master Files and Instructions\Code - Tracking\TrackingByStateNB_bychecksize v2.sas)

4. Import Cleared Check Master file as shown below. \\server-fs02\marketing\2017 Programs\Master Spreadsheets\NB_7.1_17.xlsx
-   a. If you click on it out of impatience and it says “Not Responding,” don’t believe it/shut it down. Wait a few more minutes and it will be fine.
-   b. Wait.
-   c. Deselect all variables (Will speed up the import if we only bring in what we need).
-   d. Select the variables as shown below. You can always bring in others if you like (it won’t alter the program). It is important to select the correct “Type.” For “Amount” you can click inside the Type variable in that row and type “C” and it will change to currency. Same for when it needs to be a number, string, or date – you can type N, S, or D. Especially with D, only type it once as doing it multiple times will select a different date format. (You are selecting Date (Type) ANYDTDTE10. (Source Informat) NOT Date/Time (Type) ANYDTDTM10. (Source Informat).
-   e. After clicking “Finish,” you will see in the bottom left corner that it is running:
5. After the import is finished and you have double clicked on “Import Data (NB_....)” as highlighted left, click “Code” and find the name of the imported data (as SAS has named it). Highlight and copy as below (here, “WORK.’NB_7.2_17’n”). 
-   a. After copying as stated above, double click under “Programs”, the program called “TrackingByStateNB v2.” Paste what you copied into the highlighted section as seen below after the word ‘importfile’, ______).
-   b. Change the number after the word “CPP”, ___ to reflect the current Cost Per Piece as reflected in Barbara’s cost sheets.
6. Hit F3! (Or hit “Run” at the ribbon inside the program). 
-   a. It might as you if you want to replace the results if you have already run this program since opening SAS. Click Yes!
7. After the program has run, click “Results – Excel” and then “Download.” Copy results into the “Tracking by State” tab.  (\\server-fs02\marketing\Reporting\2017 Programs\Actual vs Plan\NB 7.1_1017 Tracking by State”)
(Note: If you download two sheets like this and have them open at the same time, SAS will tell you that it can’t open two sheets with the same name. Just save the first one as something or close the workbook then try again.)
8. Use the last part of the output for filling in information in the workbook “2017 NBCC Daily Tracking”
  - a. (\\server-fs02\marketing\Reporting\2017 Programs\Actual vs Plan\2017 NBCC Daily Tracking.xlsx)
9. Next, for reporting by the check size, double click under Programs “TrackingByStateNB_bychecksize”
-   a. Modify the same two higlighted sections as above, with the same values. After this, hit F3.
-   b.	Click “Results – Excel” and “Download.” Copy and paste the results into the tab named “by Large or Small.” (\\server-fs02\marketing\Reporting\2017 Programs\Actual vs Plan\NB 7.1_1017 Tracking by State”
10.	(OPTIONAL) When it’s done importing, you can always look at the data by double-clicking as follows:
 
***FYI, if you wanted to see all GA, you can type: state=”GA” as highlighted below, after clicking “Where”. (Notice the “” around GA. When it’s a text field, which you can see by the red triangle, it needs quotes. With numbers, you don’t need that. For dates, you would need this: ‘02oct17’d). You can also use <,<=,>,>=***
 
