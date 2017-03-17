Information:
Detta �r en instruktion till en enkel collector modul som kan anv�ndas f�r att samla in statistik under 1 minut fr�n det att scriptet startas
Det g�r att f�rl�nga tiden om man vill men scriptet �r inte gjort f�r att k�ras konternuerligt i nuvarande design

N�r man k�r scriptet s� letar det r�tt p� tshark.exe (s� Wireshark m�ste ha installerats f�r att det ska fungera). Anledningen till detta �r att tshark inte l�ggs in i PATH filen vid installation.
Tshark hittas genom en fils�kning p� hela disken s� det tar ett litet tag. Denna s�kning g�rs bara f�rsta g�ngen sedan sparas resultatet i en configurations fil.

N�r scriptet k�ras startar den en trace process per interface. Detta g�rs f�r att det �r sv�rt att avg�ra vilket interface som anv�nds (inte alltid samma som man tror...)

Parallelt med att dessa trace processer k�rs samlar scriptet in information om IP configuration och en del performance data inklusive och datorns namn

Resultatet fr�n k�rningen hamnar i ett directory som har dagens datum och tid som namn

T�nk p� att n�r scriptet startas s� kommer ett flertal command f�nster att �ppnas. Dessa kommer att st�ngas n�r scriptet k�rt klart.
Det �r f�rst n�r scriptet �r klart som det �r intressant att titta p� inneh�llet i filerna s� ha inte f�r br�ttom att samla in informationen....

Installation:
Wireshark
1. Ladda ner senaste versionen av Wireshark (https://www.wireshark.org/)
2. Installer Wireshark p� den dator som ska k�ra scripten (v�lj default om du inte vet exakt vad du g�r). Se till att pcap ocks� installeras (installeras separat som en del av Wireshark s� svara bara att du vill installera om du inte redan har denna programvara)

Collectorscript
1. Skapa ett directory p� den PC d�r man ska traca d�r man vill att filerna ska sparas. Se till att direcotoryt ligger p� C:. Det enklaste �r att skapa en folder direkt under C:
2. F�ljande filer ska sedan kopieras till detta directory (leveraras som separat zipfil):
TSHARK.bat
getInfo.ps1
CollectorScript.bat
Detta g�r du enklast genom att ladda ner https://github.com/eubmabe/RTPstatCollect/archive/master.zip eller att g�ra git pull fr�n https://github.com/eubmabe/RTPstatCollect.git
3. Antingen k�r man programmet genom att k�ra CollectorScript.bat direkt fr�n det directory d�r det �r installerat eller genom att g�ra en genv�g enligt punkt 4.
4 Skapa en genv�g genom att h�gerklicka p� CollectorScript.bat och v�lj Send to -> Desktop. Genom att klicka p� denna genv�g s� k�rs scriptet som ska samla in information i r�tt bibliotek


Anv�ndning:
Starta scriptet "CollectorScript.bat"
F�r att analysera resultatet titta d� i de filer som finns i det bibliotek med senaste tidsangivelsen (Scriptets start tid anges i formatet YYYY-MM-DD_HHMMSS).
Vill ni att n�gon ska analysera resultatet zippa i s� fall ihop de directory som inneh�ller de k�rningar ni vill ha analyserade och skicka sedan �ver dessa.
Eftersom enbart statistik samlas in blir filerna inte speciellt stora.
OBS!!! T�nk p� att anteckna hur samtalet gjordes och vilke eventuella problem som upplevdes n�r k�rningen gjordes. Bifoga �ven denna information n�r ni skickar �ver filerna f�r analys.
