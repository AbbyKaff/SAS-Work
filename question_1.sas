libname cert base 'C:\Users\abiga\Documents\My SAS Files\Final';

proc sort data=cert.measure out=work.measure;
	by ID;
run;

proc sort data=cert.patients out=work.patient;
	by ID;
	where Age < 50;
run;

data WORK.Merge;
	merge cert.measure cert.patients;
run;

proc sort data=WORK.merge out=Work.Sortpatients;
	where Age < 50;
	by descending Age;
run;

