
data _null_;
call symput('CPP',0.6670); *Must modify CPP per Barbara's plan number.;
call symput('importfile',"WORK.'NB_3.2_18'n");
run;


data ccfile;
set &importfile; 						
if datecleared = "" then Booked = 0;
else booked = 1;
Mailed=1;
CPP=&cpp;
bookedtot=booked*100;
if booked=1 then Volume=amount;
rename pmt_amt_1=Payment;
run;
data CCdaily;
set ccfile;
if booked=1;
DaysCleared = intck('weekday',drop_date,datecleared);
run;
proc sort data=ccdaily;
by DaysCleared;
run;



proc format;
picture pctpic (round) low-high='09.00%';
run; 
ods excel options(rowbreaks_interval="OUTPUT" sheet_interval="NONE");
Title;
proc tabulate data=ccfile missing;
class fico_25pt amtid STATE;
var Amount mailed Percent Number_of_Payments booked payment cpp amount bookedtot volume;
table STATE*(amtid*FICO_25pt all), Mailed="Mail Qty"*f=comma10. booked*f=5.0
booked="Bkg Rate"*rowpctsum<Mailed>*f=pctpic.
Volume*f=dollar18.2 volume*mean*f=dollar18.2  cpp="Mktg Cost"*f=dollar18.2 cpp="CPA"*pctsum<bookedtot>*f=dollar18.2
amount*mean="Face Amt"*f=dollar18.2 Percent*mean= "wAPR"*f=pctpic.
Number_of_Payments*mean="Term"*f=5.0 Payment*mean*f=dollar18.2/nocellmerge;
label fico_25pt="FICO_Range" amount="AvgCk" STATE="State";
run; 

proc tabulate data=ccfile;
class fico_25pt amtid  STATE;
var amount Percent Number_of_Payments booked payment cpp amount Mailed bookedtot volume;
table FICO_25pt all, Mailed="Mail Qty"*f=comma10. booked*f=5.0
booked="Bkg Rate"*rowpctsum<mailed>*f=pctpic.
Volume*f=dollar18.2 volume*mean*f=dollar18.2  cpp="Mktg Cost"*f=dollar18.2 cpp="CPA"*pctsum<bookedtot>*f=dollar18.2
amount*mean="Face Amt"*f=dollar18.2 Percent*mean= "wAPR"*f=pctpic.
Number_of_Payments*mean="Term"*f=5.0 Payment*mean*f=dollar18.2/nocellmerge;
label fico_25pt="FICO_Range" amount="AvgCk" STATE="State";
run; 

proc tabulate data=ccfile;
class FICO_25pt amtid  STATE;
var amount Percent Number_of_Payments booked payment cpp Mailed bookedtot volume;
table STATE all, Mailed="Mail Qty"*f=comma10. booked*f=5.0
booked="Bkg Rate"*rowpctsum<mailed>*f=pctpic.
Volume*f=dollar18.2 volume*mean*f=dollar18.2  cpp="Mktg Cost"*f=dollar18.2 cpp="CPA"*pctsum<bookedtot>*f=dollar18.2
amount*mean="Face Amt"*f=dollar18.2 Percent*mean= "wAPR"*f=pctpic.
Number_of_Payments*mean="Term"*f=5.0 Payment*mean*f=dollar18.2/nocellmerge;
label fico_25pt="FICO_Range" amount="AvgCk" STATE="State";
run; 

proc tabulate data=ccdaily missing;
class dayscleared;
var booked amount;
table DaysCleared all,booked amount*f=dollar18.2/nocellmerge;
run;
ods _all_ close;
