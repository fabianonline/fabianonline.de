--- 
layout: post
title: Ich brauche eine neue Festplatte...
tags: 
- pc
---
Grml... Gerade hat sich mein Desktop-PC aufgehängt. Nach ein paar Neustarts, die mir alle sehr, sehr (ja, fast schon zu) informative Fehlermeldungen um die Ohren geworfen haben (das ist ein definitiver Vorteil von Linux), habe ich jetzt herausgefunden:
Eine der Festplatten in meinem Rechner hat wohl eine Macke. Zum Glück habe ich hier in meinem Rechner die Daten auf einem sogenannten RAID5 gespeichert - als kurze Beschreibung: Die Daten werden auf 3 Festplatten verteilt, der Speicherplatz einer dieser Platten geht dabei "verloren", dafür darf aber auch eine dieser 3 Festplatten ausfallen, ohne dass Daten verloren gehen. Und diese Situation ist bei mir gerade der Fall.
<!--more-->
Für die RAID-Erfahrenen unter euch: mdadm hat inzwischen eines der Devices herausgeworfen:
<pre>sudo mdadm --detail /dev/md1
/dev/md1:
        Version : 00.90
  Creation Time : Sun Jun 17 11:34:59 2007
     Raid Level : raid5
     Array Size : 97658880 (93.13 GiB 100.00 GB)
  Used Dev Size : 48829440 (46.57 GiB 50.00 GB)
   Raid Devices : 3
  Total Devices : 2
Preferred Minor : 1
    Persistence : Superblock is persistent

    Update Time : Sun Jun 14 22:27:10 2009
          State : clean, degraded
 Active Devices : 2
Working Devices : 2
 Failed Devices : 0
  Spare Devices : 0

         Layout : left-symmetric
     Chunk Size : 64K

           UUID : a6aac6bc:d2cfb282:87c230c1:99c320f6
         Events : 0.11111

    Number   Major   Minor   RaidDevice State
       0       0        0        0      removed
       1       8       22        1      active sync   /dev/sdb6
       2       8       38        2      active sync   /dev/sdc6
</pre>

Wenn ich das fehlende Device wieder hot-adden will (es ist, wie ihr seht, nur eine Partition - auf der Festplatte liegen noch 2 weitere Partitionen, die (noch) problemlos laufen), hagelt es Fehlermeldungen ("ATA Bus-Error", "Hard-resetting Link") usw., bis mdadm dann irgendwann seine Versuche aufgibt.

Mal schauen, was aktuell eine 300GB-Platte mit SATA kostet... okay, 39 Euro. Das geht ja noch...
Aber das Vertrauen in meinen PC ist jetzt irgendwie hin... es ist ja erst knapp 1 Jahr her, dass <a href="http://www.fabianonline.de/blog/archives/1211-Totes-Netzteil.html">sich das Netzteil verabschiedet hat</a>...
