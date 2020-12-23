libname pg1 base "C:\Users\abiga\Documents\SASP1\Data\data";

PROC FREQ data=pg1.np_codelookup order=FREQ noprint;
tables type*region / out=TR_freqs;
run;

data freqsubset;
set tr_freqs;
if type^=lag(type) then ntypes+1;
if ntypes>3 then stop;
run;

ods graphics on;
proc freq data=freqsubset order=freq;
tables Type*Region / nocol crosslist
		plots=freqplot(groupby=row scale=grouppercent orient=horizontal);
weight count;
run;

ods graphics off;
