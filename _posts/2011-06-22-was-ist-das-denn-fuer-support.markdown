---
layout: post
title: "Was ist das denn für Support???"
published: true
tags:
---

Der Server, auf dem u.a. auch dieses Blog gehostet wird, steht bei Hetzner. Ich
habe mir da zusammen mit ein paar Kommilitonen einen eigenen Root-Server
angemietet, auf dem wir tun und machen können, was wir wollen.

Dass Hetzner da dann nicht unbedingt hochqualitative Server-Hardware verbaut,
ist klar - und ja auch nicht soo wichtig. Wir haben da ja keine Anwendungen
laufen, die möglichst nah an die 100% Verfügbarkeit rankommen müssen. Zudem
sind da zwei Festplatten drin, sodass man die einfach per RAID1 spiegeln kann
und dann auch nicht sofort Datenverlust hat, wenn mal eine Platte ausfällt. Und
es gibt noch einen externen Backup-Server.

<!--more-->

Jetzt war es dann wieder soweit: Eine der Festplatten hat sich verabschiedet
und das RAID hat pflichtgemäß per Mail um Hilfe gerufen.  Ich habe gestern
Abend über das Webinterface von Hetzner einen Festplattentausch anberaumt und
als Wunschtermin heute um 13:00 Uhr angegeben.  Ich bekam eine Antwortmail, die
folgendes enthielt:

> [...] wie gewünscht werden wir am 22.06.2011 um 13Uhr die Festplatte
> austauschen.  [...] Nach dem Austausch werden Sie von uns Informiert.

Damit war für mich dann klar: Server um 12:55 herunterfahren und warten, bis
die Fertigstellungsmail kommt.

Heute kam dann um 12:34 eine Mail mit folgendem Inhalt:

> bitte teilen Sie uns mit, wann wir die defekte Festplatte tauschen könne. Für
> den Tausch müsste der Server für ca. 15min offline genommen werden.

Ich war zugegebenermaßen leicht überrascht, weil der Termin in meinen Augen ja
schon vereinbart war (und auch von Hetzner bestätigt wurde).  Meine Antwort um
12:41 Uhr:

> Ich hatte jetzt 13 Uhr angepeilt und wollte den Server um 12:55
> herunterfahren. Geht das bei Ihnen in Ordnung?

Es verging immer mehr Zeit, bis es dann 12:55 Uhr war und ich noch keine
Antwort hatte. Mir boten sich jetzt zwei Möglichkeiten:

* Auf eine Mail warten. Nachteil: Es könnte sein, dass dann ein
  Hetzner-Mitarbeiter um 13:00 zum Server geht und ihn einfach mal hart
  "herunterfährt" (a.k.a. Stecker ziehen), um die Festplatte zu wechseln.
* Den Server herunterfahren und darauf hoffen, dass die Platte schnell
  gewechselt wird.

Um keinen Schaden am Dateisystem zu riskieren, habe ich mich dann für ein
Herunterfahren des Servers entschieden - und wartete dann gespannt auf entweder
eine Antwort des nach dem Hardwareeingriff wiedererweckten Servers auf meine
Pings oder aber eine Mail. Die dann um 13:25 Uhr kam:

> das war leider zu kurzfristig. Wie wäre es mit 14 Uhr?

Was. Zum. Geier? Das kann doch nicht deren Ernst sein. Bis zu dieser Mail war
der Server schon 30 Minuten lang nicht erreichbar. Aaaarg.  Meine Antwort:

> Ich dachte, ich hätte gestern Abend schon einen Termin für 13 Uhr
> festgemacht. -.-
>
> Der Server ist bereits aus. Sie können also gerne direkt mit dem Wechsel
> beginnen - oder aber Sie schalten den Server wieder ein, damit er wenigstens
> noch ne halbe Stunde erreichbar ist. Dann würde ich ihn um 1355 wieder
> herunterfahren.

Diesen Beitrag schreibe ich lokal. Es ist 13:52 Uhr, auf obige Mail habe ich
noch keine Antwort bekommen, der Server ist immernoch nicht wieder erreichbar.
Ich bin, gelinde gesagt, nicht wirklich begeistert von diesem
Rechenzentrumssupport.

Okay, in dem Moment, als ich diesen Post speicherte, kam dann die Mail, dass
der Tausch abgeschlossen und der Server wieder gebootet sei.  Allerdings konnte
ich ihn nicht anpingen - und auch wenn ich das Rescue-System von Hetzner booten
lassen wollte, konnte ich die IP nicht erreichen.  Das ist eine Konstellation,
in der ich absolut nichts selber machen kann, sondern voll und ganz auf den
Rechenzentrums-Support angewiesen war.  Blöderweise waren deren Reaktionszeiten
auch weiterhin recht niedrig: Es vergingen gerne mal 2 Stunden, bis ich eine
Antwort auf meine Mails bekam. Und ein Anruf im Rechenzentrum war auch nicht
wirklich hilfreich, da dort dann nur eine Durchsage a la "So viel zu tun, bitte
schicken Sie eine Mail" kam.

Insgesamt dauerte es dann noch bis etwa 20 Uhr, bis der Server wieder
ordentlich erreichbar war. Probleme waren zwischendurch, dass laut Support im
BIOS eine Einstellung falsch gesetzt war, sodass der Server beim Booten keine
IP beziehen konnte und dann auch noch ein defekter CPU-Lüfter.

Inzwischen läuft der Server seit über 12 Stunden wieder und ich bin happy.
Dennoch verbleibt ob des RZ-Supports von Hetzner ein sehr schaler Geschmack.
Ich denke, dass trotz der Probleme die Downtime bei schnellem Support deutlich
(!) geringer gewesen wäre. Wobei ich mir natürlich bewusst bin, dass da evtl.
gerade ein großer Ansturm auf den Support stattfand und einfach nicht genug
Zeit war. 

Dann bleibt aber immernoch die "wann sollen wir denn jetzt die
Platte"-Mail vom Anfang der ganzen Aktion. Das geht in meinen Augen mal so gar
nicht!

