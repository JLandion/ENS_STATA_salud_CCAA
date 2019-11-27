 *Modelo Hogares.dta
CCAA 1-2 IH 3-10 ESTRATO 11-11 A7_1_i 24-24 A7_2a 16-17 SEXO_i 12-12 EDAD_i 13-15 A10_i 37-38 A8_1_i 31-31 A11_i  39-39 
B19a_2 51-53 B19b_2 54-56 B20b_2 60-62 C24_3 72-72 C24_4 73-73 C24_5 74-74 C24_6 75-75 C24_7 76-76 CLASE_PR 104-104

*A7_2a de Hogares la hemos sustituido por NORDEN_Ai

*Modelo Adultos.dta
CCAA 1-2 IH 3-10 A7_2a 11-12 Sex 13 Age 14-16 F18a_2 58-60 F18b_2 61-63 F19a_2 64-66 F19b_2 67-69 F20 70 G25a_3 81 G25b_3 82 G25c_3 83 G25a_9 99 G25b_9 100 G25c_9 101
G25a_10 102 G25b_10 103 G25c_10 104 G25a_11 105 G25b_11 106 G25c_11 107 T112 406 T113 407 V121 451 V123 453-454 CLASE_PR 578 IMCa 579


*Juntamos ambos modelos con el comando Merge
*Primero creamos Hogares.dta, luego abrimos Adultos.dta y usamos el comando Merge. Posteriormente fijamos a _m==3.
use "C:\Users\Amand\Downloads\BEA TRABAJO\Modelo\Adultos.dta" 
merge 1:n IH A7_2a using Hogares.dta
save "C:\Users\Amand\Downloads\BEA TRABAJO\Modelo\AD_Hog.dta"
keep if _m==3
	
*Etiquetado de las variables
label variable CCAA "Comunidades autónomas"
label variable IH "Identificación del hogar"
label variable A7_2a "Persona de Referencia"
label variable Sex "Sexo: Hombre=1, Mujer=0"
label variable Age "Edad, 15-103"
label variable F18a_2 "Actividad en la empresa en la que trabaja"
label variable F18b_2 "Actividad en la empresa en la que trabajó"
label variable F19a_2 "Ocupación, profesión u oficio actual"
label variable F19b_2 "Última ocupación, profesión u oficio"
label variable F20 "Situación profesional que desempeó en su último empleo"
label variable G25a_3 "Ha padecido alguna vez: Angina de pecho, enfermedad coronaria"
label variable G25b_3 "Ha padecido últimos 12 meses: Angina de pecho, enfermedad coronaria"
label variable G25c_3 "Diagnóstico de médico: Angina de pecho, enfermedad coronaria"
label variable G25a_9 "Ha padecido alguna vez: Alergia crónica, como rinitis, conjuntivitis..."
label variable G25b_9 "Ha padecido últimos 12 meses: Alergia crónica, como rinitis, conjuntivitis..."
label variable G25a_9 "Diagnóstico: Alergia crónica, como rinitis, conjuntivitis..."
label variable G25a_9 "Ha padecido alguna vez: Alergia crónica, como rinitis, conjuntivitis..."
label variable G25c_9 "Diagnóstico: Alergia crónica, como rinitis, conjuntivitis..."
label variable G25a_10 "Ha padecido alguna vez: Asma (incluida asma alérgica)"
label variable G25b_10 "Ha padecido últimos 12 meses: Asma (incluida asma alérgica)"
label variable G25a_10 "Diagnóstico: Asma (incluida asma alérgica)"
label variable G25a_10 "Ha padecido alguna vez: Asma (incluida asma alérgica)"
label variable G25c_10 "Diagnóstico: Asma (incluida asma alérgica)"
label variable G25a_11 "Ha padecido alguna vez: Bronquitis crónica, enfisema, enfermedad pulmonar obstructiva crónica (EPOC)"
label variable G25b_11 "Ha padecido últimos 12 meses: Bronquitis crónica, enfisema, enfermedad pulmonar obstructiva crónica (EPOC)"
label variable G25b_11 "Últimos 12 meses: Bronquitis crónica, enfisema, enfermedad pulmonar obstructiva crónica (EPOC)"
label variable G25b_11 "Ha padecido últimos 12 meses: Bronquitis crónica, enfisema, enfermedad pulmonar obstructiva crónica (EPOC)"
label variable G25c_11 "Diagnóstico: Bronquitis crónica, enfisema, enfermedad pulmonar obstructiva crónica (EPOC)"
label variable T112 "Frecuencia con la que realiza alguna actividad física en su tiempo libre"
label variable T113 "Últimos 7 días: Nº de días de actividades físicas intensas"
label variable V121 "¿Fuma actualmente?"
label variable V123 "Fumadores a diario: Número de cigarrillos que fuma al día"
label variable CLASE_PR "Clase social basada en la ocupación de la persona de referencia"
label variable IMCa "Índice de masa corporal (IMC) del adulto"
label variable ESTRATO "Estrato al que pertenece el hogar (por tamaño de municipio)+500.000 habitantes=0 hasta -10kPob =6"

*Eliminamos variables
drop SEXO_i
drop EDAD_i
drop B19a_2
drop B19b_2
drop B20b_2
drop A10_i
drop A8_1_i
drop A11_i
drop T113
*Nos dimos cuenta de que Clase_PR no nos interesaba en el modelo. 
*drop if CLASE_PR == 9
drop CLASE_PR
drop V123 

*Etiquietamos las variables de Problemas de Entorno.
label variable C24_3 "Problemas en el entorno de su vivienda: agua de consumo de mala calidad"
label variable C24_4 "Problemas en el entorno de su vivienda: poca limpieza en las calles"
label variable C24_5 "Problemas en el entorno de su vivienda: contaminación del aire elevada por industria cercana"
label variable C24_5 "Problemas en el entorno de su vivienda: contaminación del aire elevada por otras causas"
label variable C24_5 "Problemas en el entorno de su vivienda: contaminación del aire elevada por industria cercana"
label variable C24_5 "Probl entorno de su vivienda:contam del aire elevada por industria cercana"
label variable C24_6 "Probl entorno de su vivienda:contam del aire elevada por otras causas"
label variable C24_7 "Probl entorno de su vivienda:escasez de zonas verdes"

*Modificamos la variable sexo para tener Mujer=0 y Hombre=1
replace Sex=0 if Sex==2

*Reemplazamos las variables de trabajo, y etiquetamos en función de la tabla CNAE2009
gen ActualAct= F18a_2
replace ActualAct=1 if (ActualAct>=11 & ActualAct<=32)
replace ActualAct=2 if (ActualAct>=51  & ActualAct<=99)
replace ActualAct=3 if (ActualAct>=101  & ActualAct<=332)
replace ActualAct=4 if (ActualAct>=351  & ActualAct<=353)
replace ActualAct=5 if (ActualAct>=360  & ActualAct<=390)
replace ActualAct=6 if (ActualAct>=411  & ActualAct<=439)
replace ActualAct=7 if (ActualAct>=451  & ActualAct<=479)
replace ActualAct=8 if (ActualAct>=491  & ActualAct<=532)
replace ActualAct=9 if (ActualAct>=551  & ActualAct<=563)
replace ActualAct=10 if (ActualAct>=581  & ActualAc<=639)
replace ActualAct=11 if (ActualAct>=641  & ActualAct<=663)
replace ActualAct=12 if (ActualAct>=681  & ActualAct<=683)
replace ActualAct=13 if (ActualAct>=691  & ActualAct<=750)
replace ActualAct=14 if (ActualAct>=771  & ActualAct<=829)
replace ActualAct=15 if (ActualAct>=841  & ActualAct<=843)
replace ActualAct=16 if (ActualAct>=851  & ActualAct<=856)
replace ActualAct=17 if (ActualAct>=861  & ActualAct<=889)
replace ActualAct=18 if (ActualAct>=900  & ActualAct<=932)
replace ActualAct=19 if (ActualAct>=941  & ActualAct<=960)
replace ActualAct=20 if (ActualAct>=970  & ActualAct<=982)
replace ActualAct=21 if ActualAct==990
gen PastAct= F18b_2
replace PastAct=1 if (PastAct>=11 & PastAct<=32)
replace PastAct=2 if (PastAct>=51  & PastAct<=99)
replace PastAct=3 if (PastAct>=101  & PastAct<=332)
replace PastAct=4 if (PastAct>=351  & PastAct<=353)
replace PastAct=5 if (PastAct>=360  & PastAct<=390)
replace PastAct=6 if (PastAct>=411  & PastAct<=439)
replace PastAct=7 if (PastAct>=451  & PastAct<=479)
replace PastAct=8 if (PastAct>=491  & PastAct<=532)
replace PastAct=9 if (PastAct>=551  & PastAct<=563)
replace PastAct=10 if (PastAct>=581  & PastAct<=639)
replace PastAct=11 if (PastAct>=641  & PastAct<=663)
replace PastAct=12 if (PastAct>=681  & PastAct<=683)
replace PastAct=13 if (PastAct>=691  & PastAct<=750)
replace PastAct=14 if (PastAct>=771  & PastAct<=829)
replace PastAct=15 if (PastAct>=841  & PastAct<=843)
replace PastAct=16 if (PastAct>=851  & PastAct<=856)
replace PastAct=17 if (PastAct>=861  & PastAct<=889)
replace PastAct=18 if (PastAct>=900  & PastAct<=932)
replace PastAct=19 if (PastAct>=941  & PastAct<=960)
replace PastAct=20 if (PastAct>=970  & PastAct<=982)
replace PastAct=21 if PastAct==990
gen ActualOcup= F19a_2
replace ActualOcup=1 if (ActualOcup>=11 & ActualOcup<=32)
replace ActualOcup=2 if (ActualOcup>=51  & ActualOcup<=99)
replace ActualOcup=3 if (ActualOcup>=101  & ActualOcup<=332)
replace ActualOcup=4 if (ActualOcup>=351  & ActualOcup<=353)
replace ActualOcup=5 if (ActualOcup>=360  & ActualOcup<=390)
replace ActualOcup=6 if (ActualOcup>=411  & ActualOcup<=439)
replace ActualOcup=7 if (ActualOcup>=451  & ActualOcup<=479)
replace ActualOcup=8 if (ActualOcup>=491  & ActualOcup<=532)
replace ActualOcup=9 if (ActualOcup>=551  & ActualOcup<=563)
replace ActualOcup=10 if (ActualOcup>=581  & ActualAc<=639)
replace ActualOcup=11 if (ActualOcup>=641  & ActualOcup<=663)
replace ActualOcup=12 if (ActualOcup>=681  & ActualOcup<=683)
replace ActualOcup=13 if (ActualOcup>=691  & ActualOcup<=750)
replace ActualOcup=14 if (ActualOcup>=771  & ActualOcup<=829)
replace ActualOcup=15 if (ActualOcup>=841  & ActualOcup<=843)
replace ActualOcup=16 if (ActualOcup>=851  & ActualOcup<=856)
replace ActualOcup=17 if (ActualOcup>=861  & ActualOcup<=889)
replace ActualOcup=18 if (ActualOcup>=900  & ActualOcup<=932)
replace ActualOcup=19 if (ActualOcup>=941  & ActualOcup<=960)
replace ActualOcup=20 if (ActualOcup>=970  & ActualOcup<=982)
replace ActualOcup=21 if ActualOcup==990
gen LastOcup= F19b_2
replace LastOcup=1 if (LastOcup>=11 & LastOcup<=32)
replace LastOcup=2 if (LastOcup>=51  & LastOcup<=99)
replace LastOcup=3 if (LastOcup>=101  & LastOcup<=332)
replace LastOcup=4 if (LastOcup>=351  & LastOcup<=353)
replace LastOcup=5 if (LastOcup>=360  & LastOcup<=390)
replace LastOcup=6 if (LastOcup>=411  & LastOcup<=439)
replace LastOcup=7 if (LastOcup>=451  & LastOcup<=479)
replace LastOcup=8 if (LastOcup>=491  & LastOcup<=532)
replace LastOcup=9 if (LastOcup>=551  & LastOcup<=563)
replace LastOcup=10 if (LastOcup>=581  & LastOcup<=639)
replace LastOcup=11 if (LastOcup>=641  & LastOcup<=663)
replace LastOcup=12 if (LastOcup>=681  & LastOcup<=683)
replace LastOcup=13 if (LastOcup>=691  & LastOcup<=750)
replace LastOcup=14 if (LastOcup>=771  & LastOcup<=829)
replace LastOcup=15 if (LastOcup>=841  & LastOcup<=843)
replace LastOcup=16 if (LastOcup>=851  & LastOcup<=856)
replace LastOcup=17 if (LastOcup>=861  & LastOcup<=889)
replace LastOcup=18 if (LastOcup>=900  & LastOcup<=932)
replace LastOcup=19 if (LastOcup>=941  & LastOcup<=960)
replace LastOcup=20 if (LastOcup>=970  & LastOcup<=982)
replace LastOcup=21 if LastOcup==990
drop F18a_2 F18b_2 F19a_2 F19b_2 F20 

*Creamos las variables Tener o haber Tenido
replace G25a_3=0 if G25a_3==2
replace G25a_11=0 if G25a_3==2
replace G25a_11=0 if G25a_11==2
replace G25a_10=0 if G25a_10==2
replace G25a_9=0 if G25a_9==2
replace G25b_3=0 if G25b_3==2 
replace G25b_3=0 if G25b_3=2
replace G25b_3=0 if G25b_3==2
replace G25b_9=0 if G25b_9==2
replace G25b_10=0 if G25b_10==2
replace G25b_11=0 if G25b_11==2
replace G25c_3=0 if G25c_3==2
replace G25c_9=0 if G25c_9==2
replace G25c_10=0 if G25c_10==2
replace G25c_11=0 if G25c_11==2
gen HoHAng=0
replace HoHAng=1 if ( G25a_3==1 | G25b_3==1 | G25c_3==1)
gen HoHAlle=0
replace HoHAlle=1 if ( G25a_9==1 | G25b_9==1 | G25c_9==1)
gen HoHAsth=0
replace HoHAsth=1 if ( G25a_10==1 | G25b_10==1 | G25c_10==1)
gen HoHOth=0
replace HoHOth=1 if ( G25a_11==1 | G25b_11==1 | G25c_11==1)
gen HoH=0
replace HoH=1 if ( G25a_3==1 | G25b_3==1 |G25c_3==1 |G25a_9==1| G25b_9==1 |G25c_9==1| G25a_10==1| G25b_10==1 |G25c_10==1| G25a_11==1 |G25b_11==1| G25c_11==1)


*Otra forma de generar HOH
*gen HoH=1 if ( G25a_3==1 | G25b_3==1 |G25c_3==1 |G25a_9==1| G25b_9==1 |G25c_9==1| G25a_10==1| G25b_10==1 |G25c_10==1| G25a_11==1 |G25b_11==1| G25c_11==1)
*Luego reemplazar missing por 0.

*replace HoHAng=1 if G25c_3==1
*replace HoHAlle=1 if G25c_9==1
*replace HoHAsth=1 if G25c_10==1


*Etiquetado de variables de Ocupación y de variables Have or Had
label variable PastAct "Actividad en la empresa en la que trabajó en función de CNAE 2009"
label variable ActualAct "Actividad en la empresa en la que trabaja en función de CNAE 2009"
label variable ActualOcup "Ocupación, profesión u oficio actual en función de CNAE 2009"
label variable LastOcup "Última Ocupación, profesión u oficio en función de CNAE 2009"
label variable HoH "Tener o haber tenido alguna enfermedad cardiorespiratoria"
label variable HoHAng "Tener o haber tenido alguna vez: Angina de pecho, enfermedad coronaria."
label variable HoHAlle "Tener o haber tenido alguna vez: Alergia crónica, como rinitis, conjuntivitis."
label variable HoHAsth "Tener o haber tenido alguna vez: asma (incluida asma alérgica)."
label variable HoHOth "Tener o haber tenido alguna vez: Bronquitis crónica, enfisema, enfermedad pulmonar.."
label variable HoHOth "Tener o haber tenido alguna vez:Bronquitis crónica, enfisema, enf. pulmonar.."

*Vamos a quitar de la muestra los missing values y los No sabe No contesta, además eliminamos las variables que no necesitamos
*drop if G25a_9>1
tab G25a_3
tab G25a_9
tab G25b_9
tab G25c_9
tab G25a_10

drop if G25a_3 == 8
drop if G25a_3 == 9
drop if G25a_9 == 8
drop if G25a_9 == 9
drop if G25b_9 == 8
drop if G25b_9 == 9
drop if G25c_9 == 8
drop if G25a_10 == 8
drop if G25a_10 == 9
drop if G25b_10 == 8
drop if G25b_10 == 9
drop if G25c_10 == 8
drop if G25a_11 == 8
drop if G25a_11 == 9
drop if T112 == 8
drop if T112 == 9
drop if C24_3 == 8
drop if C24_3 == 9
drop if C24_4 == 8
drop if C24_4 == 9
drop if C24_5 == 8
drop if C24_5 == 9
drop if C24_6 == 8
drop if C24_6 == 9
drop if C24_7 == 8
drop if C24_7 == 9

sum
tab IMCa
drop T113
tab V121
drop if V121 == 9
tab V123
drop if V123 == 98
drop if V123 == 99
sum
drop F18a_2 F18b_2 F19a_2 F19b_2 F20
sum
tab ActualAct
drop if ActualAct == 0
drop if PastAct == 0
drop if ActualOcup == 0

*Eliminación de variables iguales.
drop F18a_2
drop F18b_2
drop F19a_2
drop F19b_2
drop F20
drop G25a_3
drop G25b_3
drop G25c_3
drop G25a_9
drop G25b_9
drop G25c_9
drop G25a_10
drop G25b_10
drop G25c_10
drop G25a_11
drop G25b_11
drop G25c_11


*Eliminamos Ceuta y Melilla porque no tenemos datos suficientes. 
drop if CCAA = 18
drop if CCAA == 18
drop if CCAA == 19
sum

probit HoH PastAct CA Sex
probit HoH PastAct CA Sex
probit HoH PastAct CCAA Sex
probit HoH i.PastAct CCAA Sex

*replace PastAct=10 if (PastAct>=581  & PastAct<=639)
sum PastAct
tab PastAct
probit HoH C24_4 C24_5 C24_6 C24_7 i.PastAct ESTRATO V121 T112 Age Sex CCAA
probit HoH C24_4 C24_5 C24_6 C24_7 i.PastAct i.ESTRATO V121 T112 Age Sex CCAA
probit HoH C24_4 C24_5 C24_6 C24_7 (i.PastAct / ESTRATO) V121 T112 Age Sex CCAA
tab HoH C24_4 C24_5 C24_6 C24_7 i.PastAct i.ESTRATO V121 T112 Age Sex CCAA
tab HoH C24_4 C24_5 C24_6 C24_7 PastAct ESTRATO V121 T112 Age Sex CCAA
sum HoH C24_4 C24_5 C24_6 C24_7 PastAct ESTRATO V121 T112 Age Sex CCAA
sum HoH C24_4 C24_5 C24_6 C24_7 PastAct ESTRATO V123 T112 Age Sex CCAA

*Añadimos valores medios de Contaminación a la variable Comunidad Autónoma
tab CCAA
replace CCAA=8.9746633 if CCAA==15
replace CCAA= 9.08876021 if CCAA== 16
replace CCAA=7.460455849 if CCAA==11
replace CCAA=11.99233497 if CCAA==12
replace CCAA=8.068187323 if CCAA==4
replace CCAA=8.19376016 if CCAA==17
replace CCAA=12.16465823 if CCAA==14
replace CCAA=11.02859522 if CCAA==13
replace CCAA=13.52146051 if CCAA==9
replace CCAA=11.56658906 if CCAA==3
replace CCAA=9.419642113 if CCAA==5
replace CCAA=10.05172009 if CCAA==6
replace CCAA=9.447195471 if CCAA==8
replace CCAA=9.031892613 if CCAA==7
replace CCAA=15.4 if CCAA==1
replace CCAA=10.52944076 if CCAA==2
replace CCAA=9.363439526 if CCAA==10
sum

*Cambiamos Nombres de las variables para facilitar la interpretación
rename C24_7 GreenZone
rename C24_6 AirProbOth
rename C24_5 AirProbInd
rename C24_4 DirtyStreet
rename C24_3 BadWater
rename V121 Smoker
rename T112 FrecSport
rename CCAA Pollution_PM25

*Eliminación de variables
drop G25a_3 G25b_3 G25c_3 G25a_9 G25b_9 G25c_9 G25a_10 G25b_10 G25c_10 G25a_11 G25b_11 G25c_11 IMCa ActualAct ActualOcup LastOcup 

probit HoH GreenZone AirProbOth AirProbInd DirtyStreet BadWater ESTRATO Smoker FrecSport Age Sex CCAA
probit HoH GreenZone AirProbOth AirProbInd DirtyStreet BadWater ESTRATO Smoker FrecSport Age Sex CCAA i.PastAct
sum PastAct
tab PastAct

probit HoH i.PastAct GreenZone AirProbOth AirProbInd DirtyStreet BadWater ESTRATO Smoker FrecSport Age Sex Pollution_PM25

*Etiquetas de variables categóricas
label define PastActivity 1 "agriculture (A)" 2 "ExtrInd (B)" 3 "ManufInd (C)" 4 "EnerSum (D)" 5 "WatSum (E)" 6 "Construction (F)" 7 "BigCommer (G)" 8 "Transport (H)" 9 "Hostelry (I)" 10 "InfoCom (J)" 11 "FinancAct (K)" 12 "InmobAct (L)" 13 "ScienAct (M)" 14 "AdminAct (N)" 15 "PublicAct (O)" 16 "Educ (P)" 17 "HealthAct (Q)" 18 "ArtAct (R)" 19 "OtherServ (S)" 20 "HomeAct (T)" 21 "ForeignAct (U)", replace
label values PastAct PastActivity
label define FrecSport 1 "Sedentary" 2 "Few" 3 "SeveralMonth" 4 "SeveralWeek", replace
label values FrecSport FrecSport
label define ESTRATO 0 "+500K POB" 1 "CAPITAL" 2 "+100K POB" 3 "50-100K POB" 4 "20-50K POB" 5 "10-20K POB" 6 "<10K POB", replace
label values ESTRATO ESTRATO
label define Smoker 1 "Yes_Diary" 2 "Yes_NotDiary" 3 "NotAct_HaveSmokebefore" 4 "NotSmoke", replace
label values Smoker Smoker
label define BadWater 1 "Much" 2 "Some" 3 "Nothing", replace
label values BadWater BadWater
label define DirtyStreet 1 "Much" 2 "Some" 3 "Nothing", replace
label values DirtyStreet DirtyStreet
label define AirProbInd 1 "Much" 2 "Some" 3 "Nothing", replace
label values AirProbInd AirProbInd
label values AirProbOth AirProbInd
label values GreenZone AirProbInd
label define CLASS 1 "Chief/Executive +10 staff affiliated to university degrees" 2 "Chief/Executive -10 staff associated to university degrees and technical support. Athletes and Artists." 3 "Intermediate occupations and Free-Lancers." 4 "Supervisors and workers in skilled technical occupations." 5 "Qualified workers from the primary sector and other semi-skilled workers" 6 "Unskilled Workers"
label values CLASE_PR CLASS



*Modelos por separado con Categóricas (Enfermedades CARDIORRESPIRATORIAS)
*Tener o haber tenido todas las enfermedades
probit HoH i.PastAct i.CLASE_PR i.GreenZone i.AirProbOth i.AirProbInd i.DirtyStreet i.BadWater i.ESTRATO i.Smoker i.FrecSport Age Sex Pollution_PM25
*Usando Clase_PR  en lugar de PastAct (Alternativa no viable por la predicción)
probit HoH i.CLASE_PR i.GreenZone i.AirProbOth i.AirProbInd i.DirtyStreet i.BadWater i.ESTRATO i.Smoker i.FrecSport Age Sex Pollution_PM25
*Margins (APE) y (PEA)
margins, dydx(PastAct GreenZone CLASE_PR AirProbOth AirProbInd DirtyStreet BadWater ESTRATO Smoker FrecSport Age Sex Pollution_PM25)
margins, dydx(PastAct GreenZone AirProbOth AirProbInd DirtyStreet BadWater ESTRATO Smoker FrecSport Age Sex Pollution_PM25) atmeans

*Tener o haber tenido Anginas de Pecho, enfermedad coronaria
probit HoHAng i.PastAct i.CLASE_PR i.GreenZone i.AirProbOth i.AirProbInd i.DirtyStreet i.BadWater i.ESTRATO i.Smoker i.FrecSport Age Sex Pollution_PM25
*Usando Clase_PR en lugar de PastAct (Alternativa no viable por la predicción)
probit HoHAng i.CLASE_PR i.GreenZone i.AirProbOth i.AirProbInd i.DirtyStreet i.BadWater i.ESTRATO i.Smoker i.FrecSport Age Sex Pollution_PM25
*Margins (APE) y (PEA)
margins, dydx(PastAct CLASE_PR GreenZone AirProbOth AirProbInd DirtyStreet BadWater ESTRATO Smoker FrecSport Age Sex Pollution_PM25)
margins, dydx(PastAct GreenZone AirProbOth AirProbInd DirtyStreet BadWater ESTRATO Smoker FrecSport Age Sex Pollution_PM25) atmeans

*Tener o haber tenido Asma
probit HoHAsth i.PastAct i.CLASE_PR i.GreenZone i.AirProbOth i.AirProbInd i.DirtyStreet i.BadWater i.ESTRATO i.Smoker i.FrecSport Age Sex Pollution_PM25
*Usando Clase_PR en lugar de PastAct (Alternativa no viable por la predicción)
probit HoHAsth i.CLASE_PR i.GreenZone i.AirProbOth i.AirProbInd i.DirtyStreet i.BadWater i.ESTRATO i.Smoker i.FrecSport Age Sex Pollution_PM25
*Margins (APE) y (PEA)
margins, dydx(PastAct CLASE_PR GreenZone AirProbOth AirProbInd DirtyStreet BadWater ESTRATO Smoker FrecSport Age Sex Pollution_PM25)
margins, dydx(PastAct GreenZone AirProbOth AirProbInd DirtyStreet BadWater ESTRATO Smoker FrecSport Age Sex Pollution_PM25) atmeans

*Tener o haber tenido Alergia Crónica, como rinitis, conjuntivitis...
probit HoHAlle i.PastAct i.CLASE_PR i.GreenZone i.AirProbOth i.AirProbInd i.DirtyStreet i.BadWater i.ESTRATO i.Smoker i.FrecSport Age Sex Pollution_PM25
*Usando Clase_PR en lugar de PastAct (Alternativa no viable por la predicción)
probit HoHAlle i.CLASE_PR i.GreenZone i.AirProbOth i.AirProbInd i.DirtyStreet i.BadWater i.ESTRATO i.Smoker i.FrecSport Age Sex Pollution_PM25
*Margins (APE) y (PEA)
margins, dydx(PastAct CLASE_PR GreenZone AirProbOth AirProbInd DirtyStreet BadWater ESTRATO Smoker FrecSport Age Sex Pollution_PM25)
margins, dydx(PastAct GreenZone AirProbOth AirProbInd DirtyStreet BadWater ESTRATO Smoker FrecSport Age Sex Pollution_PM25) atmeans

*Tener o haber tenido Bronquitis Crónica, enfisema enfermedad pulmonar...
probit HoHOth i.PastAct i.CLASE_PR i.GreenZone i.AirProbOth i.AirProbInd i.DirtyStreet i.BadWater i.ESTRATO i.Smoker i.FrecSport Age Sex Pollution_PM25
*Usando Clase_PR en lugar de PastAct (Alternativa no viable por la predicción)
probit HoHOth i.CLASE_PR i.GreenZone i.AirProbOth i.AirProbInd i.DirtyStreet i.BadWater i.ESTRATO i.Smoker i.FrecSport Age Sex Pollution_PM25
*Margins (APE) y (PEA)
margins, dydx(PastAct CLASE_PR GreenZone AirProbOth AirProbInd DirtyStreet BadWater ESTRATO Smoker FrecSport Age Sex Pollution_PM25)
margins, dydx(PastAct GreenZone AirProbOth AirProbInd DirtyStreet BadWater ESTRATO Smoker FrecSport Age Sex Pollution_PM25) atmeans

*Margins
*APE 
margins, dydx(PastAct GreenZone AirProbOth AirProbInd DirtyStreet BadWater ESTRATO Smoker FrecSport Age Sex Pollution_PM25)
*PEA
margins, dydx(PastAct GreenZone AirProbOth AirProbInd DirtyStreet BadWater ESTRATO Smoker FrecSport Age Sex Pollution_PM25) atmeans

*Prediction
predict xb

*gen byte Cont = xb>0.5 & xb!=.
gen byte Cont=0
replace Cont =1 if xb>0.5

*Etiquetado de variables de predicciones

label variable Cont " Prediction of HoH"
label variable Cont1 " Prediction of HoHAng"
label variable Cont2 " Prediction of HoHAsth"
label variable Cont3 " Prediction of HoHAlle"
label variable Cont4 " Prediction of HoHOth"
label define Cont 0 "xb>0.5 & xb!=." 1 " xb<0.5"
label values Cont Cont
label define Cont1 0 "xb1>0.5 & xb1!=." 1 " xb1<0.5"
label values Cont1 Cont1
label define Cont2 0 "xb2>0.5 & xb2!=." 1 " xb2<0.5"
label values Cont2 Cont2
label define Cont3 0 "xb3>0.5 & xb3!=." 1 " xb3<0.5"
label values Cont3 Cont3
label define Cont4 0 "xb4>0.5 & xb4!=." 1 " xb4<0.5"
label values Cont4 Cont4

*Posible solución para mejorar los datos de la predicción.
*drop if xb == .

*Goodness-of-fit
estat gof
