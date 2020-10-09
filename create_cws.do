clear all 
set more off

* create 2017 CWS
* raw data from NBER: http://data.nber.org/cps/cpsmay2017.zip
unzipfile "cpsmay2017.zip", replace
* slightly modified do file and dictionary from NBER:
* http://data.nber.org/data/progs/cps/cpsmay2017.do
* http://data.nber.org/data/progs/cps/cpsmay2017.dct
do cpsmay2017.do
erase may17pub.dat
* drop people without valid line numbers
drop if pulineno == -1
tempfile cws2017
save `cws2017'

* EPI May 2017 Basic
load_epiextracts, begin(2017m5) end(2017m5) sample(basic)
merge 1:1 hrhhid hrhhid2 pulineno using `cws2017', assert(3) nogenerate




