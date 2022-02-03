EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_02x25_Odd_Even JCNB103
U 1 1 603243F2
P 1500 2250
F 0 "JCNB103" H 1550 3667 50  0000 C CNN
F 1 "System" H 1550 3576 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x25_P2.54mm_Horizontal" H 1500 2250 50  0001 C CNN
F 3 "~" H 1500 2250 50  0001 C CNN
	1    1500 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 1150 1000 1150
Wire Wire Line
	1300 1250 1000 1250
Wire Wire Line
	1300 1350 1000 1350
Wire Wire Line
	1300 1450 1000 1450
Wire Wire Line
	1800 1450 2100 1450
Wire Wire Line
	1800 1350 2100 1350
Wire Wire Line
	1800 1250 2100 1250
Wire Wire Line
	1800 1150 2100 1150
Text Label 1000 1150 0    50   ~ 0
D0
Text Label 1000 1250 0    50   ~ 0
D2
Text Label 1000 1350 0    50   ~ 0
D4
Text Label 1000 1450 0    50   ~ 0
D6
Text Label 2100 1150 2    50   ~ 0
D1
Text Label 2100 1250 2    50   ~ 0
D3
Text Label 2100 1350 2    50   ~ 0
D5
Text Label 2100 1450 2    50   ~ 0
D7
$Comp
L Device:R_Network08 RA102
U 1 1 6032EBCD
P 3550 1450
F 0 "RA102" H 3250 1650 50  0000 L CNN
F 1 "8x 220R" H 3600 1650 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 4025 1450 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 3550 1450 50  0001 C CNN
	1    3550 1450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR05
U 1 1 603321A6
P 3150 1250
F 0 "#PWR05" H 3150 1100 50  0001 C CNN
F 1 "+5V" H 3165 1423 50  0000 C CNN
F 2 "" H 3150 1250 50  0001 C CNN
F 3 "" H 3150 1250 50  0001 C CNN
	1    3150 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 2650 3850 1650
Connection ~ 3850 2650
Wire Wire Line
	3850 2650 2550 2650
Wire Wire Line
	3750 2750 3750 1650
Connection ~ 3750 2750
Wire Wire Line
	3750 2750 2550 2750
Wire Wire Line
	3650 2850 3650 1650
Connection ~ 3650 2850
Wire Wire Line
	3650 2850 2550 2850
Wire Wire Line
	2550 3050 3450 3050
Wire Wire Line
	2550 3150 3350 3150
Wire Wire Line
	2550 3250 3250 3250
Wire Wire Line
	2550 3350 3150 3350
Wire Wire Line
	3550 2950 3550 1650
Connection ~ 3550 2950
Wire Wire Line
	3550 2950 2550 2950
Wire Wire Line
	3450 3050 3450 1650
Connection ~ 3450 3050
Wire Wire Line
	3350 3150 3350 1650
Connection ~ 3350 3150
Wire Wire Line
	3250 3250 3250 1650
Connection ~ 3250 3250
Wire Wire Line
	3150 1650 3150 3350
Connection ~ 3150 3350
Text Label 2550 2650 0    50   ~ 0
D7
Text Label 2550 2750 0    50   ~ 0
D6
Text Label 2550 2850 0    50   ~ 0
D5
Text Label 2550 2950 0    50   ~ 0
D4
Text Label 2550 3050 0    50   ~ 0
D3
Text Label 2550 3150 0    50   ~ 0
D2
Text Label 2550 3250 0    50   ~ 0
D1
Text Label 2550 3350 0    50   ~ 0
D0
Wire Wire Line
	1800 2050 2100 2050
$Comp
L Device:R R142
U 1 1 6033A8B4
P 2900 1450
F 0 "R142" V 2800 1450 50  0000 L CNN
F 1 "4k7" V 2900 1400 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 2830 1450 50  0001 C CNN
F 3 "~" H 2900 1450 50  0001 C CNN
	1    2900 1450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR04
U 1 1 6033AF22
P 2900 1250
F 0 "#PWR04" H 2900 1100 50  0001 C CNN
F 1 "+5V" H 2915 1423 50  0000 C CNN
F 2 "" H 2900 1250 50  0001 C CNN
F 3 "" H 2900 1250 50  0001 C CNN
	1    2900 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 1250 2900 1300
Text Label 2100 2050 2    50   ~ 0
OUTDV2
Wire Wire Line
	1800 1050 2100 1050
Text Label 1000 1050 0    50   ~ 0
GND
Text Label 2100 1050 2    50   ~ 0
GND
$Comp
L power:GND #PWR01
U 1 1 60345583
P 1250 1000
F 0 "#PWR01" H 1250 750 50  0001 C CNN
F 1 "GND" H 1255 827 50  0000 C CNN
F 2 "" H 1250 1000 50  0001 C CNN
F 3 "" H 1250 1000 50  0001 C CNN
	1    1250 1000
	-1   0    0    1   
$EndComp
Wire Wire Line
	1000 1050 1250 1050
Wire Wire Line
	1250 1000 1250 1050
Connection ~ 1250 1050
Wire Wire Line
	1250 1050 1300 1050
$Comp
L Device:R_Network08 RA101
U 1 1 6034DDCF
P 5550 1450
F 0 "RA101" H 5250 1650 50  0000 L CNN
F 1 "8x 4k7" H 5600 1650 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 6025 1450 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 5550 1450 50  0001 C CNN
	1    5550 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 1650 5850 2650
$Comp
L power:+5V #PWR011
U 1 1 60358099
P 5150 1250
F 0 "#PWR011" H 5150 1100 50  0001 C CNN
F 1 "+5V" H 5165 1423 50  0000 C CNN
F 2 "" H 5150 1250 50  0001 C CNN
F 3 "" H 5150 1250 50  0001 C CNN
	1    5150 1250
	1    0    0    -1  
$EndComp
$Comp
L TA8-FDC-rescue:µPD765A-my_lib2 LSI101
U 1 1 60362649
P 8000 4250
F 0 "LSI101" H 8000 5843 60  0000 C CNN
F 1 "µPD765A" H 8000 5737 60  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_LongPads" H 8000 5631 60  0000 C CNN
F 3 "" H 7450 4750 60  0000 C CNN
	1    8000 4250
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS07 IC119
U 1 1 60385C76
P 12500 8200
F 0 "IC119" H 12600 8350 50  0000 C CNN
F 1 "LS07" H 12450 8200 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 12500 8200 50  0001 C CNN
F 3 "www.ti.com/lit/ds/symlink/sn74ls07.pdf" H 12500 8200 50  0001 C CNN
	1    12500 8200
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS07 IC119
U 2 1 603891DD
P 4750 2200
F 0 "IC119" H 4900 2050 50  0000 C CNN
F 1 "LS07" H 4700 2200 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4750 2200 50  0001 C CNN
F 3 "www.ti.com/lit/ds/symlink/sn74ls07.pdf" H 4750 2200 50  0001 C CNN
	2    4750 2200
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74LS07 IC119
U 4 1 6038BF45
P 12500 9400
F 0 "IC119" H 12600 9550 50  0000 C CNN
F 1 "LS07" H 12450 9400 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 12500 9400 50  0001 C CNN
F 3 "www.ti.com/lit/ds/symlink/sn74ls07.pdf" H 12500 9400 50  0001 C CNN
	4    12500 9400
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS07 IC119
U 5 1 6038CFE2
P 12500 9000
F 0 "IC119" H 12600 9150 50  0000 C CNN
F 1 "LS07" H 12450 9000 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 12500 9000 50  0001 C CNN
F 3 "www.ti.com/lit/ds/symlink/sn74ls07.pdf" H 12500 9000 50  0001 C CNN
	5    12500 9000
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS07 IC119
U 6 1 6038E277
P 12500 8600
F 0 "IC119" H 12600 8750 50  0000 C CNN
F 1 "LS07" H 12450 8600 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 12500 8600 50  0001 C CNN
F 3 "www.ti.com/lit/ds/symlink/sn74ls07.pdf" H 12500 8600 50  0001 C CNN
	6    12500 8600
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS07 IC119
U 7 1 6038FEF0
P 14250 2400
F 0 "IC119" V 14150 2250 50  0000 L CNN
F 1 "LS07" V 14350 2300 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 14250 2400 50  0001 C CNN
F 3 "www.ti.com/lit/ds/symlink/sn74ls07.pdf" H 14250 2400 50  0001 C CNN
	7    14250 2400
	0    1    1    0   
$EndComp
Wire Wire Line
	1800 2450 2100 2450
Text Label 2550 1800 0    50   ~ 0
DRQ2
Text Label 2100 2450 2    50   ~ 0
DRQ2
Wire Wire Line
	2550 2200 4450 2200
Connection ~ 5150 3350
Wire Wire Line
	5150 3350 5750 3350
Connection ~ 5350 3150
Wire Wire Line
	5350 3150 5950 3150
Connection ~ 5450 3050
Connection ~ 5550 2950
Connection ~ 5650 2850
Connection ~ 5850 2650
Wire Wire Line
	5650 1650 5650 2850
Wire Wire Line
	5550 1650 5550 2950
Wire Wire Line
	5450 1650 5450 3050
Wire Wire Line
	5350 1650 5350 3150
Wire Wire Line
	5750 2750 5750 1650
Connection ~ 5750 2750
Wire Wire Line
	3850 2650 4050 2650
Wire Wire Line
	3750 2750 4050 2750
Wire Wire Line
	3650 2850 4050 2850
Wire Wire Line
	3550 2950 4050 2950
Wire Wire Line
	3450 3050 4050 3050
Wire Wire Line
	3350 3150 4050 3150
Wire Wire Line
	3250 3250 4050 3250
Wire Wire Line
	3150 3350 4050 3350
Text Label 2100 2150 2    50   ~ 0
~EXTINT1
Wire Wire Line
	1800 2150 2100 2150
Text Label 2550 2200 0    50   ~ 0
~EXTINT1
Wire Wire Line
	5150 1650 5150 3350
Wire Wire Line
	2550 1800 4450 1800
$Comp
L 74xx:74LS07 IC119
U 3 1 6038A9C8
P 4750 1800
F 0 "IC119" H 4900 1650 50  0000 C CNN
F 1 "LS07" H 4700 1800 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4750 1800 50  0001 C CNN
F 3 "www.ti.com/lit/ds/symlink/sn74ls07.pdf" H 4750 1800 50  0001 C CNN
	3    4750 1800
	-1   0    0    1   
$EndComp
$Comp
L TA8-FDC-rescue:74LS368-my_lib2 IC108
U 2 1 603EB364
P 6250 2200
F 0 "IC108" H 6350 2350 50  0000 C CNN
F 1 "74LS368" H 6450 2100 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 6250 2200 50  0001 C CNN
F 3 "" H 6250 2200 50  0001 C CNN
	2    6250 2200
	-1   0    0    -1  
$EndComp
$Comp
L TA8-FDC-rescue:74LS368-my_lib2 IC108
U 3 1 603EC21E
P 11150 6050
F 0 "IC108" H 11300 5900 50  0000 C CNN
F 1 "74LS368" H 11350 6150 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 11150 6050 50  0001 C CNN
F 3 "" H 11150 6050 50  0001 C CNN
	3    11150 6050
	-1   0    0    1   
$EndComp
$Comp
L TA8-FDC-rescue:74LS368-my_lib2 IC108
U 4 1 603ED7D7
P 2300 6200
F 0 "IC108" H 2300 6450 50  0000 C CNN
F 1 "74LS368" H 2400 6350 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 2300 6200 50  0001 C CNN
F 3 "" H 2300 6200 50  0001 C CNN
	4    2300 6200
	1    0    0    -1  
$EndComp
$Comp
L TA8-FDC-rescue:74LS368-my_lib2 IC108
U 5 1 603EEA15
P 6850 2550
F 0 "IC108" H 7100 2400 50  0000 C CNN
F 1 "74LS368" H 6950 2700 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 6850 2550 50  0001 C CNN
F 3 "" H 6850 2550 50  0001 C CNN
	5    6850 2550
	-1   0    0    -1  
$EndComp
$Comp
L TA8-FDC-rescue:74LS368-my_lib2 IC108
U 6 1 603F0440
P 7000 6950
F 0 "IC108" H 7000 6633 50  0000 C CNN
F 1 "74LS368" H 7000 6724 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 7000 6950 50  0001 C CNN
F 3 "" H 7000 6950 50  0001 C CNN
	6    7000 6950
	-1   0    0    1   
$EndComp
$Comp
L TA8-FDC-rescue:74LS368-my_lib2 IC108
U 7 1 603F195C
P 15400 2900
F 0 "IC108" V 15300 2750 50  0000 L CNN
F 1 "74LS368" V 15500 2700 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 15400 2900 50  0001 C CNN
F 3 "" H 15400 2900 50  0001 C CNN
	7    15400 2900
	0    1    1    0   
$EndComp
Text Label 2550 1600 0    50   ~ 0
OUTDV2
Wire Wire Line
	5050 2200 5950 2200
Wire Wire Line
	7450 4250 7250 4250
$Comp
L 74xx:74LS08 IC112
U 1 1 6042E9D1
P 10250 6650
F 0 "IC112" H 10300 6450 50  0000 C CNN
F 1 "LS08" H 10250 6650 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 10250 6650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 10250 6650 50  0001 C CNN
	1    10250 6650
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74LS08 IC112
U 2 1 6042FFE2
P 10250 6150
F 0 "IC112" H 10300 5950 50  0000 C CNN
F 1 "LS08" H 10250 6150 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 10250 6150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 10250 6150 50  0001 C CNN
	2    10250 6150
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74LS08 IC112
U 3 1 604336F5
P 6950 1800
F 0 "IC112" H 6900 1500 50  0000 C CNN
F 1 "LS08" H 6900 1600 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 6950 1800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 6950 1800 50  0001 C CNN
	3    6950 1800
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74LS08 IC112
U 4 1 60436CCF
P 4350 4200
F 0 "IC112" H 4100 4200 50  0000 R CNN
F 1 "LS08" H 4450 4200 50  0000 R CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4350 4200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 4350 4200 50  0001 C CNN
	4    4350 4200
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 IC112
U 5 1 6043A910
P 14250 1900
F 0 "IC112" V 14150 1750 50  0000 L CNN
F 1 "LS08" V 14350 1800 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 14250 1900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 14250 1900 50  0001 C CNN
	5    14250 1900
	0    1    1    0   
$EndComp
Wire Wire Line
	4250 3750 3500 3750
Wire Wire Line
	7450 3950 4050 3950
$Comp
L 74xx:74LS02 IC110
U 1 1 6046C4F9
P 3100 4450
F 0 "IC110" H 3100 4650 50  0000 C CNN
F 1 "LS02" H 3100 4450 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 3100 4450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls02" H 3100 4450 50  0001 C CNN
	1    3100 4450
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS02 IC110
U 2 1 6046CFD4
P 2350 4450
F 0 "IC110" H 2350 4650 50  0000 C CNN
F 1 "LS02" H 2350 4450 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 2350 4450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls02" H 2350 4450 50  0001 C CNN
	2    2350 4450
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS02 IC110
U 3 1 6046F851
P 3100 4950
F 0 "IC110" H 3100 4750 50  0000 C CNN
F 1 "LS02" H 3100 4950 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 3100 4950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls02" H 3100 4950 50  0001 C CNN
	3    3100 4950
	1    0    0    1   
$EndComp
$Comp
L 74xx:74LS02 IC110
U 4 1 6047447E
P 3100 5900
F 0 "IC110" H 3100 6100 50  0000 C CNN
F 1 "LS02" H 3100 5900 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 3100 5900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls02" H 3100 5900 50  0001 C CNN
	4    3100 5900
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS02 IC110
U 5 1 604771FA
P 15400 3900
F 0 "IC110" V 15300 3750 50  0000 L CNN
F 1 "LS02" V 15500 3800 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 15400 3900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls02" H 15400 3900 50  0001 C CNN
	5    15400 3900
	0    1    1    0   
$EndComp
Wire Wire Line
	6450 2650 6450 3050
Wire Wire Line
	6450 3050 7450 3050
Wire Wire Line
	5850 2650 6450 2650
Wire Wire Line
	6350 2750 6350 3150
Wire Wire Line
	6350 3150 7450 3150
Wire Wire Line
	5750 2750 6350 2750
Wire Wire Line
	6250 2850 6250 3250
Wire Wire Line
	6250 3250 7450 3250
Wire Wire Line
	5650 2850 6250 2850
Wire Wire Line
	6150 2950 6150 3350
Wire Wire Line
	6150 3350 7450 3350
Wire Wire Line
	5550 2950 6150 2950
Wire Wire Line
	6050 3050 6050 3450
Wire Wire Line
	6050 3450 7450 3450
Wire Wire Line
	5450 3050 6050 3050
Wire Wire Line
	5950 3150 5950 3550
Wire Wire Line
	5950 3550 7450 3550
Wire Wire Line
	5250 1650 5250 3250
Wire Wire Line
	5250 3250 5850 3250
Wire Wire Line
	5850 3250 5850 3650
Wire Wire Line
	5850 3650 7450 3650
Connection ~ 5250 3250
Wire Wire Line
	5750 3350 5750 3750
Wire Wire Line
	5750 3750 7450 3750
Wire Wire Line
	6550 2200 7250 2200
Connection ~ 6450 3050
Wire Wire Line
	6450 6950 6700 6950
Wire Wire Line
	6450 3050 6450 6950
$Comp
L Device:R_Network08 RA106
U 1 1 6050B208
P 8850 9800
F 0 "RA106" H 8550 10000 50  0000 L CNN
F 1 "8x 330R" H 8850 10000 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 9325 9800 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 8850 9800 50  0001 C CNN
	1    8850 9800
	0    -1   -1   0   
$EndComp
Text Label 900  3950 0    50   ~ 0
~DACK2
Text Label 2100 2550 2    50   ~ 0
~DACK2
Wire Wire Line
	2100 2550 1800 2550
Text Label 900  4450 0    50   ~ 0
~TC
Wire Wire Line
	1300 2550 1000 2550
Text Label 1000 2550 0    50   ~ 0
~TC
Text Label 900  4950 0    50   ~ 0
~SIOR
Wire Wire Line
	1800 1750 2100 1750
Text Label 2100 1750 2    50   ~ 0
~SIOR
Text Label 900  5450 0    50   ~ 0
~RD
Text Label 2100 1950 2    50   ~ 0
~RD
Wire Wire Line
	2100 1950 1800 1950
Text Label 900  5950 0    50   ~ 0
~SIOW
Wire Wire Line
	900  6450 1250 6450
Wire Wire Line
	1300 1850 1000 1850
Text Label 1000 1850 0    50   ~ 0
~WR
Text Label 1000 1750 0    50   ~ 0
~SIOW
Wire Wire Line
	1300 1750 1000 1750
Text Label 900  6450 0    50   ~ 0
~WR
Wire Wire Line
	900  6950 1250 6950
Text Label 900  6950 0    50   ~ 0
~IORQ
Wire Wire Line
	1300 1950 1000 1950
Text Label 1000 1950 0    50   ~ 0
~IORQ
Text Label 900  7450 0    50   ~ 0
A7
Wire Wire Line
	900  7450 1250 7450
Text Label 900  7950 0    50   ~ 0
A6
Text Label 900  8450 0    50   ~ 0
A5
Wire Wire Line
	900  8450 1300 8450
Text Label 900  8950 0    50   ~ 0
A4
Wire Wire Line
	900  8950 1300 8950
Text Label 900  9450 0    50   ~ 0
A3
Wire Wire Line
	900  9450 1300 9450
Wire Wire Line
	900  9950 1300 9950
Text Label 900  9950 0    50   ~ 0
A0
$Comp
L Device:C C1
U 1 1 606782F3
P 3550 10300
F 0 "C1" H 3665 10346 50  0000 L CNN
F 1 "C" H 3665 10255 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D4.0mm_P2.00mm" H 3588 10150 50  0001 C CNN
F 3 "~" H 3550 10300 50  0001 C CNN
	1    3550 10300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 10450 3950 10450
Connection ~ 3550 10450
$Comp
L power:+5V #PWR06
U 1 1 6068755A
P 3450 10150
F 0 "#PWR06" H 3450 10000 50  0001 C CNN
F 1 "+5V" V 3465 10278 50  0000 L CNN
F 2 "" H 3450 10150 50  0001 C CNN
F 3 "" H 3450 10150 50  0001 C CNN
	1    3450 10150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3450 10150 3550 10150
Text Label 900  10450 0    50   ~ 0
~RESET
Wire Wire Line
	1300 3150 1000 3150
Text Label 1000 3150 0    50   ~ 0
A7
Wire Wire Line
	1800 3150 2100 3150
Text Label 2100 3150 2    50   ~ 0
A6
Wire Wire Line
	1300 3250 1000 3250
Wire Wire Line
	1800 3250 2100 3250
Wire Wire Line
	1300 3350 1000 3350
Wire Wire Line
	1800 3450 2100 3450
Text Label 1000 3250 0    50   ~ 0
A5
Text Label 2100 3250 2    50   ~ 0
A4
Text Label 2100 3450 2    50   ~ 0
A0
Text Label 1000 3350 0    50   ~ 0
A3
Wire Wire Line
	1800 1550 2100 1550
Text Label 2100 1550 2    50   ~ 0
~RESET
Wire Wire Line
	900  4450 1250 4450
Wire Wire Line
	900  4950 1250 4950
Wire Wire Line
	900  5450 1250 5450
Wire Wire Line
	900  5950 1250 5950
Wire Wire Line
	900  3950 1250 3950
$Comp
L Device:R_Network08 RA3
U 1 1 606DB2C8
P 9800 9800
F 0 "RA3" H 9500 10000 50  0000 L CNN
F 1 "8x 220R" H 9800 10000 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 10275 9800 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 9800 9800 50  0001 C CNN
	1    9800 9800
	0    1    -1   0   
$EndComp
Wire Wire Line
	9600 10200 9050 10200
Text Label 9450 10200 2    50   ~ 0
~DACK2
Wire Wire Line
	9600 10100 9050 10100
Text Label 9450 10100 2    50   ~ 0
~TC
Wire Wire Line
	9600 10000 9050 10000
Wire Wire Line
	9600 9900 9050 9900
Wire Wire Line
	9600 9800 9050 9800
Wire Wire Line
	9600 9700 9050 9700
Wire Wire Line
	9600 9600 9050 9600
Wire Wire Line
	9600 9500 9050 9500
Text Label 9450 10000 2    50   ~ 0
~SIOR
Text Label 9450 9900 2    50   ~ 0
~RD
Text Label 9450 9800 2    50   ~ 0
~SIOW
Text Label 9450 9700 2    50   ~ 0
~WR
Text Label 9450 9600 2    50   ~ 0
~IORQ
Text Label 9450 9500 2    50   ~ 0
A7
$Comp
L Device:R_Network08 RA2
U 1 1 60719A7B
P 9800 8850
F 0 "RA2" H 9500 9050 50  0000 L CNN
F 1 "8x 220R" H 9800 9050 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 10275 8850 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 9800 8850 50  0001 C CNN
	1    9800 8850
	0    1    -1   0   
$EndComp
$Comp
L Device:R_Network08 RA1
U 1 1 6071B7B0
P 8850 8850
F 0 "RA1" H 8550 9050 50  0000 L CNN
F 1 "8x 330R" H 8850 9050 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 9325 8850 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 8850 8850 50  0001 C CNN
	1    8850 8850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9050 9250 9600 9250
Wire Wire Line
	9050 9150 9600 9150
Wire Wire Line
	9050 9050 9600 9050
Text Label 9450 9250 2    50   ~ 0
A6
Text Label 9450 9150 2    50   ~ 0
A5
Text Label 9450 8950 2    50   ~ 0
A3
Text Label 9450 8850 2    50   ~ 0
A0
Text Label 9450 8750 2    50   ~ 0
~RESET
Wire Wire Line
	9050 8950 9600 8950
Wire Wire Line
	9600 8850 9050 8850
Wire Wire Line
	9600 8750 9050 8750
Text Label 9450 9050 2    50   ~ 0
A4
$Comp
L power:+5V #PWR025
U 1 1 60753089
P 10100 10300
F 0 "#PWR025" H 10100 10150 50  0001 C CNN
F 1 "+5V" H 10115 10473 50  0000 C CNN
F 2 "" H 10100 10300 50  0001 C CNN
F 3 "" H 10100 10300 50  0001 C CNN
	1    10100 10300
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR021
U 1 1 60753593
P 8550 10300
F 0 "#PWR021" H 8550 10050 50  0001 C CNN
F 1 "GND" H 8555 10127 50  0000 C CNN
F 2 "" H 8550 10300 50  0001 C CNN
F 3 "" H 8550 10300 50  0001 C CNN
	1    8550 10300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 9250 8550 9250
Wire Wire Line
	8550 9250 8550 10200
Wire Wire Line
	8650 10200 8550 10200
Connection ~ 8550 10200
Wire Wire Line
	8550 10200 8550 10300
Wire Wire Line
	10000 9250 10100 9250
Wire Wire Line
	10100 9250 10100 10200
Wire Wire Line
	10000 10200 10100 10200
Connection ~ 10100 10200
Wire Wire Line
	10100 10200 10100 10300
$Comp
L 74xx:74LS10 IC105
U 1 1 6077F7C0
P 6950 10350
F 0 "IC105" H 6950 10675 50  0000 C CNN
F 1 "LS10" H 6950 10584 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 6950 10350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS10" H 6950 10350 50  0001 C CNN
	1    6950 10350
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS10 IC105
U 2 1 607819E5
P 3550 7950
F 0 "IC105" H 3550 7633 50  0000 C CNN
F 1 "LS10" H 3550 7724 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 3550 7950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS10" H 3550 7950 50  0001 C CNN
	2    3550 7950
	1    0    0    1   
$EndComp
$Comp
L 74xx:74LS10 IC105
U 3 1 607843C0
P 2350 7950
F 0 "IC105" H 2350 7633 50  0000 C CNN
F 1 "LS10" H 2350 7724 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 2350 7950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS10" H 2350 7950 50  0001 C CNN
	3    2350 7950
	1    0    0    1   
$EndComp
$Comp
L 74xx:74LS10 IC105
U 4 1 607870F4
P 15400 1900
F 0 "IC105" V 15300 1750 50  0000 L CNN
F 1 "LS10" V 15500 1800 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 15400 1900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS10" H 15400 1900 50  0001 C CNN
	4    15400 1900
	0    1    1    0   
$EndComp
Wire Wire Line
	2050 7950 1850 7950
Wire Wire Line
	2050 7850 2000 7850
Wire Wire Line
	2000 7850 2000 7450
Wire Wire Line
	2000 7450 1850 7450
Wire Wire Line
	2050 8050 2000 8050
$Comp
L 74xx:74LS14 IC113
U 1 1 607B2516
P 12450 2450
F 0 "IC113" H 12550 2250 50  0000 C CNN
F 1 "LS14" H 12550 2600 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 12450 2450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS14" H 12450 2450 50  0001 C CNN
	1    12450 2450
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74LS14 IC113
U 2 1 607B3B6F
P 12500 6250
F 0 "IC113" H 12600 6100 50  0000 C CNN
F 1 "LS14" H 12650 6350 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 12500 6250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS14" H 12500 6250 50  0001 C CNN
	2    12500 6250
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74LS14 IC113
U 3 1 607B63ED
P 12500 6750
F 0 "IC113" H 12600 6600 50  0000 C CNN
F 1 "LS14" H 12650 6850 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 12500 6750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS14" H 12500 6750 50  0001 C CNN
	3    12500 6750
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74LS14 IC113
U 4 1 607B9271
P 2950 7950
F 0 "IC113" H 2950 8267 50  0000 C CNN
F 1 "LS14" H 2950 8176 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 2950 7950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS14" H 2950 7950 50  0001 C CNN
	4    2950 7950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS14 IC113
U 5 1 607BC474
P 12500 7250
F 0 "IC113" H 12600 7100 50  0000 C CNN
F 1 "LS14" H 12650 7350 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 12500 7250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS14" H 12500 7250 50  0001 C CNN
	5    12500 7250
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74LS14 IC113
U 6 1 607BEF8F
P 12500 7750
F 0 "IC113" H 12600 7600 50  0000 C CNN
F 1 "LS14" H 12650 7850 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 12500 7750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS14" H 12500 7750 50  0001 C CNN
	6    12500 7750
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74LS14 IC113
U 7 1 607C156E
P 14250 3900
F 0 "IC113" V 14150 3750 50  0000 L CNN
F 1 "LS14" V 14350 3800 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 14250 3900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS14" H 14250 3900 50  0001 C CNN
	7    14250 3900
	0    1    1    0   
$EndComp
Wire Wire Line
	1900 8950 2025 8950
$Comp
L 74xx:74LS139 IC106
U 3 1 60835A5B
P 14250 2900
F 0 "IC106" V 14150 2750 50  0000 L CNN
F 1 "LS139" V 14350 2800 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 14250 2900 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74ls139a.pdf" H 14250 2900 50  0001 C CNN
	3    14250 2900
	0    1    1    0   
$EndComp
Wire Wire Line
	3850 7950 3900 7950
Wire Wire Line
	4050 7650 4050 7500
$Comp
L power:+5V #PWR07
U 1 1 60980317
P 4050 7500
F 0 "#PWR07" H 4050 7350 50  0001 C CNN
F 1 "+5V" H 4065 7673 50  0000 C CNN
F 2 "" H 4050 7500 50  0001 C CNN
F 3 "" H 4050 7500 50  0001 C CNN
	1    4050 7500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 4350 2800 3950
Connection ~ 2800 3950
Wire Wire Line
	1850 5950 1950 5950
Wire Wire Line
	2800 5800 1950 5800
Wire Wire Line
	1950 5800 1950 5950
Wire Wire Line
	1850 6450 1950 6450
Wire Wire Line
	1950 6200 2000 6200
Wire Wire Line
	2600 6200 2750 6200
Wire Wire Line
	2750 6200 2750 6000
Wire Wire Line
	2750 6000 2800 6000
Wire Wire Line
	6350 2750 6350 2550
Wire Wire Line
	6350 2550 6550 2550
Wire Wire Line
	7250 2200 7250 2550
Connection ~ 6350 2750
Wire Wire Line
	6850 2800 6850 4100
Wire Wire Line
	7450 4450 3400 4450
Wire Wire Line
	2650 4450 2650 4550
Wire Wire Line
	4050 4100 4050 3950
Connection ~ 4050 3950
Wire Wire Line
	4050 3950 2800 3950
Connection ~ 3900 7950
Wire Wire Line
	1850 4950 1850 4700
Wire Wire Line
	1850 4700 2700 4700
Wire Wire Line
	1850 4450 2050 4450
Wire Wire Line
	2050 4450 2050 4350
Wire Wire Line
	2050 4450 2050 4550
Connection ~ 2050 4450
Wire Wire Line
	1850 5450 1950 5450
Wire Wire Line
	1950 5450 1950 5050
Wire Wire Line
	1950 5050 2050 5050
Wire Wire Line
	2650 4550 2800 4550
$Comp
L power:GND #PWR03
U 1 1 60D4AF06
P 2450 5300
F 0 "#PWR03" H 2450 5050 50  0001 C CNN
F 1 "GND" H 2455 5127 50  0000 C CNN
F 2 "" H 2450 5300 50  0001 C CNN
F 3 "" H 2450 5300 50  0001 C CNN
	1    2450 5300
	0    -1   -1   0   
$EndComp
Connection ~ 1950 5450
Wire Wire Line
	2450 5300 2350 5300
Wire Wire Line
	3500 3750 3500 4550
Wire Wire Line
	3500 4550 7450 4550
$Comp
L 74xx:74LS32 IC103
U 1 1 60E1E9EC
P 12450 1800
F 0 "IC103" H 12450 2050 50  0000 C CNN
F 1 "LS32" H 12450 1800 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 12450 1800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 12450 1800 50  0001 C CNN
	1    12450 1800
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 IC103
U 2 1 60E2380B
P 12400 800
F 0 "IC103" H 12400 1050 50  0000 C CNN
F 1 "LS32" H 12400 800 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 12400 800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 12400 800 50  0001 C CNN
	2    12400 800 
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 IC103
U 4 1 60E29617
P 6000 8300
F 0 "IC103" H 6000 8550 50  0000 C CNN
F 1 "LS32" H 6000 8300 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 6000 8300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 6000 8300 50  0001 C CNN
	4    6000 8300
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 IC103
U 5 1 60E2B8AB
P 15400 2400
F 0 "IC103" V 15300 2250 50  0000 L CNN
F 1 "LS32" V 15500 2300 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 15400 2400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 15400 2400 50  0001 C CNN
	5    15400 2400
	0    1    1    0   
$EndComp
Wire Wire Line
	2700 4700 2700 4850
Wire Wire Line
	2700 4850 2800 4850
Wire Wire Line
	2650 5050 2800 5050
Wire Wire Line
	3400 4950 3500 4950
Wire Wire Line
	3500 4950 3500 4550
Connection ~ 3500 4550
Wire Wire Line
	5100 5550 5100 4100
Wire Wire Line
	5100 4100 6850 4100
Wire Wire Line
	5250 7850 5250 4750
Wire Wire Line
	5250 4750 7450 4750
Wire Wire Line
	5550 4850 7450 4850
$Comp
L 74xx:74LS74 IC102
U 1 1 60F87868
P 7000 9000
F 0 "IC102" H 6750 9300 50  0000 C CNN
F 1 "LS74" H 7200 9300 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7000 9000 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 7000 9000 50  0001 C CNN
	1    7000 9000
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS74 IC102
U 2 1 60F89FF8
P 7000 7850
F 0 "IC102" H 6750 8150 50  0000 C CNN
F 1 "LS74" H 7250 8150 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7000 7850 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 7000 7850 50  0001 C CNN
	2    7000 7850
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS74 IC102
U 3 1 60F8CC83
P 14250 3400
F 0 "IC102" V 14150 3250 50  0000 L CNN
F 1 "LS74" V 14350 3300 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 14250 3400 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 14250 3400 50  0001 C CNN
	3    14250 3400
	0    1    1    0   
$EndComp
Wire Wire Line
	4550 10450 6650 10450
$Comp
L power:GND #PWR08
U 1 1 60FB077B
P 4400 10700
F 0 "#PWR08" H 4400 10450 50  0001 C CNN
F 1 "GND" H 4405 10527 50  0000 C CNN
F 2 "" H 4400 10700 50  0001 C CNN
F 3 "" H 4400 10700 50  0001 C CNN
	1    4400 10700
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR013
U 1 1 60FB0C60
P 7000 8150
F 0 "#PWR013" H 7000 8000 50  0001 C CNN
F 1 "+5V" H 7015 8323 50  0000 C CNN
F 2 "" H 7000 8150 50  0001 C CNN
F 3 "" H 7000 8150 50  0001 C CNN
	1    7000 8150
	-1   0    0    1   
$EndComp
Wire Wire Line
	4400 10700 4250 10700
Wire Wire Line
	6450 6950 6450 7750
Connection ~ 6450 6950
Connection ~ 6350 3150
Wire Wire Line
	6700 7750 6450 7750
$Comp
L power:+5V #PWR012
U 1 1 60FFC96F
P 7000 7550
F 0 "#PWR012" H 7000 7400 50  0001 C CNN
F 1 "+5V" H 7015 7723 50  0000 C CNN
F 2 "" H 7000 7550 50  0001 C CNN
F 3 "" H 7000 7550 50  0001 C CNN
	1    7000 7550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR014
U 1 1 60FFDEED
P 7000 8700
F 0 "#PWR014" H 7000 8550 50  0001 C CNN
F 1 "+5V" H 7015 8873 50  0000 C CNN
F 2 "" H 7000 8700 50  0001 C CNN
F 3 "" H 7000 8700 50  0001 C CNN
	1    7000 8700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 8900 6700 8900
Wire Wire Line
	6350 3150 6350 8900
Wire Wire Line
	5400 8400 5400 7950
Connection ~ 5400 7950
Wire Wire Line
	4050 7750 4050 8050
Wire Wire Line
	5150 7950 5400 7950
Wire Wire Line
	5150 7850 5250 7850
Wire Wire Line
	4150 7650 4050 7650
Wire Wire Line
	4150 7750 4050 7750
Wire Wire Line
	3900 7950 4150 7950
$Comp
L 74xx:74LS139 IC106
U 1 1 60831AA9
P 4650 7750
F 0 "IC106" H 4650 8117 50  0000 C CNN
F 1 "LS139" H 4650 8026 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 4650 7750 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74ls139a.pdf" H 4650 7750 50  0001 C CNN
	1    4650 7750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 5450 4400 5450
Wire Wire Line
	5000 5550 5100 5550
$Comp
L 74xx:74LS32 IC103
U 3 1 60E268E0
P 4700 5550
F 0 "IC103" H 4750 5750 50  0000 C CNN
F 1 "LS32" H 4700 5550 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4700 5550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 4700 5550 50  0001 C CNN
	3    4700 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 5650 4350 5650
Wire Wire Line
	4350 5650 4350 5750
Wire Wire Line
	6600 9000 6700 9000
Wire Wire Line
	7300 7750 7500 7750
Wire Wire Line
	7500 9500 7000 9500
Wire Wire Line
	7000 9500 7000 9300
Wire Wire Line
	7000 9500 6600 9500
Wire Wire Line
	6600 9500 6600 10250
Wire Wire Line
	6600 10350 6650 10350
Connection ~ 7000 9500
Wire Wire Line
	6650 10250 6600 10250
Connection ~ 6600 10250
Wire Wire Line
	6600 10250 6600 10350
Wire Wire Line
	7250 10350 7700 10350
Wire Wire Line
	7700 10350 7700 6400
Wire Wire Line
	7700 6400 7250 6400
Wire Wire Line
	7250 6400 7250 4950
Wire Wire Line
	7250 4950 7450 4950
$Comp
L power:GND #PWR015
U 1 1 612F7FBE
P 7700 5850
F 0 "#PWR015" H 7700 5600 50  0001 C CNN
F 1 "GND" H 7705 5677 50  0000 C CNN
F 2 "" H 7700 5850 50  0001 C CNN
F 3 "" H 7700 5850 50  0001 C CNN
	1    7700 5850
	0    1    1    0   
$EndComp
$Comp
L Device:C C2
U 1 1 613602B0
P 8000 5850
F 0 "C2" V 8100 5950 50  0000 C CNN
F 1 "100nF" V 7850 5850 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 8038 5700 50  0001 C CNN
F 3 "~" H 8000 5850 50  0001 C CNN
	1    8000 5850
	0    1    1    0   
$EndComp
Wire Wire Line
	7800 5750 7800 5850
Wire Wire Line
	7800 5850 7850 5850
Wire Wire Line
	7800 5850 7700 5850
Connection ~ 7800 5850
$Comp
L power:+5V #PWR018
U 1 1 6139E961
P 8300 5850
F 0 "#PWR018" H 8300 5700 50  0001 C CNN
F 1 "+5V" H 8315 6023 50  0000 C CNN
F 2 "" H 8300 5850 50  0001 C CNN
F 3 "" H 8300 5850 50  0001 C CNN
	1    8300 5850
	0    1    1    0   
$EndComp
Wire Wire Line
	8300 5850 8200 5850
Wire Wire Line
	8200 5750 8200 5850
Connection ~ 8200 5850
Wire Wire Line
	8200 5850 8150 5850
$Comp
L Device:C C3
U 1 1 613CC109
P 8000 6200
F 0 "C3" V 8100 6300 50  0000 C CNN
F 1 "10µF" V 7839 6200 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D4.0mm_P2.00mm" H 8038 6050 50  0001 C CNN
F 3 "~" H 8000 6200 50  0001 C CNN
	1    8000 6200
	0    1    1    0   
$EndComp
Wire Wire Line
	8200 5850 8200 6200
Wire Wire Line
	8200 6200 8150 6200
Wire Wire Line
	7800 5850 7800 6200
Wire Wire Line
	7800 6200 7850 6200
Wire Wire Line
	7150 2550 7250 2550
Connection ~ 7250 2550
Wire Wire Line
	7250 2550 7250 4250
$Comp
L TA8-FDC-rescue:74LS621-my_lib2 IC107
U 1 1 60374590
P 4450 3000
F 0 "IC107" H 4450 3731 50  0000 C CNN
F 1 "74LS621" H 4450 3640 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 4440 3060 50  0001 C CNN
F 3 "" H 4440 3060 50  0001 C CNN
	1    4450 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 2650 5850 2650
Wire Wire Line
	4850 2750 5750 2750
Wire Wire Line
	4850 2850 5650 2850
Wire Wire Line
	4850 2950 5550 2950
Wire Wire Line
	4850 3050 5450 3050
Wire Wire Line
	4850 3150 5350 3150
Wire Wire Line
	4850 3250 5250 3250
Wire Wire Line
	4850 3350 5150 3350
$Comp
L power:GND #PWR010
U 1 1 604611B5
P 4450 3750
F 0 "#PWR010" H 4450 3500 50  0001 C CNN
F 1 "GND" H 4350 3650 50  0000 C CNN
F 2 "" H 4450 3750 50  0001 C CNN
F 3 "" H 4450 3750 50  0001 C CNN
	1    4450 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 4300 3900 4625
Wire Wire Line
	4650 4200 4650 3750
$Comp
L power:+5V #PWR09
U 1 1 6053F5BC
P 4450 2450
F 0 "#PWR09" H 4450 2300 50  0001 C CNN
F 1 "+5V" H 4465 2623 50  0000 C CNN
F 2 "" H 4450 2450 50  0001 C CNN
F 3 "" H 4450 2450 50  0001 C CNN
	1    4450 2450
	1    0    0    -1  
$EndComp
$Comp
L TA8-FDC-rescue:SED-9420C-my_lib2 IC10
U 1 1 603B5692
P 9900 2650
F 0 "IC10" H 10300 2900 60  0000 C CNN
F 1 "LS74" V 9900 2050 60  0000 C CNN
F 2 "Package_DIP:DIP-24_W15.24mm_LongPads" H 9350 2050 60  0000 C CNN
F 3 "" H 9350 2050 60  0000 C CNN
	1    9900 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 3050 8800 3050
Connection ~ 8800 3050
Wire Wire Line
	8800 3050 9350 3050
Wire Wire Line
	8550 3150 8650 3150
Connection ~ 8650 3150
Wire Wire Line
	8650 3150 9350 3150
Wire Wire Line
	8550 3250 9100 3250
Wire Wire Line
	9100 3250 9100 4150
Connection ~ 9100 3250
Wire Wire Line
	9100 3250 9350 3250
Wire Wire Line
	8550 3350 9350 3350
Wire Wire Line
	8550 3450 9350 3450
Wire Wire Line
	8550 3550 9350 3550
Wire Wire Line
	8550 3650 9350 3650
Wire Wire Line
	9350 3750 8750 3750
Wire Wire Line
	8750 3750 8750 7400
$Comp
L Device:Crystal CY101
U 1 1 60519459
P 9900 1800
F 0 "CY101" H 9900 2068 50  0000 C CNN
F 1 "1MHz" H 9900 1977 50  0000 C CNN
F 2 "Crystal:Crystal_HC49-4H_Vertical" H 9900 1800 50  0001 C CNN
F 3 "~" H 9900 1800 50  0001 C CNN
	1    9900 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R108
U 1 1 6051B772
P 9900 2100
F 0 "R108" V 9800 2100 50  0000 C CNN
F 1 "1M" V 9900 2100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9830 2100 50  0001 C CNN
F 3 "~" H 9900 2100 50  0001 C CNN
	1    9900 2100
	0    1    1    0   
$EndComp
Wire Wire Line
	10050 2300 10050 2100
Wire Wire Line
	10050 1800 10050 2100
Connection ~ 10050 2100
Wire Wire Line
	9750 2300 9750 2100
Wire Wire Line
	9750 2100 9750 1800
Connection ~ 9750 2100
$Comp
L Device:C C104
U 1 1 6057B2A0
P 10250 1950
F 0 "C104" V 10300 2050 50  0000 L CNN
F 1 "22p" H 10300 1850 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 10288 1800 50  0001 C CNN
F 3 "~" H 10250 1950 50  0001 C CNN
	1    10250 1950
	1    0    0    -1  
$EndComp
$Comp
L Device:C C107
U 1 1 6057B843
P 9550 1950
F 0 "C107" V 9500 2050 50  0000 L CNN
F 1 "22p" H 9350 1850 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 9588 1800 50  0001 C CNN
F 3 "~" H 9550 1950 50  0001 C CNN
	1    9550 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR024
U 1 1 6057E0D1
P 9550 2100
F 0 "#PWR024" H 9550 1850 50  0001 C CNN
F 1 "GND" H 9555 1927 50  0000 C CNN
F 2 "" H 9550 2100 50  0001 C CNN
F 3 "" H 9550 2100 50  0001 C CNN
	1    9550 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	10250 1800 10050 1800
Connection ~ 10050 1800
Wire Wire Line
	9750 1800 9550 1800
Connection ~ 9750 1800
$Comp
L power:+5V #PWR022
U 1 1 605AF5D3
P 9050 1800
F 0 "#PWR022" H 9050 1650 50  0001 C CNN
F 1 "+5V" H 9065 1973 50  0000 C CNN
F 2 "" H 9050 1800 50  0001 C CNN
F 3 "" H 9050 1800 50  0001 C CNN
	1    9050 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C106
U 1 1 605AFA70
P 9050 2050
F 0 "C106" V 8900 2100 50  0000 L CNN
F 1 "100nF" V 8900 1750 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 9088 1900 50  0001 C CNN
F 3 "~" H 9050 2050 50  0001 C CNN
	1    9050 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 1900 9050 1850
Wire Wire Line
	9050 1850 9250 1850
Wire Wire Line
	9250 1850 9250 2500
Wire Wire Line
	9250 2650 9350 2650
Connection ~ 9050 1850
Wire Wire Line
	9050 1850 9050 1800
Wire Wire Line
	9350 2850 9050 2850
Wire Wire Line
	9050 2850 9050 2800
$Comp
L Device:R R101
U 1 1 605F967C
P 9050 2650
F 0 "R101" V 9150 2650 50  0000 C CNN
F 1 "3k3" V 9050 2650 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 8980 2650 50  0001 C CNN
F 3 "~" H 9050 2650 50  0001 C CNN
	1    9050 2650
	-1   0    0    1   
$EndComp
Wire Wire Line
	9050 2500 9250 2500
Connection ~ 9250 2500
Wire Wire Line
	9250 2500 9250 2650
Wire Wire Line
	9350 2950 9050 2950
Wire Wire Line
	9050 2950 9050 2850
Connection ~ 9050 2850
Text Label 13400 2450 2    50   ~ 0
~READ_DATA
Text Label 13450 3650 2    50   ~ 0
~MOTOR_ON
Wire Wire Line
	8550 4450 10850 4450
Wire Wire Line
	8550 4550 10450 4550
Text Label 13400 4100 2    50   ~ 0
~WRITE_DATA
$Comp
L 74xx:74LS06 IC117
U 2 1 607FF097
P 12500 5750
F 0 "IC117" H 12600 5900 50  0000 C CNN
F 1 "LS06" H 12450 5750 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 12500 5750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS06" H 12500 5750 50  0001 C CNN
	2    12500 5750
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS06 IC117
U 3 1 608026E9
P 12500 4100
F 0 "IC117" H 12600 4250 50  0000 C CNN
F 1 "LS06" H 12450 4100 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 12500 4100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS06" H 12500 4100 50  0001 C CNN
	3    12500 4100
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS06 IC117
U 5 1 60808EF4
P 12500 4950
F 0 "IC117" H 12600 5100 50  0000 C CNN
F 1 "LS06" H 12450 4950 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 12500 4950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS06" H 12500 4950 50  0001 C CNN
	5    12500 4950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS06 IC117
U 6 1 6080BBF5
P 12500 3650
F 0 "IC117" H 12550 3850 50  0000 C CNN
F 1 "LS06" H 12450 3650 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 12500 3650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS06" H 12500 3650 50  0001 C CNN
	6    12500 3650
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS06 IC117
U 7 1 6080E907
P 15400 1300
F 0 "IC117" V 15300 1150 50  0000 L CNN
F 1 "LS06" V 15500 1200 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 15400 1300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS06" H 15400 1300 50  0001 C CNN
	7    15400 1300
	0    1    1    0   
$EndComp
$Comp
L 74xx:74LS06 IC117
U 1 1 607FD1C4
P 12500 5350
F 0 "IC117" H 12600 5500 50  0000 C CNN
F 1 "LS06" H 12450 5350 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 12500 5350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS06" H 12500 5350 50  0001 C CNN
	1    12500 5350
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS06 IC117
U 4 1 60805EB7
P 12500 4550
F 0 "IC117" H 12600 4700 50  0000 C CNN
F 1 "LS06" H 12450 4550 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 12500 4550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS06" H 12500 4550 50  0001 C CNN
	4    12500 4550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR023
U 1 1 603AB513
P 9050 2200
F 0 "#PWR023" H 9050 1950 50  0001 C CNN
F 1 "GND" H 9055 2027 50  0000 C CNN
F 2 "" H 9050 2200 50  0001 C CNN
F 3 "" H 9050 2200 50  0001 C CNN
	1    9050 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 1700 7500 1700
Wire Wire Line
	5050 1800 6650 1800
Wire Wire Line
	7250 1900 7400 1900
Wire Wire Line
	7400 1900 7400 2700
Wire Wire Line
	7400 2700 8650 2700
Connection ~ 8650 2700
Wire Wire Line
	8650 2700 8650 3150
Wire Wire Line
	10450 2650 10550 2650
$Comp
L Device:R R103
U 1 1 606E0940
P 10950 3800
F 0 "R103" V 11050 3800 50  0000 C CNN
F 1 "1M" V 10950 3800 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 10880 3800 50  0001 C CNN
F 3 "~" H 10950 3800 50  0001 C CNN
	1    10950 3800
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR029
U 1 1 606E147C
P 11150 3800
F 0 "#PWR029" H 11150 3650 50  0001 C CNN
F 1 "+5V" H 11165 3973 50  0000 C CNN
F 2 "" H 11150 3800 50  0001 C CNN
F 3 "" H 11150 3800 50  0001 C CNN
	1    11150 3800
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR030
U 1 1 606E1F8D
P 11150 4000
F 0 "#PWR030" H 11150 3750 50  0001 C CNN
F 1 "GND" H 11155 3827 50  0000 C CNN
F 2 "" H 11150 4000 50  0001 C CNN
F 3 "" H 11150 4000 50  0001 C CNN
	1    11150 4000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	11100 3800 11150 3800
Wire Wire Line
	12150 4250 12150 4100
Wire Wire Line
	12150 4100 12200 4100
Wire Wire Line
	8550 4250 12150 4250
$Comp
L Device:C C101
U 1 1 606DF73C
P 10950 4000
F 0 "C101" V 10900 4150 50  0000 C CNN
F 1 "10µF" V 11000 3850 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D4.0mm_P2.00mm" H 10988 3850 50  0001 C CNN
F 3 "~" H 10950 4000 50  0001 C CNN
	1    10950 4000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	11150 4000 11100 4000
Wire Wire Line
	10800 3800 10800 3850
$Comp
L Device:R R102
U 1 1 609F0F3C
P 11700 3850
F 0 "R102" V 11800 3850 50  0000 C CNN
F 1 "560K" V 11600 3850 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 11630 3850 50  0001 C CNN
F 3 "~" H 11700 3850 50  0001 C CNN
	1    11700 3850
	-1   0    0    1   
$EndComp
Wire Wire Line
	11700 4150 11700 4000
Wire Wire Line
	9100 4150 11700 4150
$Comp
L Device:D D101
U 1 1 60A34B2E
P 11700 3050
F 0 "D101" V 11800 3250 50  0000 R CNN
F 1 "D-???" H 11800 2950 50  0000 R CNN
F 2 "Diode_THT:D_DO-15_P10.16mm_Horizontal" H 11700 3050 50  0001 C CNN
F 3 "~" H 11700 3050 50  0001 C CNN
	1    11700 3050
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C103
U 1 1 60A533AE
P 10750 3450
F 0 "C103" V 10650 3600 50  0000 C CNN
F 1 "0.01" V 10850 3300 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 10788 3300 50  0001 C CNN
F 3 "~" H 10750 3450 50  0001 C CNN
	1    10750 3450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10800 3850 10450 3850
Connection ~ 10800 3850
Wire Wire Line
	10800 3850 10800 4000
$Comp
L Device:C C102
U 1 1 60ACEB9F
P 11250 3450
F 0 "C102" V 11150 3300 50  0000 C CNN
F 1 "4700p" V 11350 3250 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 11288 3300 50  0001 C CNN
F 3 "~" H 11250 3450 50  0001 C CNN
	1    11250 3450
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR028
U 1 1 60B83C4F
P 11000 3450
F 0 "#PWR028" H 11000 3200 50  0001 C CNN
F 1 "GND" H 10900 3350 50  0000 C CNN
F 2 "" H 11000 3450 50  0001 C CNN
F 3 "" H 11000 3450 50  0001 C CNN
	1    11000 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	10900 3450 11000 3450
Wire Wire Line
	11000 3450 11100 3450
Connection ~ 11000 3450
$Comp
L Device:R R107
U 1 1 60C278D2
P 10800 3150
F 0 "R107" V 10850 3350 50  0000 C CNN
F 1 "3K3" V 10800 3150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 10730 3150 50  0001 C CNN
F 3 "~" H 10800 3150 50  0001 C CNN
	1    10800 3150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10650 3150 10450 3150
$Comp
L Device:R R105
U 1 1 60CCF317
P 10800 2950
F 0 "R105" V 10900 2950 50  0000 C CNN
F 1 "150K" V 10800 2950 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 10730 2950 50  0001 C CNN
F 3 "~" H 10800 2950 50  0001 C CNN
	1    10800 2950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10450 3650 10650 3650
Wire Wire Line
	11700 3200 11700 3450
Wire Wire Line
	11400 3450 11700 3450
Connection ~ 11700 3450
Wire Wire Line
	11700 3450 11700 3700
Wire Wire Line
	10600 3450 10450 3450
Wire Wire Line
	10450 3450 10450 3350
Wire Wire Line
	10450 3250 11250 3250
Wire Wire Line
	10950 3150 11250 3150
Wire Wire Line
	11250 3250 11250 3150
Wire Wire Line
	11250 3150 11250 2950
Connection ~ 11250 3150
$Comp
L Device:R R104
U 1 1 60EF25FE
P 10800 2700
F 0 "R104" V 10900 2700 50  0000 C CNN
F 1 "33K" V 10800 2700 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 10730 2700 50  0001 C CNN
F 3 "~" H 10800 2700 50  0001 C CNN
	1    10800 2700
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C105
U 1 1 60EF2AB1
P 11100 2700
F 0 "C105" V 11200 2550 50  0000 C CNN
F 1 "470p" V 10950 2700 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 11138 2550 50  0001 C CNN
F 3 "~" H 11100 2700 50  0001 C CNN
	1    11100 2700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10550 2450 12150 2450
Wire Wire Line
	10450 2950 10600 2950
Wire Wire Line
	10600 2950 10600 2700
Wire Wire Line
	10600 2700 10650 2700
Connection ~ 10600 2950
Wire Wire Line
	10600 2950 10650 2950
Wire Wire Line
	10550 2450 10550 2650
$Comp
L Device:R R106
U 1 1 610F45D6
P 11500 2700
F 0 "R106" V 11600 2700 50  0000 C CNN
F 1 "2K2" V 11500 2700 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 11430 2700 50  0001 C CNN
F 3 "~" H 11500 2700 50  0001 C CNN
	1    11500 2700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	11250 2700 11350 2700
Wire Wire Line
	10950 2950 11250 2950
Wire Wire Line
	11250 2950 11250 2700
Connection ~ 11250 2700
Connection ~ 11250 2950
Wire Wire Line
	11650 2700 11700 2700
Wire Wire Line
	11700 2700 11700 2900
$Comp
L 74xx:74LS08 IC109
U 1 1 6126E624
P 11150 4650
F 0 "IC109" H 11250 4850 50  0000 C CNN
F 1 "LS08" H 11150 4650 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 11150 4650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 11150 4650 50  0001 C CNN
	1    11150 4650
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 IC109
U 2 1 61271FFF
P 12400 1225
F 0 "IC109" H 12400 1475 50  0000 C CNN
F 1 "LS08" H 12400 1225 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 12400 1225 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 12400 1225 50  0001 C CNN
	2    12400 1225
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 IC109
U 3 1 61274DC2
P 11850 4550
F 0 "IC109" H 12000 4750 50  0000 C CNN
F 1 "LS08" H 11850 4550 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 11850 4550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 11850 4550 50  0001 C CNN
	3    11850 4550
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 IC109
U 4 1 61278C45
P 11850 4950
F 0 "IC109" H 12000 5150 50  0000 C CNN
F 1 "LS08" H 11850 4950 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 11850 4950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 11850 4950 50  0001 C CNN
	4    11850 4950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 IC109
U 5 1 6127BDCE
P 14250 1400
F 0 "IC109" V 14150 1400 50  0000 C CNN
F 1 "LS08" V 14350 1400 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 14250 1400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 14250 1400 50  0001 C CNN
	5    14250 1400
	0    1    1    0   
$EndComp
Wire Wire Line
	11500 4350 11500 4450
Wire Wire Line
	8550 4350 11500 4350
Text Label 13400 4550 2    50   ~ 0
~STEP
Text Label 13400 4950 2    50   ~ 0
~DIRECTION
Wire Wire Line
	11450 4850 11450 4650
Wire Wire Line
	10450 5050 10450 4550
Text Label 13400 5350 2    50   ~ 0
~SIDE
Wire Wire Line
	12200 5350 10300 5350
Wire Wire Line
	8550 4650 10300 4650
Wire Wire Line
	10300 4650 10300 5350
Text Label 13400 5750 2    50   ~ 0
~WRITE_GATE
Wire Wire Line
	10150 5750 10150 4750
Wire Wire Line
	10150 4750 8550 4750
Wire Wire Line
	10150 5750 12200 5750
Text Label 13400 6250 2    50   ~ 0
~PROTECT
Text Label 13400 6750 2    50   ~ 0
~TRACK_0
$Comp
L power:+5V #PWR031
U 1 1 61A7E06D
P 12850 775
F 0 "#PWR031" H 12850 625 50  0001 C CNN
F 1 "+5V" V 12800 975 50  0000 C CNN
F 2 "" H 12850 775 50  0001 C CNN
F 3 "" H 12850 775 50  0001 C CNN
	1    12850 775 
	1    0    0    -1  
$EndComp
Wire Wire Line
	12750 2450 12850 2450
Connection ~ 12850 2450
Text Label 13400 7250 2    50   ~ 0
~INDEX
Text Label 13400 7750 2    50   ~ 0
~READY
Wire Wire Line
	12800 9400 13400 9400
Text Label 13400 8200 2    50   ~ 0
~DRIVE0
Text Label 13400 8600 2    50   ~ 0
~DRIVE1
Text Label 13400 9000 2    50   ~ 0
~DRIVE2
Text Label 13400 9400 2    50   ~ 0
~DRIVE3
Wire Wire Line
	11850 8300 11850 9400
Wire Wire Line
	11850 9400 12200 9400
Wire Wire Line
	12050 8100 12050 8600
Wire Wire Line
	12050 8600 12200 8600
Wire Wire Line
	11950 8200 11950 9000
Wire Wire Line
	11950 9000 12200 9000
$Comp
L power:GND #PWR027
U 1 1 62129598
P 10700 8350
F 0 "#PWR027" H 10700 8100 50  0001 C CNN
F 1 "GND" H 10705 8177 50  0000 C CNN
F 2 "" H 10700 8350 50  0001 C CNN
F 3 "" H 10700 8350 50  0001 C CNN
	1    10700 8350
	1    0    0    -1  
$EndComp
Wire Wire Line
	10700 8350 10700 8300
Wire Wire Line
	8550 4850 9950 4850
Wire Wire Line
	9950 4850 9950 6150
Wire Wire Line
	12200 6250 10550 6250
Wire Wire Line
	12200 4950 12150 4950
Wire Wire Line
	12200 4550 12150 4550
Wire Wire Line
	10450 5050 11550 5050
Wire Wire Line
	11500 4450 11550 4450
Wire Wire Line
	10850 4550 10850 4750
Wire Wire Line
	10850 4550 10850 4450
Connection ~ 10850 4550
Wire Wire Line
	11550 4650 11450 4650
Connection ~ 11450 4650
Wire Wire Line
	11550 4850 11450 4850
Wire Wire Line
	11450 4850 11450 6050
Connection ~ 11450 4850
Wire Wire Line
	10850 6050 10550 6050
Wire Wire Line
	12200 6750 10550 6750
Wire Wire Line
	10550 6550 11450 6550
Wire Wire Line
	11450 6550 11450 6050
Connection ~ 11450 6050
Wire Wire Line
	8550 4950 9750 4950
Wire Wire Line
	9750 4950 9750 6650
Wire Wire Line
	9750 6650 9950 6650
Connection ~ 10650 3650
Wire Wire Line
	10650 3650 10650 6950
Wire Wire Line
	6600 7850 6600 8300
Wire Wire Line
	7500 7750 7500 9500
Wire Wire Line
	6600 7850 6700 7850
Wire Wire Line
	6300 8300 6600 8300
Connection ~ 6600 8300
Wire Wire Line
	6600 8300 6600 9000
Wire Wire Line
	5400 8400 5700 8400
Wire Wire Line
	7300 6950 10650 6950
Wire Wire Line
	8550 5050 9550 5050
Wire Wire Line
	9550 5050 9550 7250
Wire Wire Line
	9550 7250 12200 7250
Wire Wire Line
	8550 5150 9350 5150
Wire Wire Line
	9350 5150 9350 7750
Wire Wire Line
	9350 7750 12200 7750
Wire Wire Line
	8550 5250 9150 5250
Wire Wire Line
	8550 5350 8950 5350
Wire Wire Line
	9150 5250 9150 8000
Wire Wire Line
	8950 5350 8950 8100
Wire Wire Line
	10650 3650 12200 3650
Text Notes 12650 2050 2    50   ~ 0
Spare Gates
Wire Wire Line
	3900 4300 4050 4300
Wire Wire Line
	2550 1600 2900 1600
Wire Wire Line
	12150 8200 12200 8200
Wire Wire Line
	12150 8000 12150 8200
Wire Wire Line
	11750 8300 11850 8300
Wire Wire Line
	10700 8300 10750 8300
Wire Wire Line
	10750 8100 8950 8100
Wire Wire Line
	10750 8000 9150 8000
Wire Wire Line
	11750 8000 12150 8000
Wire Wire Line
	11750 8100 12050 8100
Wire Wire Line
	11750 8200 11950 8200
$Comp
L 74xx:74LS139 IC106
U 2 1 608333F0
P 11250 8100
F 0 "IC106" H 11250 7750 50  0000 C CNN
F 1 "LS139" H 11250 8000 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 11250 8100 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74ls139a.pdf" H 11250 8100 50  0001 C CNN
	2    11250 8100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 9100 7900 9100
Wire Wire Line
	7900 9100 7900 7400
Wire Wire Line
	7900 7400 8750 7400
Text Notes 9500 10600 2    50   ~ 0
Termination\nSystem Bus
$Comp
L Connector_Generic:Conn_02x17_Odd_Even J1
U 1 1 61FAFFCE
P 15000 6050
F 0 "J1" H 15050 7067 50  0000 C CNN
F 1 "Conn_02x17_Odd_Even" H 15050 6976 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x17_P2.54mm_Vertical" H 15000 6050 50  0001 C CNN
F 3 "~" H 15000 6050 50  0001 C CNN
	1    15000 6050
	-1   0    0    -1  
$EndComp
Wire Wire Line
	15200 5250 15200 5350
Connection ~ 15200 5350
Wire Wire Line
	15200 5350 15200 5450
Connection ~ 15200 5450
Wire Wire Line
	15200 5450 15200 5550
Connection ~ 15200 5550
Wire Wire Line
	15200 5550 15200 5650
Connection ~ 15200 5650
Wire Wire Line
	15200 5650 15200 5750
Connection ~ 15200 5750
Wire Wire Line
	15200 5750 15200 5850
Connection ~ 15200 5850
Wire Wire Line
	15200 5850 15200 5950
Connection ~ 15200 5950
Wire Wire Line
	15200 5950 15200 6050
Connection ~ 15200 6050
Wire Wire Line
	15200 6050 15200 6150
Connection ~ 15200 6150
Wire Wire Line
	15200 6150 15200 6250
Connection ~ 15200 6250
Wire Wire Line
	15200 6250 15200 6350
Connection ~ 15200 6350
Wire Wire Line
	15200 6350 15200 6450
Connection ~ 15200 6450
Wire Wire Line
	15200 6450 15200 6550
Connection ~ 15200 6550
Wire Wire Line
	15200 6550 15200 6650
Connection ~ 15200 6650
Wire Wire Line
	15200 6650 15200 6750
Connection ~ 15200 6750
Wire Wire Line
	15200 6750 15200 6850
Connection ~ 15200 6850
Wire Wire Line
	15200 6850 15200 7050
$Comp
L power:GND #PWR036
U 1 1 6201AA66
P 15200 7050
F 0 "#PWR036" H 15200 6800 50  0001 C CNN
F 1 "GND" H 15205 6877 50  0000 C CNN
F 2 "" H 15200 7050 50  0001 C CNN
F 3 "" H 15200 7050 50  0001 C CNN
	1    15200 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	14025 5650 14700 5650
Wire Wire Line
	12800 8200 14025 8200
Wire Wire Line
	14025 5650 14025 8200
Wire Wire Line
	14075 8600 14075 5750
Wire Wire Line
	14075 5750 14700 5750
Wire Wire Line
	12800 8600 14075 8600
Wire Wire Line
	14125 9000 14125 5850
Wire Wire Line
	14125 5850 14700 5850
Wire Wire Line
	12800 9000 14125 9000
Wire Wire Line
	14250 6850 14700 6850
Wire Wire Line
	13725 3650 13725 5950
Wire Wire Line
	13725 5950 14700 5950
Wire Wire Line
	12800 3650 13725 3650
Wire Wire Line
	13400 9375 14050 9375
Wire Wire Line
	14050 9375 14050 5450
Wire Wire Line
	14050 5450 14700 5450
$Comp
L Device:R_Network07 RN1
U 1 1 62212BFD
P 13150 975
F 0 "RN1" H 13538 1021 50  0000 L CNN
F 1 "1K" H 13538 930 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP8" V 13625 975 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 13150 975 50  0001 C CNN
	1    13150 975 
	1    0    0    -1  
$EndComp
Wire Wire Line
	12850 1175 12850 2450
Wire Wire Line
	12800 6250 12950 6250
Wire Wire Line
	12950 1175 12950 6250
Connection ~ 12950 6250
Wire Wire Line
	13000 1175 13050 1175
Wire Wire Line
	13000 1175 13000 6750
Connection ~ 13000 6750
Wire Wire Line
	13150 1175 13150 1300
Wire Wire Line
	13150 1300 12900 1300
Wire Wire Line
	12900 1300 12900 7250
Connection ~ 12900 7250
Wire Wire Line
	12800 6750 13000 6750
Wire Wire Line
	12800 7250 12900 7250
Wire Wire Line
	13250 1175 13250 1375
Wire Wire Line
	13250 1375 13025 1375
Wire Wire Line
	13025 1375 13025 7750
Connection ~ 13025 7750
Wire Wire Line
	13025 7750 14250 7750
Wire Wire Line
	12800 7750 13025 7750
Wire Wire Line
	2000 8050 2000 8450
Wire Wire Line
	2000 8450 1900 8450
Wire Wire Line
	1850 3950 2800 3950
Wire Wire Line
	900  7950 1250 7950
$Comp
L 74xx:74LS244_Split U16
U 9 1 625562E6
P 15400 3400
F 0 "U16" V 15033 3400 50  0000 C CNN
F 1 "74LS244_Split" V 15124 3400 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 15400 3400 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74ls241.pdf" H 15400 3400 50  0001 C CNN
	9    15400 3400
	0    1    1    0   
$EndComp
Wire Wire Line
	14000 6750 14000 6450
Wire Wire Line
	14000 6450 14700 6450
Wire Wire Line
	13000 6750 14000 6750
Wire Wire Line
	14150 6250 14150 6550
Wire Wire Line
	14150 6550 14700 6550
Wire Wire Line
	12950 6250 14150 6250
Wire Wire Line
	13700 5750 13700 6350
Wire Wire Line
	13700 6350 14700 6350
Wire Wire Line
	12800 5750 13700 5750
Wire Wire Line
	13675 5350 13675 6800
Wire Wire Line
	13675 6800 14575 6800
Wire Wire Line
	14575 6800 14575 6750
Wire Wire Line
	14575 6750 14700 6750
Wire Wire Line
	12800 5350 13675 5350
Wire Wire Line
	13575 4100 13575 6200
Wire Wire Line
	13575 6200 14625 6200
Wire Wire Line
	14625 6200 14625 6250
Wire Wire Line
	14625 6250 14700 6250
Wire Wire Line
	12800 4100 13575 4100
Wire Wire Line
	13625 4950 13625 6050
Wire Wire Line
	13625 6050 14700 6050
Wire Wire Line
	12800 4950 13625 4950
Wire Wire Line
	13600 4550 13600 6150
Wire Wire Line
	13600 6150 14700 6150
Wire Wire Line
	12800 4550 13600 4550
Wire Wire Line
	14175 7250 14175 5550
Wire Wire Line
	14175 5550 14700 5550
Wire Wire Line
	12900 7250 14175 7250
Wire Wire Line
	13650 2450 13650 6650
Wire Wire Line
	13650 6650 14700 6650
Wire Wire Line
	12850 2450 13650 2450
Wire Wire Line
	13750 4400 13750 3900
Connection ~ 13750 1900
Wire Wire Line
	13750 1900 13750 1400
Connection ~ 13750 2400
Wire Wire Line
	13750 2400 13750 1900
Connection ~ 13750 2900
Wire Wire Line
	13750 2900 13750 2400
Connection ~ 13750 3900
Wire Wire Line
	13750 3900 13750 3400
Wire Wire Line
	14900 3900 14900 3400
Connection ~ 14900 1900
Wire Wire Line
	14900 1900 14900 1300
Connection ~ 14900 2400
Wire Wire Line
	14900 2400 14900 1900
Connection ~ 14900 2900
Wire Wire Line
	14900 2900 14900 2400
Wire Wire Line
	15900 1300 15900 1900
Connection ~ 15900 1900
Wire Wire Line
	15900 1900 15900 2400
Connection ~ 15900 2400
Connection ~ 15900 2900
Wire Wire Line
	15900 2900 15900 3400
Wire Wire Line
	14750 1400 14750 1900
Connection ~ 14750 1900
Wire Wire Line
	14750 1900 14750 2400
Connection ~ 14750 2400
Wire Wire Line
	14750 2400 14750 2675
Connection ~ 14750 2900
Wire Wire Line
	14750 2900 14750 3400
Connection ~ 14750 3900
Wire Wire Line
	13850 3400 13750 3400
Connection ~ 13750 3400
Wire Wire Line
	13750 3400 13750 3150
Wire Wire Line
	14650 3400 14750 3400
Connection ~ 14750 3400
Wire Wire Line
	14750 3400 14750 3900
Wire Wire Line
	13750 3150 14900 3150
Connection ~ 13750 3150
Wire Wire Line
	13750 3150 13750 2900
Connection ~ 14900 3150
Wire Wire Line
	14900 3150 14900 2900
Wire Wire Line
	14750 2675 15900 2675
Wire Wire Line
	15900 2400 15900 2675
Connection ~ 14750 2675
Wire Wire Line
	14750 2675 14750 2900
Connection ~ 15900 2675
Wire Wire Line
	15900 2675 15900 2900
$Comp
L power:+5V #PWR033
U 1 1 62B4A9E9
P 15900 1300
F 0 "#PWR033" H 15900 1150 50  0001 C CNN
F 1 "+5V" V 15850 1500 50  0000 C CNN
F 2 "" H 15900 1300 50  0001 C CNN
F 3 "" H 15900 1300 50  0001 C CNN
	1    15900 1300
	1    0    0    -1  
$EndComp
Connection ~ 15900 1300
$Comp
L power:GND #PWR032
U 1 1 62B4AFAB
P 14900 3900
F 0 "#PWR032" H 14900 3650 50  0001 C CNN
F 1 "GND" H 14905 3727 50  0000 C CNN
F 2 "" H 14900 3900 50  0001 C CNN
F 3 "" H 14900 3900 50  0001 C CNN
	1    14900 3900
	1    0    0    -1  
$EndComp
Connection ~ 14900 3900
$Comp
L 74xx:74LS95 U1
U 1 1 62B52D38
P 11200 1475
F 0 "U1" H 11200 2456 50  0000 C CNN
F 1 "74LS95" H 11200 2365 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 11200 1475 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS95" H 11200 1475 50  0001 C CNN
	1    11200 1475
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR026
U 1 1 6057DA6C
P 10250 2100
F 0 "#PWR026" H 10250 1850 50  0001 C CNN
F 1 "GND" H 10255 1927 50  0000 C CNN
F 2 "" H 10250 2100 50  0001 C CNN
F 3 "" H 10250 2100 50  0001 C CNN
	1    10250 2100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR020
U 1 1 62CCE1AF
P 11200 2275
F 0 "#PWR020" H 11200 2025 50  0001 C CNN
F 1 "GND" H 11205 2102 50  0000 C CNN
F 2 "" H 11200 2275 50  0001 C CNN
F 3 "" H 11200 2275 50  0001 C CNN
	1    11200 2275
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR019
U 1 1 62CCE4CE
P 11200 675
F 0 "#PWR019" H 11200 525 50  0001 C CNN
F 1 "+5V" H 11215 848 50  0000 C CNN
F 2 "" H 11200 675 50  0001 C CNN
F 3 "" H 11200 675 50  0001 C CNN
	1    11200 675 
	1    0    0    -1  
$EndComp
Wire Wire Line
	11900 1275 11900 2500
Wire Wire Line
	11900 2500 10475 2500
Wire Wire Line
	10475 2500 10475 2225
Wire Wire Line
	10475 2225 8700 2225
Wire Wire Line
	8700 2225 8700 2625
Wire Wire Line
	8700 2625 7500 2625
Wire Wire Line
	8650 975  10500 975 
Wire Wire Line
	8800 1450 10300 1450
Wire Wire Line
	10300 1450 10300 1875
Wire Wire Line
	10300 1875 10500 1875
Wire Wire Line
	10500 1975 10400 1975
Wire Wire Line
	10400 1975 10400 1475
$Comp
L power:+5V #PWR016
U 1 1 62DE1349
P 10400 775
F 0 "#PWR016" H 10400 625 50  0001 C CNN
F 1 "+5V" H 10415 948 50  0000 C CNN
F 2 "" H 10400 775 50  0001 C CNN
F 3 "" H 10400 775 50  0001 C CNN
	1    10400 775 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR017
U 1 1 62DE1919
P 10550 2175
F 0 "#PWR017" H 10550 1925 50  0001 C CNN
F 1 "GND" H 10555 2002 50  0000 C CNN
F 2 "" H 10550 2175 50  0001 C CNN
F 3 "" H 10550 2175 50  0001 C CNN
	1    10550 2175
	1    0    0    -1  
$EndComp
Wire Wire Line
	10500 1675 10375 1675
Wire Wire Line
	10375 1675 10375 2175
Wire Wire Line
	10375 2175 10550 2175
Wire Wire Line
	10500 1175 10400 1175
Connection ~ 10400 1175
Wire Wire Line
	10400 1175 10400 775 
Wire Wire Line
	10500 1275 10400 1275
Connection ~ 10400 1275
Wire Wire Line
	10400 1275 10400 1175
Wire Wire Line
	10500 1375 10400 1375
Connection ~ 10400 1375
Wire Wire Line
	10400 1375 10400 1275
Wire Wire Line
	10500 1475 10400 1475
Connection ~ 10400 1475
Wire Wire Line
	10400 1475 10400 1375
Wire Wire Line
	8800 1450 8800 3050
Wire Wire Line
	8650 975  8650 2700
Wire Wire Line
	7500 1700 7500 2625
Wire Wire Line
	1600 9200 1850 9200
$Comp
L power:GND #PWR02
U 1 1 6063CCD7
P 1850 9200
F 0 "#PWR02" H 1850 8950 50  0001 C CNN
F 1 "GND" V 1855 9072 50  0000 R CNN
F 2 "" H 1850 9200 50  0001 C CNN
F 3 "" H 1850 9200 50  0001 C CNN
	1    1850 9200
	0    -1   -1   0   
$EndComp
$Comp
L 74xx:74LS14 IC116
U 7 1 6052E968
P 14250 4400
F 0 "IC116" V 14150 4250 50  0000 L CNN
F 1 "74LS14" V 14350 4250 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 14250 4400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS14" H 14250 4400 50  0001 C CNN
	7    14250 4400
	0    1    1    0   
$EndComp
$Comp
L 74xx:74LS14 IC116
U 2 1 632A1927
P 1550 4450
F 0 "IC116" H 1450 4300 50  0000 L CNN
F 1 "74LS14" V 1650 4300 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 1550 4450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS14" H 1550 4450 50  0001 C CNN
	2    1550 4450
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS244_Split U16
U 7 1 633F7DB8
P 1550 3950
F 0 "U16" H 1550 4267 50  0000 C CNN
F 1 "74LS244_Split" H 1550 4176 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 1550 3950 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74ls241.pdf" H 1550 3950 50  0001 C CNN
	7    1550 3950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS14 IC116
U 3 1 635473CC
P 1550 4950
F 0 "IC116" H 1450 4800 50  0000 L CNN
F 1 "74LS14" V 1650 4800 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 1550 4950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS14" H 1550 4950 50  0001 C CNN
	3    1550 4950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS14 IC116
U 4 1 6354BE6A
P 1550 5950
F 0 "IC116" H 1450 5800 50  0000 L CNN
F 1 "74LS14" V 1650 5800 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 1550 5950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS14" H 1550 5950 50  0001 C CNN
	4    1550 5950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS14 IC116
U 5 1 63553582
P 1550 6950
F 0 "IC116" H 1450 6800 50  0000 L CNN
F 1 "74LS14" V 1650 6800 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 1550 6950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS14" H 1550 6950 50  0001 C CNN
	5    1550 6950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS14 IC116
U 1 1 6355705A
P 1600 9450
F 0 "IC116" H 1500 9300 50  0000 L CNN
F 1 "74LS14" V 1700 9300 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 1600 9450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS14" H 1600 9450 50  0001 C CNN
	1    1600 9450
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS14 IC116
U 6 1 6355B912
P 1600 9950
F 0 "IC116" H 1500 9800 50  0000 L CNN
F 1 "74LS14" V 1700 9800 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 1600 9950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS14" H 1600 9950 50  0001 C CNN
	6    1600 9950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS244_Split U16
U 2 1 6355E841
P 1550 5450
F 0 "U16" H 1550 5767 50  0000 C CNN
F 1 "74LS244_Split" H 1550 5676 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 1550 5450 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74ls241.pdf" H 1550 5450 50  0001 C CNN
	2    1550 5450
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS244_Split U16
U 8 1 6356C3F5
P 1550 6450
F 0 "U16" H 1550 6767 50  0000 C CNN
F 1 "74LS244_Split" H 1550 6676 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 1550 6450 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74ls241.pdf" H 1550 6450 50  0001 C CNN
	8    1550 6450
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS244_Split U16
U 4 1 6357348F
P 1600 8450
F 0 "U16" H 1600 8767 50  0000 C CNN
F 1 "74LS244_Split" H 1600 8676 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 1600 8450 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74ls241.pdf" H 1600 8450 50  0001 C CNN
	4    1600 8450
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS244_Split U16
U 6 1 635BB690
P 1550 7950
F 0 "U16" H 1550 8267 50  0000 C CNN
F 1 "74LS244_Split" H 1550 8176 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 1550 7950 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74ls241.pdf" H 1550 7950 50  0001 C CNN
	6    1550 7950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS244_Split U16
U 5 1 636062DB
P 1600 8950
F 0 "U16" H 1600 9267 50  0000 C CNN
F 1 "74LS244_Split" H 1600 9176 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 1600 8950 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74ls241.pdf" H 1600 8950 50  0001 C CNN
	5    1600 8950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS244_Split U16
U 1 1 636923E1
P 4250 10450
F 0 "U16" H 4250 10767 50  0000 C CNN
F 1 "74LS244_Split" H 4250 10676 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 4250 10450 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74ls241.pdf" H 4250 10450 50  0001 C CNN
	1    4250 10450
	1    0    0    -1  
$EndComp
$Comp
L TA8-FDC-rescue:74LS368-my_lib2 IC108
U 1 1 636DC37C
P 2350 5050
F 0 "IC108" H 2350 5300 50  0000 C CNN
F 1 "74LS368" H 2450 5200 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 2350 5050 50  0001 C CNN
F 3 "" H 2350 5050 50  0001 C CNN
	1    2350 5050
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS244_Split U16
U 3 1 636E34EC
P 1550 7450
F 0 "U16" H 1550 7767 50  0000 C CNN
F 1 "74LS244_Split" H 1550 7676 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 1550 7450 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74ls241.pdf" H 1550 7450 50  0001 C CNN
	3    1550 7450
	1    0    0    -1  
$EndComp
Connection ~ 15900 3400
Wire Wire Line
	15900 3400 15900 3900
Connection ~ 14900 3400
Wire Wire Line
	14900 3400 14900 3150
$Comp
L power:GND #PWR0101
U 1 1 63792FFA
P 9200 3950
F 0 "#PWR0101" H 9200 3700 50  0001 C CNN
F 1 "GND" H 9205 3777 50  0000 C CNN
F 2 "" H 9200 3950 50  0001 C CNN
F 3 "" H 9200 3950 50  0001 C CNN
	1    9200 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9350 3850 9350 3950
Wire Wire Line
	900  10450 3550 10450
Wire Wire Line
	14750 3900 14750 4400
Wire Wire Line
	9200 3950 9350 3950
Connection ~ 9350 3950
$Comp
L Connector_Generic:Conn_02x04_Odd_Even J2
U 1 1 6249985A
P 8075 9575
F 0 "J2" H 8125 9892 50  0000 C CNN
F 1 "Conn_02x04_Odd_Even" H 8125 9801 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x04_P2.54mm_Vertical" H 8075 9575 50  0001 C CNN
F 3 "~" H 8075 9575 50  0001 C CNN
	1    8075 9575
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 8050 2975 8050
Wire Wire Line
	2975 8050 2975 8175
Wire Wire Line
	2975 8175 2025 8175
Wire Wire Line
	2025 8175 2025 8950
Wire Wire Line
	2075 9450 2075 8225
Wire Wire Line
	2075 8225 3800 8225
Wire Wire Line
	3800 8225 3800 8050
Wire Wire Line
	3800 8050 4050 8050
Wire Wire Line
	2075 9450 1900 9450
Wire Wire Line
	1900 9950 2650 9950
$Comp
L felge1966:A302 U5
U 1 1 6257AE58
P 4450 8600
F 0 "U5" H 3950 8486 59  0000 C CNN
F 1 "A302" H 3950 8381 59  0000 C CNN
F 2 "Package_DIP:DIP-4_W7.62mm_LongPads" H 4450 8600 50  0001 C CNN
F 3 "" H 4450 8600 50  0001 C CNN
	1    4450 8600
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR039
U 1 1 6257BD11
P 4550 9000
F 0 "#PWR039" H 4550 8850 50  0001 C CNN
F 1 "+5V" H 4565 9173 50  0000 C CNN
F 2 "" H 4550 9000 50  0001 C CNN
F 3 "" H 4550 9000 50  0001 C CNN
	1    4550 9000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR040
U 1 1 6257C207
P 4550 9200
F 0 "#PWR040" H 4550 8950 50  0001 C CNN
F 1 "GND" H 4555 9027 50  0000 C CNN
F 2 "" H 4550 9200 50  0001 C CNN
F 3 "" H 4550 9200 50  0001 C CNN
	1    4550 9200
	1    0    0    -1  
$EndComp
Wire Wire Line
	8375 9775 8375 9675
Wire Wire Line
	8375 8350 10475 8350
Wire Wire Line
	10475 8350 10475 9525
Wire Wire Line
	10475 9525 14325 9525
Wire Wire Line
	14325 9525 14325 7750
Connection ~ 8375 9475
Wire Wire Line
	8375 9475 8375 8350
Connection ~ 8375 9575
Wire Wire Line
	8375 9575 8375 9475
Connection ~ 8375 9675
Wire Wire Line
	8375 9675 8375 9575
Wire Wire Line
	14250 7750 14325 7750
Connection ~ 14250 7750
Wire Wire Line
	14250 6850 14250 7750
Wire Wire Line
	4550 9100 5325 9100
$Comp
L felge1966:A302 U4
U 1 1 626AAF82
P 4450 9225
F 0 "U4" H 3950 9111 59  0000 C CNN
F 1 "A302" H 3950 9006 59  0000 C CNN
F 2 "Package_DIP:DIP-4_W7.62mm_LongPads" H 4450 9225 50  0001 C CNN
F 3 "" H 4450 9225 50  0001 C CNN
	1    4450 9225
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR041
U 1 1 626AAF88
P 4550 9625
F 0 "#PWR041" H 4550 9475 50  0001 C CNN
F 1 "+5V" H 4565 9798 50  0000 C CNN
F 2 "" H 4550 9625 50  0001 C CNN
F 3 "" H 4550 9625 50  0001 C CNN
	1    4550 9625
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR042
U 1 1 626AAF8E
P 4550 9825
F 0 "#PWR042" H 4550 9575 50  0001 C CNN
F 1 "GND" H 4555 9652 50  0000 C CNN
F 2 "" H 4550 9825 50  0001 C CNN
F 3 "" H 4550 9825 50  0001 C CNN
	1    4550 9825
	1    0    0    -1  
$EndComp
$Comp
L felge1966:A302 U3
U 1 1 626F8BFD
P 4425 8050
F 0 "U3" H 3925 7936 59  0000 C CNN
F 1 "A302" H 3925 7831 59  0000 C CNN
F 2 "Package_DIP:DIP-4_W7.62mm_LongPads" H 4425 8050 50  0001 C CNN
F 3 "" H 4425 8050 50  0001 C CNN
	1    4425 8050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR037
U 1 1 626F8C03
P 4525 8450
F 0 "#PWR037" H 4525 8300 50  0001 C CNN
F 1 "+5V" H 4540 8623 50  0000 C CNN
F 2 "" H 4525 8450 50  0001 C CNN
F 3 "" H 4525 8450 50  0001 C CNN
	1    4525 8450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR038
U 1 1 626F8C09
P 4525 8650
F 0 "#PWR038" H 4525 8400 50  0001 C CNN
F 1 "GND" H 4530 8477 50  0000 C CNN
F 2 "" H 4525 8650 50  0001 C CNN
F 3 "" H 4525 8650 50  0001 C CNN
	1    4525 8650
	1    0    0    -1  
$EndComp
$Comp
L felge1966:A302 U2
U 1 1 62746CFD
P 4200 6100
F 0 "U2" H 3700 5986 59  0000 C CNN
F 1 "A302" H 3700 5881 59  0000 C CNN
F 2 "Package_DIP:DIP-4_W7.62mm_LongPads" H 4200 6100 50  0001 C CNN
F 3 "" H 4200 6100 50  0001 C CNN
	1    4200 6100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR034
U 1 1 62746D03
P 4300 6500
F 0 "#PWR034" H 4300 6350 50  0001 C CNN
F 1 "+5V" H 4315 6673 50  0000 C CNN
F 2 "" H 4300 6500 50  0001 C CNN
F 3 "" H 4300 6500 50  0001 C CNN
	1    4300 6500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR035
U 1 1 62746D09
P 4300 6700
F 0 "#PWR035" H 4300 6450 50  0001 C CNN
F 1 "GND" H 4305 6527 50  0000 C CNN
F 2 "" H 4300 6700 50  0001 C CNN
F 3 "" H 4300 6700 50  0001 C CNN
	1    4300 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 4850 5550 8300
Wire Wire Line
	3250 7525 2050 7525
Wire Wire Line
	2050 7525 2050 6950
Wire Wire Line
	1850 6950 2050 6950
Wire Wire Line
	3250 7525 3250 7850
Wire Wire Line
	1950 6875 2100 6875
Wire Wire Line
	2100 6875 2100 7275
Wire Wire Line
	2100 7275 5700 7275
Wire Wire Line
	5700 7275 5700 8200
Wire Wire Line
	5500 5900 5500 4650
Wire Wire Line
	5500 4650 7450 4650
Wire Wire Line
	3400 5900 5500 5900
Wire Wire Line
	1950 6200 1950 6450
Connection ~ 1950 6450
Wire Wire Line
	1950 6450 1950 6875
Wire Wire Line
	5400 5750 4350 5750
Wire Wire Line
	5400 5750 5400 7950
Wire Wire Line
	3900 7950 3900 8150
Wire Wire Line
	3900 8150 5450 8150
Wire Wire Line
	5450 8150 5450 4625
Wire Wire Line
	5450 4625 3900 4625
Wire Wire Line
	6375 6600 6375 9425
Wire Wire Line
	6375 9425 7825 9425
Wire Wire Line
	7825 9425 7825 9475
Wire Wire Line
	7825 9475 7875 9475
Wire Wire Line
	4300 6600 6375 6600
Wire Wire Line
	7300 9725 7300 9775
Wire Wire Line
	7300 9775 7875 9775
Wire Wire Line
	4550 9725 7300 9725
Wire Wire Line
	5325 9675 7875 9675
Wire Wire Line
	5400 8550 5400 9575
Wire Wire Line
	4525 8550 5400 8550
Wire Wire Line
	5400 9575 7875 9575
Wire Wire Line
	5325 9100 5325 9675
Wire Wire Line
	14025 8200 14025 9675
Wire Wire Line
	14025 9675 10325 9675
Wire Wire Line
	10325 9675 10325 10650
Wire Wire Line
	10325 10650 4650 10650
Wire Wire Line
	4650 10650 4650 10800
Wire Wire Line
	1175 10800 1175 6600
Wire Wire Line
	1175 10800 4650 10800
Connection ~ 14025 8200
Wire Wire Line
	3325 8550 2925 8550
Wire Wire Line
	4675 10825 4675 10675
Wire Wire Line
	4675 10675 10350 10675
Wire Wire Line
	10350 10675 10350 9725
Wire Wire Line
	10350 9725 14075 9725
Wire Wire Line
	14075 9725 14075 8600
Connection ~ 14075 8600
Wire Wire Line
	14125 9000 14125 9750
Wire Wire Line
	14125 9750 10375 9750
Wire Wire Line
	10375 9750 10375 10700
Wire Wire Line
	10375 10700 4700 10700
Wire Wire Line
	4700 10700 4700 10850
Wire Wire Line
	4700 10850 2675 10850
Wire Wire Line
	2675 9100 2925 9100
Connection ~ 14125 9000
Wire Wire Line
	3350 9725 2950 9725
Wire Wire Line
	2725 10900 4725 10900
Wire Wire Line
	4725 10725 10400 10725
Wire Wire Line
	10400 10725 10400 9775
Wire Wire Line
	10400 9775 14050 9775
Wire Wire Line
	14050 9775 14050 9375
Wire Wire Line
	4725 10725 4725 10900
Connection ~ 14050 9375
Wire Wire Line
	13400 9375 13400 9400
$Comp
L Device:C C5
U 1 1 61FF230B
P 2925 8700
F 0 "C5" V 3025 8800 50  0000 C CNN
F 1 "100nF" V 2775 8700 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 2963 8550 50  0001 C CNN
F 3 "~" H 2925 8700 50  0001 C CNN
	1    2925 8700
	-1   0    0    1   
$EndComp
Connection ~ 2925 8550
Wire Wire Line
	2925 8550 2775 8550
$Comp
L Device:R R4
U 1 1 61FF2D8E
P 2775 8700
F 0 "R4" V 2675 8700 50  0000 L CNN
F 1 "220" V 2775 8650 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 2705 8700 50  0001 C CNN
F 3 "~" H 2775 8700 50  0001 C CNN
	1    2775 8700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2775 8850 2775 10825
Wire Wire Line
	2775 10825 4675 10825
$Comp
L power:GND #PWR044
U 1 1 6205DA7A
P 2925 8850
F 0 "#PWR044" H 2925 8600 50  0001 C CNN
F 1 "GND" H 2930 8677 50  0000 C CNN
F 2 "" H 2925 8850 50  0001 C CNN
F 3 "" H 2925 8850 50  0001 C CNN
	1    2925 8850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 8300 5550 8300
Wire Wire Line
	2650 8300 2650 9950
$Comp
L Device:R R2
U 1 1 6206A1C6
P 2675 9250
F 0 "R2" V 2575 9250 50  0000 L CNN
F 1 "220" V 2675 9200 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 2605 9250 50  0001 C CNN
F 3 "~" H 2675 9250 50  0001 C CNN
	1    2675 9250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 6206AAB2
P 2925 9250
F 0 "C6" V 3025 9350 50  0000 C CNN
F 1 "100nF" V 2775 9250 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 2963 9100 50  0001 C CNN
F 3 "~" H 2925 9250 50  0001 C CNN
	1    2925 9250
	-1   0    0    1   
$EndComp
Connection ~ 2925 9100
Wire Wire Line
	2925 9100 3350 9100
$Comp
L power:GND #PWR045
U 1 1 6206B02C
P 2925 9400
F 0 "#PWR045" H 2925 9150 50  0001 C CNN
F 1 "GND" H 2930 9227 50  0000 C CNN
F 2 "" H 2925 9400 50  0001 C CNN
F 3 "" H 2925 9400 50  0001 C CNN
	1    2925 9400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C7
U 1 1 6206B2D8
P 2950 9875
F 0 "C7" V 3050 9975 50  0000 C CNN
F 1 "100nF" V 2800 9875 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 2988 9725 50  0001 C CNN
F 3 "~" H 2950 9875 50  0001 C CNN
	1    2950 9875
	-1   0    0    1   
$EndComp
Connection ~ 2950 9725
Wire Wire Line
	2950 9725 2725 9725
$Comp
L power:GND #PWR046
U 1 1 6206B670
P 2950 10025
F 0 "#PWR046" H 2950 9775 50  0001 C CNN
F 1 "GND" H 2955 9852 50  0000 C CNN
F 2 "" H 2950 10025 50  0001 C CNN
F 3 "" H 2950 10025 50  0001 C CNN
	1    2950 10025
	1    0    0    -1  
$EndComp
Wire Wire Line
	2675 10850 2675 9400
$Comp
L Device:R R3
U 1 1 620CCE99
P 2725 9875
F 0 "R3" V 2625 9875 50  0000 L CNN
F 1 "220" V 2725 9825 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 2655 9875 50  0001 C CNN
F 3 "~" H 2725 9875 50  0001 C CNN
	1    2725 9875
	1    0    0    -1  
$EndComp
Wire Wire Line
	2725 10900 2725 10025
Wire Wire Line
	3100 6600 2700 6600
$Comp
L Device:C C4
U 1 1 62135ACD
P 2700 6750
F 0 "C4" V 2800 6850 50  0000 C CNN
F 1 "100nF" V 2550 6750 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 2738 6600 50  0001 C CNN
F 3 "~" H 2700 6750 50  0001 C CNN
	1    2700 6750
	-1   0    0    1   
$EndComp
Connection ~ 2700 6600
Wire Wire Line
	2700 6600 2550 6600
$Comp
L Device:R R1
U 1 1 62135AD5
P 2400 6600
F 0 "R1" V 2300 6600 50  0000 L CNN
F 1 "220" V 2400 6550 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 2330 6600 50  0001 C CNN
F 3 "~" H 2400 6600 50  0001 C CNN
	1    2400 6600
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR043
U 1 1 62135ADC
P 2700 6900
F 0 "#PWR043" H 2700 6650 50  0001 C CNN
F 1 "GND" H 2705 6727 50  0000 C CNN
F 2 "" H 2700 6900 50  0001 C CNN
F 3 "" H 2700 6900 50  0001 C CNN
	1    2700 6900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 6600 1175 6600
$EndSCHEMATC
