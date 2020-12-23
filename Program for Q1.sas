libname pg1 base "C:\Users\abiga\Documents\SASP1\Data\data";

proc means data=pg1.np_westweather noprint;
where Precip ne 0;
var Precip;
class Name Year;
output out=rainstats(where=(_type_=3))
n=RainDays sum=TotalRain;
run;

