Information:
Detta är en instruktion till en enkel collector modul som kan användas för att samla in statistik under 1 minut från det att scriptet startas
Det går att förlänga tiden om man vill men scriptet är inte gjort för att köras konternuerligt i nuvarande design

När man kör scriptet så letar det rätt på tshark.exe (så Wireshark måste ha installerats för att det ska fungera).
tshark hittas genom en filsökning så det kan ta lite tid. Denna sökning görs bara första gången sedan sparas resultatet i en configurations fil.

När sedan scriptet börjar köra startar den en trace process per interface. Detta görs för att det är svårt att avgöra vilket interface som används (inte alltid samma som man tror...)

Parallelt med att dessa trace processer körs samlar scriptet in information om IP configuration och en del performance data inklusive och datorns namn

Resultatet från körningen hamnar i ett directory som har dagens datum och tid som namn

Tänk på att när scriptet startas så kommer ett flertal command fönster att öppnas. Dessa kommer att stängas när scriptet kört klart.
Det är först när scriptet är klart som det är intressant att titta på innehållet i filerna så ha inte för bråttom att samla in informationen....

Installation:
Wireshark
1. Ladda ner senaste versionen av Wireshark (https://www.wireshark.org/)
2. Installer Wireshark på den dator som ska köra scripten (välj default om du inte vet exakt vad du gör). Se till att pcap också installeras (installeras separat som en del av Wireshark så svara bara att du vill installera om du inte redan har denna programvara)

Collectorscript
1. Skapa ett directory på den PC där man ska traca där man vill att filerna ska sparas
2. Följande filer ska sedan kopieras till detta directory (leveraras som separat zipfil):
TSHARK.bat
getInfo.ps1
CollectorScript.bat
3. Antingen lör man programmet genom att köra CollectorScript.bat eller genom att göra en genväg enligt nedan
4 Skapa en genväg genom att högerklicka på CollectorScript.bat och välj Send to -> Desktop
5. Genom att klicka på denna genväg så körs scriptet som ska samla in information i rätt bibliotek

I