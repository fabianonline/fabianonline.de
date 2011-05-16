--- 
layout: post
title: AirPrint mit normalem CUPS-Server nutzen
tags: 
- pc
- apple
- linux
---
In der heute veröffentlichten Version 4.2 von iOS ist ja auch die Möglichkeit enthalten, via AirPrint von iPhone (zumindest iPhone 4, ältere weiß ich jetzt nicht) und iPad aus auf an Mac-Rechnern angeschlossenen Druckern zu drucken. Natürlich blöd, wenn man keinen extra-Mac-Rechner für diesen Zweck herumstehen hat, sondern "nur" eine Linux-Kiste mit nem CUPS-Server drauf. Mit einem bisschen Herumgebastele kann man das aber doch hinbekommen... Und ich fasse hier mal kurz zusammen, wass ich machen musste, damit es bei mir funktioniert. ;-)
<!--more-->
Schon vorher vorhanden waren ein Server mit Ubuntu 10.04 mit funktionierendem CUPS und Avahi. Und auch python war schon installiert. Bitte nehmt diese Anleitung nur als grobe Hilfestellung. Es kann durchaus vorkommen, dass euch noch Pakete fehlen oder in dieser Anleitung überflüssige Schritte enthalten sind. Bitte weist mich per Kommentar auf solche Fehler hin, dann kann ich sie ausmerzen.

In den Einstellungen des CUPS-Servers (Webinterface, Stichwort: "Port 631") muss der Punkt "Freigeben von Druckern welche mit diesem System verbunden sind" aktiviert sein. Zudem muss der Drucker, den ihr für AirPrint verwenden wollt, freigegeben sein.

tjfontaine hat <a href="http://www.atxconsulting.com/blog/tjfontaine/2010/11/21/automatically-generate-airprint-avahi-service-files-cups-printers" target="_blank">in seinem Blog</a> ein kleines Tool vorgestellt, um automatisch aus den Daten vom CUPS-Server ein Service-File für Avahi zu machen. Dieses benutzen wir:
<blockquote><code>wget --no-check-certificate https://github.com/tjfontaine/airprint-generate/raw/master/airprint-generate.py
sudo apt-get install python-cups
python ./airprint-generate.py</code></blockquote>
Wenn alles geklappt hat, habt ihr im aktuellen Verzeichnis für jeden freigegebenen Drucker eine Datei namens "AirPrint-&lt;druckername&gt;.service". Bei mir heißt diese Datei z.B. AirPrint-Laserjet.service. Diese kopiert ihr zum Speicherort für Avahi-Service-Configs:
<blockquote><code>sudo cp AirPrint-Laserjet.service /etc/avahi/services/</code></blockquote>
Zudem musste ich bei mir in /etc/cups/cupsd.conf noch eine Zeile hinzufügen:
<blockquote><code>ServerAlias *</code></blockquote>
Dann sollten wir die Dienste nochmal vorsichtshalber neu starten:
<blockquote><code>sudo /etc/init.d/avahi-daemon restart
sudo /etc/init.d/cups restart</code></blockquote>
Und "schon" sollte der Drucker auf dem iDevice auftauchen - dies kann man u.a. in Safari testen: Das Symbol mit dem Rechteck und den Pfeil auswählen und dann "Drucken". Unter "Drucker" sollte man dann den neuen Drucker finden können.

Das Drucken selber dauert übrigens erstaunlich lange - also auch wenn da für einige viele Sekunden steht "Verbinde mit Drucker" oder auch einfach gar nichts passiert - irgendwann fing mein Drucker auf einmal an, zu drucken.

Viel Glück.


Wenn ihr Fragen oder Probleme habt, könnt ihr sie gerne hier als Kommentar posten - vielleicht kann ich euch ja weiterhelfen...
