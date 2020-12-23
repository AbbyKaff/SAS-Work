libname pg2 base 'C:\Users\abiga\Documents\SASP2\Data\data';

data parkTypeTraffic;
set pg2.np_yearlyTraffic;  
where ParkType="National Monument" or ParkType="National Park";
if ParkType="National Monument" then MonumentTraffic+Count;
else ParkTraffic+Count;
format ParkTraffic  comma12.1;
format MonumentTraffic comma12.1;
run;


proc report data=parkTypeTraffic (keep= ParkType ParkName Location Count MonumentTraffic ParkTraffic);
title1 Accumulating Traffic Totals for Park Types;
run;
  