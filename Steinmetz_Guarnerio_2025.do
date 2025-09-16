***********************************************************
* Dataset creation and operationalisation 2022-2018 2015 2011-2007
* BOOK Chapter - Segregation from an intersectional perspective
***********************************************************

***************************************
*Data Files 2022 - Personal & Register
***************************************

* Personal 
use "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2022_PData.dta"
keep PB140 PB150 PB190 PB200 PX020 PL016 PL032 PL200 PX050 PL040A PL040B PL051A PL051B PL060 ///
> PL100 PL111A PL111B PL141 PL150 PE010 PE021 PE041 PB180 PX040 PB060 year country pers_id hh_id

drop if country== "BG"
drop if country== "CH"
drop if country== "DE"
drop if country== "HR"
drop if country== "IS"
drop if country== "IT"
drop if country== "MT"
drop if country== "RO"
drop if country== "RS"
drop if country== "NO"
drop if country== "UK"
encode country, generate(land)

save "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2022_PData_WF.dta", replace 

* Register

use "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2022_PRData.dta"

keep RB280 RB200 RB290 RB285 RX010 RB211 RB240 RB050 year country pers_id hh_id

rename RB280 PB210 /// country of birth register vs personal

gen child=.
recode child .=1 if RX010<18 

drop if country== "BG"
drop if country== "CH"
drop if country== "DE"
drop if country== "HR"
drop if country== "IS"
drop if country== "IT"
drop if country== "MT"
drop if country== "RO"
drop if country== "RS"
drop if country== "NO"
drop if country== "UK"
encode country, generate(land)

save "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2022_PRData_WF.dta", replace 

*Merge the two data files

use "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2022_PData_WF.dta"
merge m:m year hh_id pers_id land using "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2022_PRData_WF.dta"
keep if _merge==3

* generate one occupational variable 
assert PL051A ==. | PL051B ==.
generate PL051 = cond( PL051A !=., PL051A , PL051B )

* generate one nace variable 
assert PL111A ==. | PL111B ==., rc0 
generate PL111 = cond( PL111A  !=., PL111A  , PL111B )


* generate one employment status variable 
assert PL040A ==. | PL040B ==., rc0 
generate PL040 = cond( PL040A !=., PL040A , PL040B )

drop_merge
save "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2022_WF.dta", replace

***************************************
*Data Files 2021 - Personal & Register
***************************************

* Personal 
use "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2021_PData.dta"

rename PB010 year
rename PB020 country
rename PX030 hh_id
rename PB030 pers_id

keep PB140 PB150 PB190 PB200 PX020 PL016 PL032 PL200 PX050 PL040A PL040B PL051A PL051B PL060 ///
PL100 PL111A PL111B PL141 PL150 PE010 PE021 PE041 PB180 PX040 PB060 year country pers_id hh_id

drop if country== "BG"
drop if country== "CH"
drop if country== "DE"
drop if country== "HR"
drop if country== "IS"
drop if country== "IT"
drop if country== "MT"
drop if country== "RO"
drop if country== "RS"
drop if country== "NO"
drop if country== "UK"
encode country, generate(land)

save "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2021_PData_WF.dta", replace 

* Register

use "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2021_PRData.dta"

rename RB010 year
rename RB020 country
rename RX030 hh_id
rename RB030 pers_id

keep RB280 RB200 RB290 RB285 RX010 RB211 RB240 RB050 year country pers_id hh_id

rename RB280 PB210 /// country of birth register vs personal

gen child=.
recode child .=1 if RX010<18 

drop if country== "BG"
drop if country== "CH"
drop if country== "DE"
drop if country== "HR"
drop if country== "IS"
drop if country== "IT"
drop if country== "MT"
drop if country== "RO"
drop if country== "RS"
drop if country== "NO"
drop if country== "UK"
encode country, generate(land)

save "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2021_PRData_WF.dta", replace 

*Merge the two data files

use "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2021_PData_WF.dta"
merge m:m year hh_id pers_id land using "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2021_PRData_WF.dta"
keep if _merge==3

* generate one occupational variable 
assert PL051A ==. | PL051B ==.
generate PL051 = cond( PL051A !=., PL051A , PL051B )

* generate one nace variable 
assert PL111A ==. | PL111B ==., rc0 
generate PL111a = cond( PL111A  !=., PL111A  , PL111B )


* generate one employment status variable 
assert PL040A ==. | PL040B ==., rc0 
generate PL040 = cond( PL040A !=., PL040A , PL040B )

drop_merge
save "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2021_WF.dta", replace

***************************************
*Data Files 2020 - Personal & Register
***************************************
use "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2020_PData.dta"

keep PB140 PB150 PB190 PB200 PB220A PL016 PL032 PL200 PX050 PL040 PL051 PL060 ///
PL100 PL111 PL141 PL150 PE010 PE021 PE041 PB180 PX040 PB060 year country pers_id hh_id


drop if country== "BG"
drop if country== "CH"
drop if country== "DE"
drop if country== "HR"
drop if country== "IS"
drop if country== "IT"
drop if country== "MT"
drop if country== "RO"
drop if country== "RS"
drop if country== "NO"
drop if country== "UK"

encode country, generate(land)

save "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2020_PData_WF.dta", replace 

* Register

use "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2020_PRData.dta"

keep RB200 RB031 RX010 RB210 RB240 RB050 RX030 RB020 RB030 RB010

rename RB010 year
rename RB020 country
rename RX030 hh_id
rename RB030 pers_id

rename RB210 RB211

gen child=.
recode child .=1 if RX010<18 

drop if country== "BG"
drop if country== "CH"
drop if country== "DE"
drop if country== "HR"
drop if country== "IS"
drop if country== "IT"
drop if country== "MT"
drop if country== "RO"
drop if country== "RS"
drop if country== "NO"
drop if country== "UK"
encode country, generate(land)

save "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2020_PRData_WF.dta", replace 

*Merge the two data files

use "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2020_PData_WF.dta"
merge m:m year hh_id pers_id land using "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2020_PRData_WF.dta"
keep if _merge==3
drop _merge
save "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2020_WF.dta", replace


***************************************
*Data Files 2019 - Personal & Register
***************************************
use "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2019_PData.dta"

rename PB010 year
rename PB020 country
rename PX030 hh_id
rename PB030 pers_id

keep PB140 PB150 PB190 PB200 PB220A PL015 PL031 PL200 PX050 PL040 PL051 PL060 ///
PL100 PL111 PL140 PL150 PE010 PE020 PE040 PB180 PX040 PB060 year country pers_id hh_id

rename PL015 PL016
rename PL031 PL032
rename PL140 PL141
rename PE020 PE021
rename PE040 PE041

drop if country== "BG"
drop if country== "CH"
drop if country== "DE"
drop if country== "HR"
drop if country== "IS"
drop if country== "IT"
drop if country== "MT"
drop if country== "RO"
drop if country== "RS"
drop if country== "NO"
drop if country== "UK"

encode country, generate(land)

save "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2019_PData_WF.dta", replace 

* Register

use "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2019_PRData.dta"

keep RB200 RB031 RX010 RB210 RB240 RB050 RX030 RB020 RB030 RB010

rename RB010 year
rename RB020 country
rename RX030 hh_id
rename RB030 pers_id

rename RB210 RB211

gen child=.
recode child .=1 if RX010<18 

drop if country== "BG"
drop if country== "CH"
drop if country== "DE"
drop if country== "HR"
drop if country== "IS"
drop if country== "IT"
drop if country== "MT"
drop if country== "RO"
drop if country== "RS"
drop if country== "NO"
drop if country== "UK"
encode country, generate(land)

save "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2020_PRData_WF.dta", replace 

*Merge the two data files

use "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2019_PData_WF.dta"
merge m:m year hh_id pers_id land using "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2019_PRData_WF.dta"
keep if _merge==3
drop _merge
save "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2019_WF.dta", replace

***************************************
*Data Files 2018 - Personal & Register
***************************************
use "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2018_PData.dta"


keep PB140 PB150 PB190 PB200 PB220A PL015 PL031 PL200 PX050 PL040 PL051 PL060 ///
PL100 PL111 PL140 PL150 PE010 PE020 PE040 PB180 PX040 PB060 PB010 PB020 PX030 PB030


rename PB010 year
rename PB020 country
rename PX030 hh_id
rename PB030 pers_id

rename PL015 PL016
rename PL031 PL032
rename PL140 PL141
rename PE020 PE021
rename PE040 PE041 

drop if country== "BG"
drop if country== "CH"
drop if country== "DE"
drop if country== "HR"
drop if country== "IS"
drop if country== "IT"
drop if country== "MT"
drop if country== "RO"
drop if country== "RS"
drop if country== "NO"
drop if country== "UK"
encode country, generate(land)


save "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2018_PData_WF.dta", replace 

* Register

use "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2018_PRData.dta"

keep RB200 RB031 RX010 RB210 RB240 RB050 RX030 RB020 RB030 RB010

rename RB010 year
rename RB020 country
rename RX030 hh_id
rename RB030 pers_id

rename RB210 RB211

gen child=.
recode child .=1 if RX010<18 

drop if country== "BG"
drop if country== "CH"
drop if country== "DE"
drop if country== "HR"
drop if country== "IS"
drop if country== "IT"
drop if country== "MT"
drop if country== "RO"
drop if country== "RS"
drop if country== "NO"
drop if country== "UK"
encode country, generate(land)

save "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2018_PRData_WF.dta", replace 

*Merge the two data files

use "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2018_PData_WF.dta"
merge m:m year hh_id pers_id land using "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2018_PRData_WF.dta"
keep if _merge==3
drop _merge
save "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2018_WF.dta", replace



***************************************
*Data Files 2015 - Personal & Register
***************************************

use "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2015_PData.dta"
keep PB140 PB150 PB190 PB200 PB220A PL015 PL031 PL200 PX050 PL040 PL051 PL060 ///
PL100 PL111 PL140 PL150 PE010 PE020 PE040 PB180 PX040 PB060 PB010 PB020 PX030 PB030


rename PB010 year
rename PB020 country
rename PX030 hh_id
rename PB030 pers_id

rename PL015 PL016
rename PL031 PL032
rename PL140 PL141
rename PE020 PE021
rename PE040 PE041 

drop if country== "BG"
drop if country== "CH"
drop if country== "DE"
drop if country== "HR"
drop if country== "IS"
drop if country== "IT"
drop if country== "MT"
drop if country== "RO"
drop if country== "RS"
drop if country== "NO"
drop if country== "UK"
encode country, generate(land)


save "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2018_PData_WF.dta", replace 

* Register

use "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2015_PRData.dta"

keep RB200 RB031 RX010 RB210 RB240 RB050 RX030 RB020 RB030 RB010

rename RB010 year
rename RB020 country
rename RX030 hh_id
rename RB030 pers_id

rename RB210 RB211

gen child=.
recode child .=1 if RX010<18 

drop if country== "BG"
drop if country== "CH"
drop if country== "DE"
drop if country== "HR"
drop if country== "IS"
drop if country== "IT"
drop if country== "MT"
drop if country== "RO"
drop if country== "RS"
drop if country== "NO"
drop if country== "UK"
encode country, generate(land)

save "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2015_PRData_WF.dta", replace 

*Merge the two data files

use "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2015_PData_WF.dta"
merge m:m year hh_id pers_id land using "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2015_PRData_WF.dta"
keep if _merge==3
drop _merge
save "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2015_WF.dta", replace

********************************************************************************
* Additional information regarding data 2011-2007 (additional variable PL051 for ISCO-COM, ohne PL031,PL051, PL073 PL074 PL075 PL076 PL086 PL088 PL089   *from 2008/2005, PL111 PY021N PY021G  from 2005)
*******************************************************************************

***************************************
*Data Files 2011 - Personal & Register
***************************************

use "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2011_PData.dta"
keep PB140 PB150 PB190 PB200 PB220A PL015 PL031 PL200 PX050 PL040 PL050 PL051 PL060 ///
PL100 PL111 PL140 PL150 PE010 PE020 PE040 PB180 PX040 PB060 PB010 PB020 PX030 PB030


rename PB010 year
rename PB020 country
rename PX030 hh_id
rename PB030 pers_id

rename PL015 PL016
rename PL031 PL032
rename PL140 PL141
rename PE020 PE021
rename PE040 PE041 

drop if country== "BG"
drop if country== "CH"
drop if country== "DE"
drop if country== "HR"
drop if country== "IS"
drop if country== "IT"
drop if country== "MT"
drop if country== "RO"
drop if country== "RS"
drop if country== "NO"
drop if country== "UK"
encode country, generate(land)


save "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2011_PData_WF.dta", replace 

* Register

use "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2011_PRData.dta"

keep RB200 RB031 RX010 RB210 RB240 RB050 RX030 RB020 RB030 RB010

rename RB010 year
rename RB020 country
rename RX030 hh_id
rename RB030 pers_id

rename RB210 RB211

gen child=.
recode child .=1 if RX010<18 

drop if country== "BG"
drop if country== "CH"
drop if country== "DE"
drop if country== "HR"
drop if country== "IS"
drop if country== "IT"
drop if country== "MT"
drop if country== "RO"
drop if country== "RS"
drop if country== "NO"
drop if country== "UK"
encode country, generate(land)

save "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2011_PRData_WF.dta", replace 

*Merge the two data files

use "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2011_PData_WF.dta"
merge m:m year hh_id pers_id land using "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2011_PRData_WF.dta"
keep if _merge==3
drop _merge
save "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2011_WF.dta", replace

***************************************
*Data Files 2010 - Personal & Register
***************************************

use "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2010_PData.dta"
keep PB140 PB150 PB190 PB200 PB220A PL015 PL031 PL200 PX050 PL040 PL050 PL051 PL060 ///
PL100 PL111 PL140 PL150 PE010 PE020 PE040 PB180 PX040 PB060 PB010 PB020 PX030 PB030


rename PB010 year
rename PB020 country
rename PX030 hh_id
rename PB030 pers_id

rename PL015 PL016
rename PL031 PL032
rename PL140 PL141
rename PE020 PE021
rename PE040 PE041 

drop if country== "BG"
drop if country== "CH"
drop if country== "DE"
drop if country== "HR"
drop if country== "IS"
drop if country== "IT"
drop if country== "MT"
drop if country== "RO"
drop if country== "RS"
drop if country== "NO"
drop if country== "UK"
encode country, generate(land)


save "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2010_PData_WF.dta", replace 

* Register

use "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2010_PRData.dta"

keep RB200 RB031 RX010 RB210 RB240 RB050 RX030 RB020 RB030 RB010

rename RB010 year
rename RB020 country
rename RX030 hh_id
rename RB030 pers_id

rename RB210 RB211

gen child=.
recode child .=1 if RX010<18 

drop if country== "BG"
drop if country== "CH"
drop if country== "DE"
drop if country== "HR"
drop if country== "IS"
drop if country== "IT"
drop if country== "MT"
drop if country== "RO"
drop if country== "RS"
drop if country== "NO"
drop if country== "UK"
encode country, generate(land)

save "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2010_PRData_WF.dta", replace 

*Merge the two data files

use "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2010_PData_WF.dta"
merge m:m year hh_id pers_id land using "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2010_PRData_WF.dta"
keep if _merge==3
drop _merge
save "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2010_WF.dta", replace


***************************************
*Data Files 2009 - Personal & Register
***************************************

use "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2009_PData.dta"
keep PB140 PB150 PB190 PB200 PB220A PL015 PL031 PL200 PX050 PL040 PL050 PL060 ///
PL100 PL110 PL111 PL140 PL150 PE010 PE020 PE040 PB180 PX040 PB060 PB010 PB020 PX030 PB030


rename PB010 year
rename PB020 country
rename PX030 hh_id
rename PB030 pers_id

rename PL015 PL016
rename PL031 PL032
rename PL140 PL141
rename PE020 PE021
rename PE040 PE041 

drop if country== "BG"
drop if country== "CH"
drop if country== "DE"
drop if country== "HR"
drop if country== "IS"
drop if country== "IT"
drop if country== "MT"
drop if country== "RO"
drop if country== "RS"
drop if country== "NO"
drop if country== "UK"
encode country, generate(land)


save "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2009_PData_WF.dta", replace 

* Register

use "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2009_PRData.dta"

keep RB200 RX010 RB210 RB240 RB050 RX030 RB020 RB030 RB010

rename RB010 year
rename RB020 country
rename RX030 hh_id
rename RB030 pers_id

rename RB210 RB211

gen child=.
recode child .=1 if RX010<18 

drop if country== "BG"
drop if country== "CH"
drop if country== "DE"
drop if country== "HR"
drop if country== "IS"
drop if country== "IT"
drop if country== "MT"
drop if country== "RO"
drop if country== "RS"
drop if country== "NO"
drop if country== "UK"
encode country, generate(land)

save "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2009_PRData_WF.dta", replace 

*Merge the two data files

use "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2009_PData_WF.dta"
merge m:m year hh_id pers_id land using "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2009_PRData_WF.dta"
keep if _merge==3
drop _merge
save "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2009_WF.dta", replace


***************************************
*Data Files 2008 - Personal & Register
***************************************

use "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2008_PData.dta"
keep PB140 PB150 PB190 PB200 PB220A PL015 PL200 PX050 PL040 PL050 PL060 ///
PL100 PL110 PL140 PL150 PE010 PE020 PE040 PB180 PX040 PB060 PB010 PB020 PX030 PB030


rename PB010 year
rename PB020 country
rename PX030 hh_id
rename PB030 pers_id

rename PL015 PL016
rename PL140 PL141
rename PE020 PE021
rename PE040 PE041 

drop if country== "BG"
drop if country== "CH"
drop if country== "DE"
drop if country== "HR"
drop if country== "IS"
drop if country== "IT"
drop if country== "MT"
drop if country== "RO"
drop if country== "RS"
drop if country== "NO"
drop if country== "UK"
encode country, generate(land)


save "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2008_PData_WF.dta", replace 

* Register

use "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2008_PRData.dta"

keep RB200 RX010 RB210 RB240 RB050 RX030 RB020 RB030 RB010

rename RB010 year
rename RB020 country
rename RX030 hh_id
rename RB030 pers_id

rename RB210 RB211

gen child=.
recode child .=1 if RX010<18 

drop if country== "BG"
drop if country== "CH"
drop if country== "DE"
drop if country== "HR"
drop if country== "IS"
drop if country== "IT"
drop if country== "MT"
drop if country== "RO"
drop if country== "RS"
drop if country== "NO"
drop if country== "UK"
encode country, generate(land)

save "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2008_PRData_WF.dta", replace 

*Merge the two data files

use "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2008_PData_WF.dta"
merge m:m year hh_id pers_id land using "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2008_PRData_WF.dta"
keep if _merge==3
drop _merge
save "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2008_WF.dta", replace

***************************************
*Data Files 2007 - Personal & Register
***************************************

use "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2007_PData.dta"
keep PB140 PB150 PB190 PB200 PB220A PL015 PL200 PX050 PL040 PL050 PL060 ///
PL100 PL110 PL140 PL150 PE010 PE020 PE040 PB180 PX040 PB060 PB010 PB020 PX030 PB030


rename PB010 year
rename PB020 country
rename PX030 hh_id
rename PB030 pers_id

rename PL015 PL016
rename PL140 PL141
rename PE020 PE021
rename PE040 PE041 

drop if country== "BG"
drop if country== "CH"
drop if country== "DE"
drop if country== "HR"
drop if country== "IS"
drop if country== "IT"
drop if country== "MT"
drop if country== "RO"
drop if country== "RS"
drop if country== "NO"
drop if country== "UK"
encode country, generate(land)


save "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2007_PData_WF.dta", replace 

* Register

use "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2007_PRData.dta"

keep RB200 RX010 RB210 RB240 RB050 RX030 RB020 RB030 RB010

rename RB010 year
rename RB020 country
rename RX030 hh_id
rename RB030 pers_id

rename RB210 RB211

gen child=.
recode child .=1 if RX010<18 

drop if country== "BG"
drop if country== "CH"
drop if country== "DE"
drop if country== "HR"
drop if country== "IS"
drop if country== "IT"
drop if country== "MT"
drop if country== "RO"
drop if country== "RS"
drop if country== "NO"
drop if country== "UK"
encode country, generate(land)

save "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2008_PRData_WF.dta", replace 

*Merge the two data files

use "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2007_PData_WF.dta"
merge m:m year hh_id pers_id land using "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2007_PRData_WF.dta"
keep if _merge==3
drop _merge
save "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2007_WF.dta", replace




******************************************************
*Append data 
*******************************************************

use "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2007_WF.dta"
append using "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2008_WF.dta"
append using "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2009_WF.dta"
append using "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2010_WF.dta"
append using "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2011_WF.dta"
append using "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2015_WF.dta"
append using "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2018_WF.dta"
append using "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2019_WF.dta"
append using "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2020_WF.dta"
append using "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2021_WF.dta", force
append using "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EuSilc_Cross2022_WF.dta", force

save "C:\Users\ssteinm2\OneDrive - Université de Lausanne\Data\EUSILC_20072022_WF.dta", replace


******************************************************
* Operationalisation of core concepts
*******************************************************

* biological sex

recode PB150 (1=0 men) (2=1 women)(else=.), gen(women)
tab women


* Migrant: COUNTRY OF BIRTH & CITIZENSHIP
		* If not citizen (no passport) then you are a migrant
		* If Citizen but born somewhere else, MIGRANT (acquired citizenship later)
	
		gen migrant_def1=1 if PB220A=="OTH" |  PB220A=="LOC" & PB210=="OTH" 
		replace migrant_def1=. if PB220A=="" 
		replace	migrant_def1=3 if PB220A=="LOC" & PB210=="LOC" 
		replace migrant_def1=3  if PB210=="" & PB220A=="LOC"
		replace	migrant_def1=2 if PB220A=="LOC" & PB210=="EU" |  PB220A=="EU" 
		replace	migrant_def1=2 if PB220A=="" & PB210=="EU"  
		replace	migrant_def1=1 if PB220A=="" & PB210=="OTH"  
		replace	migrant_def1=3 if PB220A=="" & PB210=="LOC"  
	
recode migrant_def1 (1=3 OTH)(2=2 EU)(3=1 NAT)(else=.), gen(migrant)

* define variable combining sex and migrant status into six categories

rename women sex

gen sexmig=1 if sex==1 & migrant==3
replace sexmig=2 if sex==1 & migrant==2
replace sexmig=3 if sex==1 & migrant==1
replace sexmig=4 if sex==0 & migrant==3
replace sexmig=5 if sex==0 & migrant==2
replace sexmig=6 if sex==0 & migrant==1

label define sexmigl 1 "NonEUMigWo"  2 "EUMigWo" 3"NatWo" 4 "NonEUMigMe"  5 "EUMigMe"  6"NatMe", replace
label values sexmig sexmigl


recode migrant(2/3=1 "migrant")(1=0 "native"), gen(mig2)

gen sexmig2=1 if sex==1 & mig2==0 
replace sexmig2=2 if sex==1 & mig2==1 
replace sexmig2=3 if sex==0 & mig2==0 
replace sexmig2=4 if sex==0 & mig2==1 

label define sexmig2l 1 "NatWO"  2 "MigWO" 3"NatME" 4 "MigME" , replace 
label values sexmig2 sexmig2l


* Age range between 18-70
drop if RX010<20
drop if RX010>70


drop if land==20 /// exclude SL because of 1-digit Isco

***********************************************
* Definition of possible outcomes
***********************************************

* Employment status

recode RB211 (1=1)(2=2)(3=3)(4/8=4) if year==2021
recode RB211 (1=1)(2=2)(3=3)(4/8=4) if year==2022

*drop retired people

drop if RB211==3

rename RB211 employ

* Alternative coding based on PL032 (less cases)
recode PL032 (1/4=1 work)(5=2 unempl)(6/9=3 inactive)(else=.), gen(empl)


* Recode vertical segregation measure - supervisory position
recode PL150 (1=1 supervisory) (2=0 non-super) (else=.), gen(super)

* Recode temporality of contract
recode PL141 (1=1)(2=2)(11/12=2)(21/22=1) if year==2021
recode PL141 (1=1)(2=2)(11/12=2)(21/22=1) if year==2022

recode PL141 (1=1 permanent) (2=0 fix) (else=.), gen(temp)


***********************************************
* Definition occupations and sectors
***********************************************

* Sector (problem in years 2008/2007 less detailed Nace was offered (PL110), no record of Nace r-u which excludes a vas amount of people ///
possible solution we use PL111 until 2009 and if we compare we look at two different measures or we reduce it

encode PL110, gen(nac1)
recode nac1 (1/2=1)(9/11=9) if year==2008
recode nac1 (1/2=1)(9/11=9) if year==2007

encode PL111, gen(nac2)

recode nac2 (1/2=1) (10/12=12) (13=.) if year==2022
recode nac2 (1/2=1) (10/12=12) (13=.) if year==2021
recode nac2 (1/2=1) (10/12=12) (13=.) if year==2020
recode nac2 (1/2=1) (10/12=12) (13=.) if year==2019
recode nac2 (1/2=1) (10/12=12) (13=.) if year==2018
recode nac2 (1/2=1) (10/12=12) (13=.) if year==2015
recode nac2 (1/2=1) (10/12=12) (13=.) if year==2011
recode nac2 (1/2=1) (10/12=12) (13=.) if year==2010
recode nac2 (1/2=1) (10/12=12) (13=.) if year==2009


recode PL111a (1/2=1) (10/12=12) (13=.) if year==2021
recode PL111a (1/2=1) (10/12=12) (13=.) if year==2022


gen sec=1 if nac1==1 | nac2==1 | PL111a==1
replace sec=2 if nac1==3 | nac2==3 | PL111a==3
replace sec=3 if nac1==4 | nac2==4 | PL111a==4
replace sec=4 if nac1==5 | nac2==5 | PL111a==5
replace sec=5 if nac1==6 | nac2==6 | PL111a==6
replace sec=6 if nac1==7 | nac2==7 | PL111a==7
replace sec=7 if nac1==8 | nac2==8 | PL111a==8
replace sec=8 if nac1==9 | nac2==9 | PL111a==9
replace sec=9 if nac1==12 | nac2==12 | PL111a==12

lab def sec ///
1 "Managers" ///
2 "Construction" ///
3 "Wholesale and retail trade" ///
4 "Transporting and storage " ///
5 "Accommodation and food service activities" ///
6 "Information and communication " ///
7 "Financial and insurance activities"  ///
8 "Services" ///
9 "Pubic/Health" ///

lab value sec sec
tab sec, m


* Occupation for years 2022-2010 -> 2005 has to be transformed Isco 88 to Isco 08 -> recode to minimize 0 cells and also because SL had only 1 digit!

* exclude armed forces
drop if PL051 <9
drop if PL050 <2

*harmonize across years on 1-digit
recode PL050 (11/13=1)(21/24=2)(31/34=3)(41/42=4)(51/52=5)(61=6)(71/74=7)(81/83=8)(91/93=9)(else=.), gen (isco1)
recode PL051 (11/14=1)(21/26=2)(31/35=3)(41/44=4)(51/54=5)(61/63=6)(71/75=7)(81/83=8)(91/96=9)(else=.), gen (isco1a)

gen isco=1 if isco1==1 | isco1a==1
replace isco=2 if isco1==2 | isco1a==2
replace isco=3 if isco1==3 | isco1a==3
replace isco=4 if isco1==4 | isco1a==4
replace isco=5 if isco1==5 | isco1a==5
replace isco=6 if isco1==6 | isco1a==6
replace isco=7 if isco1==7 | isco1a==7
replace isco=8 if isco1==8 | isco1a==8
replace isco=9 if isco1==9 | isco1a==9

lab def isco ///
1 "Managers" ///
2 "Professionals" ///
3 "Technicians" ///
4 "Clerical workers" ///
5 "Service workers" ///
6 "Skilled workers" ///
7 "Craft and related trades workers"  ///
8 "Operators" ///
9 "Elementary workers" ///

lab value isco isco 
tab isco, m




***************************************************************
*Further sample restrictions - excluding selfemployed with employees, military, ages below 20 and above 70, family workers
**************************************************************
 
* def of critical occupation

recode PL051 (11/14=0)(21=0)(22/23=1)(24=0)(25=1)(26=0)(31/32=1)(33/34=0)(35=1)(41/44=0)(51/52=0)(53/54=1)(61/63=1)(71/75=0)(81/82=0)(83=1)(91/93=1)(94/95=0)(96=1) (else=.), gen(occrita1a)

recode PL050 (11/14=0)(21=0)(22/23=1)(24=0)(25=1)(26=0)(31/32=1)(33/34=0)(35=1)(41/44=0)(51/52=0)(53/54=1)(61/63=1)(71/75=0)(81/82=0)(83=1)(91/93=1)(94/95=0)(96=1) (else=.), gen(occrita1)

gen occ_crit=0 if occrita1a==0 | occrita1==0
replace occ_crit=1 if occrita1a==1 | occrita1==1

label define occ_critl 1 "critical"  0 "noncritical", replace
label values occ_crit occ_critl
  
* def of teleworkable occupations

recode PL051 (11/14=2)(21=3)(22=4)(23/24=2)(25=1)(26=2)(31=3)(32=4)(33/34=2)(35=1)(41/44=1)(51/53=4)(54=2)(61/63=3)(71/75=3)(81/83=3)(91/94=3)(95=4)(96=3)(else=.), gen(occtele)

recode PL050 (11/14=2)(21=3)(22=4)(23/24=2)(25=1)(26=2)(31=3)(32=4)(33/34=2)(35=1)(41/44=1)(51/53=4)(54=2)(61/63=3)(71/75=3)(81/83=3)(91/94=3)(95=4)(96=3)(else=.), gen(occtele1)

gen occ_tele=1 if occtele==1 | occtele1==1
replace occ_tele=2 if occtele==2 | occtele1==2
replace occ_tele=3 if occtele==3 | occtele1==3
replace occ_tele=4 if occtele==4 | occtele1==4

label define occtelel 1 "HighTele LowSocial"  2 "HighTele HighSocial" 3 "LowTele LowSocial"  4 "LowTele HighSocial", replace
label values occtele occtelel

* Recode vertical segregation measure - supervisory position
recode PL150 (1=1 supervisory) (2=0 non-super) (else=.), gen(super)

****************************************************
* Recode outcome variables
****************************************************

* Recode ISEI


recode PL051 (11=69)(21=69)(22=66)(23=63)(24=64)(25=69)(26=66)(31=51)(32=46)(33=53)(34=45)(35=57)(41=41)(42=40)(43=43)(44=40)(51=30)(52=33)(53=26)(54=40) (61=21)(71=34)(72=38)(73=33)(74=43)(75=27)(81=29)(82=29)(83=36)(91=17)(92=14)(93=24)(96=26)(else=.), gen(isei1)

recode PL050 (11=69)(21=69)(22=66)(23=63)(24=64)(25=69)(26=66)(31=51)(32=46)(33=53)(34=45)(35=57)(41=41)(42=40)(43=43)(44=40)(51=30)(52=33)(53=26)(54=40) (61=21)(71=34)(72=38)(73=33)(74=43)(75=27)(81=29)(82=29)(83=36)(91=17)(92=14)(93=24)(96=26)(else=.), gen(isei2)


gen isei=14 if isei1==14|isei2==14
replace isei=21 if isei1==21|isei2==21
replace isei=24 if isei1==24|isei2==24
replace isei=26 if isei1==26|isei2==26
replace isei=27 if isei1==27|isei2==27
replace isei=29 if isei1==29|isei2==29
replace isei=30 if isei1==30|isei2==30
replace isei=33 if isei1==33|isei2==33
replace isei=34 if isei1==34|isei2==34
replace isei=36 if isei1==36|isei2==36
replace isei=38 if isei1==38|isei2==38
replace isei=40 if isei1==40|isei2==40
replace isei=41 if isei1==41|isei2==41
replace isei=43 if isei1==43|isei2==43
replace isei=45 if isei1==45|isei2==45
replace isei=46 if isei1==46|isei2==46
replace isei=51 if isei1==51|isei2==51
replace isei=53 if isei1==53|isei2==53
replace isei=57 if isei1==57|isei2==57
replace isei=63 if isei1==63|isei2==63
replace isei=64 if isei1==64|isei2==64
replace isei=66 if isei1==66|isei2==66
replace isei=69 if isei1==69|isei2==69
      
  
      




sum isei if sexmig==1
sum isei if sexmig==2
sum isei if sexmig==3
sum isei if sexmig==4
sum isei if sexmig==5
sum isei if sexmig==6

sum isei if sexmig==1 & year==2018
sum isei if sexmig==1 & year==2020
sum isei if sexmig==1 & year==2022

sum isei if sexmig==2 & year==2018
sum isei if sexmig==2 & year==2020
sum isei if sexmig==2 & year==2022

sum isei if sexmig==3 & year==2018
sum isei if sexmig==3 & year==2020
sum isei if sexmig==3 & year==2022

sum isei if sexmig==4 & year==2018
sum isei if sexmig==4 & year==2020
sum isei if sexmig==4 & year==2022

sum isei if sexmig==5 & year==2018
sum isei if sexmig==5 & year==2020
sum isei if sexmig==5 & year==2022

sum isei if sexmig==6 & year==2018
sum isei if sexmig==6 & year==2020
sum isei if sexmig==6 & year==2022

   
    
asdoc bysort year: tab isco1 sexmig, nofreq col save(concentration_time1.doc) replace



*The first country to furnish a list of essential and non-essential sectors was Italy: just as the pandemic broke out first in Italy, so containment policies developed there first. This list was issued in the Prime Ministerial Decree of 22 March 2020; sectors were dividedinto essential and non-essential by and large at the 2-digit NACE level: agriculture (a), hunting, mining, quarrying(b), utilities, transport and storage (h), public administration (O, N), education (P) and health (Q) were classified as essential, while manufacturing (c), construction (f), wholesale and retail trade (g), hotels and restaurants (i), financial intermediation (k), real estate (L), and community services were non-essential. Almost the same distinction was later adopted by most Euro-pean governments (Fana et al., 2020)
     a      |     32,745        5.56        5.56
      b - e |     97,665       16.59       22.16
          f |     40,147        6.82       28.98
          g |     76,321       12.97       41.95
          h |     32,679        5.55       47.50
          i |     27,149        4.61       52.11
          j |     18,146        3.08       55.20
          k |     16,820        2.86       58.05
      l - n |     53,799        9.14       67.20
          o |     47,189        8.02       75.21
          p |     54,554        9.27       84.48
          q |     63,173       10.73       95.22
      r - u |     28,150        4.78      100.00

	  
recode nace (1=)(2=)(3=)(4=)(5=)(6=)(7=)(8=)(9=)(10=)(11=)(12=)(13=)(else=.), gen(nace_ess)
	  
	  
	  
         