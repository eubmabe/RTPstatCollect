Information:
Detta är en instruktion till en enkel collector modul som kan användas för att samla in statistik under 1 minut från det att scriptet startas
Det går att förlänga tiden om man vill men scriptet är inte gjort för att köras konternuerligt i nuvarande design

När man kör scriptet så letar det rätt på tshark.exe (så Wireshark måste ha installerats för att det ska fungera). Anledningen till detta är att tshark inte läggs in i PATH filen vid installation.
Tshark hittas genom en filsökning på hela disken så det tar ett litet tag. Denna sökning görs bara första gången sedan sparas resultatet i en configurations fil.

När scriptet köras startar den en trace process per interface. Detta görs för att det är svårt att avgöra vilket interface som används (inte alltid samma som man tror...)

Parallelt med att dessa trace processer körs samlar scriptet in information om IP configuration och en del performance data inklusive och datorns namn

Resultatet från körningen hamnar i ett directory som har dagens datum och tid som namn

Tänk på att när scriptet startas så kommer ett flertal command fönster att öppnas. Dessa kommer att stängas när scriptet kört klart.
Det är först när scriptet är klart som det är intressant att titta på innehållet i filerna så ha inte för bråttom att samla in informationen....

Installation:
Wireshark
1. Ladda ner senaste versionen av Wireshark (https://www.wireshark.org/)
2. Installer Wireshark på den dator som ska köra scripten (välj default om du inte vet exakt vad du gör). Se till att pcap också installeras (installeras separat som en del av Wireshark så svara bara att du vill installera om du inte redan har denna programvara)

Collectorscript
1. Skapa ett directory på den PC där man ska traca där man vill att filerna ska sparas. Se till att direcotoryt ligger på C:. Det enklaste är att skapa en folder direkt under C:
2. Följande filer ska sedan kopieras till detta directory (leveraras som separat zipfil):
TSHARK.bat
getInfo.ps1
CollectorScript.bat
Detta gör du enklast genom att ladda ner https://github.com/eubmabe/RTPstatCollect/archive/master.zip eller att göra git pull från https://github.com/eubmabe/RTPstatCollect.git
3. Antingen kör man programmet genom att köra CollectorScript.bat direkt från det directory där det är installerat eller genom att göra en genväg enligt punkt 4.
4 Skapa en genväg genom att högerklicka på CollectorScript.bat och välj Send to -> Desktop. Genom att klicka på denna genväg så körs scriptet som ska samla in information i rätt bibliotek


Användning:
Starta scriptet "CollectorScript.bat"
För att analysera resultatet titta då i de filer som finns i det bibliotek med senaste tidsangivelsen (Scriptets start tid anges i formatet YYYY-MM-DD_HHMMSS).
Vill ni att någon ska analysera resultatet zippa i så fall ihop de directory som innehåller de körningar ni vill ha analyserade och skicka sedan över dessa.
Eftersom enbart statistik samlas in blir filerna inte speciellt stora.
OBS!!! Tänk på att anteckna hur samtalet gjordes och vilke eventuella problem som upplevdes när körningen gjordes. Bifoga även denna information när ni skickar över filerna för analys.
