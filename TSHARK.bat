@echo off
echo Starting Tshark on interface %4 for %3 seconds
REM "C:\Program Files\Wireshark\tshark.exe" -a duration:%2 -o rtp.heuristic_rtp:FALSE -q -z rtp,streams -i %3 > %1
REM "C:\Program Files\Wireshark\tshark.exe" -a duration:%2 -d udp.port==50040:20,rtp -o rtp.heuristic_rtp:FALSE -q -z rtp,streams -i %3 > %1
%1 -a duration:%3 -d udp.port==50040:20,rtp -o rtp.heuristic_rtp:TRUE -q -z rtp,streams -i %4 > %2

exit