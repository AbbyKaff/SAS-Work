libname cert base 'C:\Users\abiga\Documents\My SAS Files\Final';

proc sort data=cert.Staff out=work.Staff;
	by DOB;
run;

data work.staffreports;
set Cert.Staff;
where WageCategory ne 'H';
format DOB mmddyy10.;
Raise=WageRate*.03;
run;

proc print data= work.staffreports noobs;
var id Name DOB WageCategory WageRate Bonus Raise;
sum Raise;
run;

