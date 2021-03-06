EESchema Schematic File Version 2
LIBS:tinkerforge
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Industrial Digital In 4"
Date "28 nov 2012"
Rev "1.0"
Comp "Tinkerforge GmbH"
Comment1 "Licensed under CERN OHL v.1.1"
Comment2 "Copyright (©) 2012, B.Nordmeyer <bastian@tinkerforge.com>"
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 1100 6850 0    60   ~ 0
Copyright Tinkerforge GmbH 2012.\nThis documentation describes Open Hardware and is licensed under the\nCERN OHL v. 1.1.\nYou may redistribute and modify this documentation under the terms of the\nCERN OHL v.1.1. (http://ohwr.org/cernohl). This documentation is distributed\nWITHOUT ANY EXPRESS OR IMPLIED WARRANTY, INCLUDING OF\nMERCHANTABILITY, SATISFACTORY QUALITY AND FITNESS FOR A\nPARTICULAR PURPOSE. Please see the CERN OHL v.1.1 for applicable\nconditions\n
Wire Wire Line
	1450 3850 1450 3800
Connection ~ 3150 2450
Wire Wire Line
	3200 2450 3150 2450
Connection ~ 4000 2800
Wire Wire Line
	4000 3100 4000 2700
Wire Wire Line
	4000 2700 3950 2700
Wire Wire Line
	4000 3000 3950 3000
Wire Wire Line
	3950 2900 4100 2900
Wire Wire Line
	4100 2900 4100 3250
Wire Wire Line
	4100 3250 1900 3250
Wire Wire Line
	3150 2900 2400 2900
Wire Wire Line
	2400 2900 2400 3050
Wire Wire Line
	2400 3050 1900 3050
Wire Wire Line
	2050 3350 1900 3350
Wire Wire Line
	2050 3550 1900 3550
Wire Wire Line
	1900 3650 2050 3650
Wire Wire Line
	1900 3450 2050 3450
Wire Wire Line
	1900 2950 2050 2950
Wire Wire Line
	2050 2950 2050 2550
Wire Wire Line
	1900 3150 2500 3150
Wire Wire Line
	2500 3150 2500 3000
Wire Wire Line
	2500 3000 3150 3000
Wire Wire Line
	3150 2450 3150 2700
Wire Wire Line
	4000 2800 3950 2800
Connection ~ 4000 3000
Wire Wire Line
	3600 2500 3600 2450
Wire Wire Line
	1900 2850 2200 2850
Wire Wire Line
	2200 2850 2200 2900
$Comp
L GND #PWR01
U 1 1 50066B39
P 1450 3850
F 0 "#PWR01" H 1450 3850 30  0001 C CNN
F 1 "GND" H 1450 3780 30  0001 C CNN
F 2 "" H 1450 3850 60  0001 C CNN
F 3 "" H 1450 3850 60  0001 C CNN
	1    1450 3850
	1    0    0    -1  
$EndComp
$Comp
L DRILL U4
U 1 1 5006691C
P 10650 7000
F 0 "U4" H 10700 7050 60  0001 C CNN
F 1 "DRILL" H 10650 7000 60  0000 C CNN
F 2 "DRILL_NP" H 10650 7000 60  0001 C CNN
F 3 "" H 10650 7000 60  0001 C CNN
	1    10650 7000
	1    0    0    -1  
$EndComp
$Comp
L DRILL U3
U 1 1 5006691A
P 10650 6750
F 0 "U3" H 10700 6800 60  0001 C CNN
F 1 "DRILL" H 10650 6750 60  0000 C CNN
F 2 "DRILL_NP" H 10650 6750 60  0001 C CNN
F 3 "" H 10650 6750 60  0001 C CNN
	1    10650 6750
	1    0    0    -1  
$EndComp
$Comp
L DRILL U5
U 1 1 50066918
P 11000 6750
F 0 "U5" H 11050 6800 60  0001 C CNN
F 1 "DRILL" H 11000 6750 60  0000 C CNN
F 2 "DRILL_NP" H 11000 6750 60  0001 C CNN
F 3 "" H 11000 6750 60  0001 C CNN
	1    11000 6750
	1    0    0    -1  
$EndComp
$Comp
L DRILL U6
U 1 1 50066905
P 11000 7000
F 0 "U6" H 11050 7050 60  0001 C CNN
F 1 "DRILL" H 11000 7000 60  0000 C CNN
F 2 "DRILL_NP" H 11000 7000 60  0001 C CNN
F 3 "" H 11000 7000 60  0001 C CNN
	1    11000 7000
	1    0    0    -1  
$EndComp
$Comp
L CONN_8 P2
U 1 1 50065B8F
P 8350 4900
F 0 "P2" V 8300 4900 60  0000 C CNN
F 1 "Digital Input" V 8400 4900 60  0000 C CNN
F 2 "OQ_8P" H 8350 4900 60  0001 C CNN
F 3 "" H 8350 4900 60  0001 C CNN
	1    8350 4900
	1    0    0    -1  
$EndComp
NoConn ~ 1900 2750
$Comp
L GND #PWR02
U 1 1 500657B2
P 2200 2900
F 0 "#PWR02" H 2200 2900 30  0001 C CNN
F 1 "GND" H 2200 2830 30  0001 C CNN
F 2 "" H 2200 2900 60  0001 C CNN
F 3 "" H 2200 2900 60  0001 C CNN
	1    2200 2900
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 50065789
P 3400 2450
F 0 "C1" H 3450 2550 50  0000 L CNN
F 1 "100nF" H 3450 2350 50  0000 L CNN
F 2 "C0603" H 3400 2450 60  0001 C CNN
F 3 "" H 3400 2450 60  0001 C CNN
	1    3400 2450
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR03
U 1 1 50065776
P 3600 2500
F 0 "#PWR03" H 3600 2500 30  0001 C CNN
F 1 "GND" H 3600 2430 30  0001 C CNN
F 2 "" H 3600 2500 60  0001 C CNN
F 3 "" H 3600 2500 60  0001 C CNN
	1    3600 2500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 5006576B
P 4000 3100
F 0 "#PWR04" H 4000 3100 30  0001 C CNN
F 1 "GND" H 4000 3030 30  0001 C CNN
F 2 "" H 4000 3100 60  0001 C CNN
F 3 "" H 4000 3100 60  0001 C CNN
	1    4000 3100
	1    0    0    -1  
$EndComp
NoConn ~ 3150 2800
$Comp
L 3V3 #PWR05
U 1 1 5004F8A3
P 5000 3650
F 0 "#PWR05" H 5000 3750 40  0001 C CNN
F 1 "3V3" H 5000 3775 40  0000 C CNN
F 2 "" H 5000 3650 60  0001 C CNN
F 3 "" H 5000 3650 60  0001 C CNN
	1    5000 3650
	1    0    0    -1  
$EndComp
$Comp
L 3V3 #PWR06
U 1 1 5004F89B
P 3150 2450
F 0 "#PWR06" H 3150 2550 40  0001 C CNN
F 1 "3V3" H 3150 2575 40  0000 C CNN
F 2 "" H 3150 2450 60  0001 C CNN
F 3 "" H 3150 2450 60  0001 C CNN
	1    3150 2450
	1    0    0    -1  
$EndComp
$Comp
L 3V3 #PWR07
U 1 1 5004F895
P 2050 2550
F 0 "#PWR07" H 2050 2650 40  0001 C CNN
F 1 "3V3" H 2050 2675 40  0000 C CNN
F 2 "" H 2050 2550 60  0001 C CNN
F 3 "" H 2050 2550 60  0001 C CNN
	1    2050 2550
	1    0    0    -1  
$EndComp
$Comp
L R_PACK4 RP1
U 1 1 5004F86D
P 5200 4000
F 0 "RP1" H 5200 4450 40  0000 C CNN
F 1 "10k" H 5200 3950 40  0000 C CNN
F 2 "0603X4" H 5200 4000 60  0001 C CNN
F 3 "" H 5200 4000 60  0001 C CNN
	1    5200 4000
	0    -1   -1   0   
$EndComp
Text GLabel 2050 3650 2    60   Input ~ 0
INPUT4
Text GLabel 2050 3550 2    60   Input ~ 0
INPUT3
Text GLabel 2050 3450 2    60   Input ~ 0
INPUT2
Text GLabel 2050 3350 2    60   Input ~ 0
INPUT1
Text GLabel 4550 5250 0    60   Output ~ 0
INPUT4
Text GLabel 4550 4950 0    60   Output ~ 0
INPUT3
Text GLabel 4550 4650 0    60   Output ~ 0
INPUT2
Text GLabel 4550 4350 0    60   Output ~ 0
INPUT1
$Comp
L GND #PWR08
U 1 1 5004F7F0
P 5250 5800
F 0 "#PWR08" H 5250 5800 30  0001 C CNN
F 1 "GND" H 5250 5730 30  0001 C CNN
F 2 "" H 5250 5800 60  0001 C CNN
F 3 "" H 5250 5800 60  0001 C CNN
	1    5250 5800
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 5004F77D
P 6450 5250
F 0 "R4" V 6350 5250 50  0000 C CNN
F 1 "4.7k" V 6450 5250 50  0000 C CNN
F 2 "R1210" H 6450 5250 60  0001 C CNN
F 3 "" H 6450 5250 60  0001 C CNN
	1    6450 5250
	0    -1   -1   0   
$EndComp
$Comp
L R R3
U 1 1 5004F77B
P 6450 4950
F 0 "R3" V 6350 4950 50  0000 C CNN
F 1 "4.7k" V 6450 4950 50  0000 C CNN
F 2 "R1210" H 6450 4950 60  0001 C CNN
F 3 "" H 6450 4950 60  0001 C CNN
	1    6450 4950
	0    -1   -1   0   
$EndComp
$Comp
L R R2
U 1 1 5004F778
P 6450 4650
F 0 "R2" V 6350 4650 50  0000 C CNN
F 1 "4.7k" V 6450 4650 50  0000 C CNN
F 2 "R1210" H 6450 4650 60  0001 C CNN
F 3 "" H 6450 4650 60  0001 C CNN
	1    6450 4650
	0    -1   -1   0   
$EndComp
$Comp
L R R1
U 1 1 5004F767
P 6450 4350
F 0 "R1" V 6350 4350 50  0000 C CNN
F 1 "4.7k" V 6450 4350 50  0000 C CNN
F 2 "R1210" H 6450 4350 60  0001 C CNN
F 3 "" H 6450 4350 60  0001 C CNN
	1    6450 4350
	0    -1   -1   0   
$EndComp
$Comp
L LTV-847 U2
U 1 1 5004F732
P 5700 4950
F 0 "U2" H 5400 5850 60  0000 C CNN
F 1 "LTV846S" H 5700 4050 60  0001 C CNN
F 2 "OPTO-SMD16" H 5700 4950 60  0001 C CNN
F 3 "" H 5700 4950 60  0001 C CNN
	1    5700 4950
	-1   0    0    -1  
$EndComp
$Comp
L CON-SENSOR P1
U 1 1 5004F5E5
P 1450 3200
F 0 "P1" H 1650 3750 60  0000 C CNN
F 1 "CON-SENSOR" V 1650 3200 60  0000 C CNN
F 2 "CON-SENSOR" H 1450 3200 60  0001 C CNN
F 3 "" H 1450 3200 60  0001 C CNN
	1    1450 3200
	-1   0    0    -1  
$EndComp
$Comp
L CAT24C U1
U 1 1 5004F5DC
P 3550 3100
F 0 "U1" H 3400 3600 60  0000 C CNN
F 1 "M24C64" H 3550 3100 60  0000 C CNN
F 2 "SOIC8" H 3550 3100 60  0001 C CNN
F 3 "" H 3550 3100 60  0001 C CNN
	1    3550 3100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6000 4350 6200 4350
Wire Wire Line
	6000 4650 6200 4650
Wire Wire Line
	6000 4950 6200 4950
Wire Wire Line
	6000 5250 6200 5250
Wire Wire Line
	6700 4350 7450 4350
Wire Wire Line
	6000 4550 7350 4550
Wire Wire Line
	6700 4650 7250 4650
Wire Wire Line
	6000 4850 8000 4850
Wire Wire Line
	6700 4950 8000 4950
Wire Wire Line
	8000 4550 7450 4550
Wire Wire Line
	7450 4550 7450 4350
Wire Wire Line
	7350 4550 7350 4650
Wire Wire Line
	7350 4650 8000 4650
Wire Wire Line
	7250 4650 7250 4750
Wire Wire Line
	7250 4750 8000 4750
Wire Wire Line
	8000 5050 7250 5050
Wire Wire Line
	7250 5050 7250 5150
Wire Wire Line
	7250 5150 6000 5150
Wire Wire Line
	6700 5250 7350 5250
Wire Wire Line
	7350 5250 7350 5150
Wire Wire Line
	7350 5150 8000 5150
Wire Wire Line
	8000 5250 7450 5250
Wire Wire Line
	7450 5250 7450 5450
Wire Wire Line
	7450 5450 6000 5450
Wire Wire Line
	5400 4550 5250 4550
Wire Wire Line
	5250 4550 5250 5800
Wire Wire Line
	5400 4850 5250 4850
Connection ~ 5250 4850
Wire Wire Line
	5400 5150 5250 5150
Connection ~ 5250 5150
Wire Wire Line
	5400 5450 5250 5450
Wire Wire Line
	5250 5450 5250 5500
Connection ~ 5250 5500
Wire Wire Line
	4850 3800 5150 3800
Connection ~ 4950 3800
Connection ~ 5050 3800
Wire Wire Line
	5000 3650 5000 3800
Connection ~ 5000 3800
Wire Wire Line
	4550 5250 5400 5250
Wire Wire Line
	5400 4950 4550 4950
Wire Wire Line
	4550 4650 5400 4650
Wire Wire Line
	4550 4350 5400 4350
Wire Wire Line
	5150 4200 5150 5250
Connection ~ 5150 5250
Wire Wire Line
	5050 4200 5050 4950
Connection ~ 5050 4950
Wire Wire Line
	4950 4200 4950 4650
Connection ~ 4950 4650
Wire Wire Line
	4850 4200 4850 4350
Connection ~ 4850 4350
$EndSCHEMATC
