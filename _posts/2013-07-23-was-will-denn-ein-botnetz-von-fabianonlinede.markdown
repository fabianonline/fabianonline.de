---
layout: post
title: "Was will denn ein Botnetz von fabianonline.de?"
published: true
---

Die Besucherzahlen von fabianonline.de haben in der letzten Zeit ziemlich nachgelassen. Ist ja auch klar: Der letzte Post ist schon bald ein Jahr her. Warum sollten dann auch massenweise Leute dieses Blog besuchen kommen?

AWStats zeigt für die vergangenen Monate so ungefähr 600 Besucher an. Pro Monat. Nur der halb angebrochene Juli fällt etwas aus der Reihe: Da hatte dieses Blog in 23 Tagen knappe 260.000 Besucher.

<!--more-->

"DAFUQ?" ist da sicherlich nicht nur mein erster Gedanke. Immerhin erklärt das, warum der Server in der letzten Zeit so langsam auf HTTP-Requests reagiert hat...

Ein Blick in die Apache-Logfiles zeigt viele, viele gleich aussehende Zeilen:

    xxx.xxx.xxx.xxx - - [23/Jul/2013:19:14:24 +0200] "POST / HTTP/1.1" 301 452 "-" "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)" fabianonline.de

Die IPs sind immer anders, auch nicht aus einem gemeinsamen Subnetz oder so. Also nix, was man einfach so per Firewall blocken könnte.

Ich habe als erste Maßnahme mal fail2ban auf diese Anfragen angesetzt, weil die wenigstens alle mit dem gleichen User-Agent anfragen und sich auch immer nur auf die Adresse "/" beschränken. Nach 5 solcher Anfragen wird eine IP dann für 6 Stunden per Firewall geblockt. Derzeit stehen in dieser Liste etwa 1.500 IPs, die aber wild fluktuieren. Alle paar Sekunden läuft die Sperre für eine IP ab; gleichzeitig kommen aber auch alle paar Sekunden neue IPs dazu.

Immerhin habe ich den Server wieder erreichbar machen können: Die Anfragen kommen nämlich alle per HTTP 1.1 und haben "Connection: Keep-Alive" gesetzt - das bedeutet, sie bitten den Server, die Verbindung nach dem Senden der Antwort offen zu halten, um direkt die nächste Anfrage über die noch stehende Verbindung abwickeln zu können. Normalerweise ist das auch sinnvoll, weil dann ein Besucher die Seite plus die zugehörigen Bilder und so direkt hinteinander über eine einzige Verbindung übertragen können. In diesem Falle ist das aber eher doof, weil die Verbindung nie explizit geschlossen wird, sondern erst in einen Timeout rennen muss, bis der Server sie schließt.

Daher kam es auch, dass der Server so ausgelastet war - er durfte laut Config bis zu 50 Threads starten, um auf Antworten zu reagieren. Die waren aber alle damit beschäftigt, unnütze Verbindungen offen zu halten, weil das Botnetz das halt so wollte. Ein einfaches "KeepAlive off" in der Config des VHosts hat da geholfen, weil der Server jetzt den Wunsch der Clients nach Offenhalten der Verbindungen ignoriert.

Das Endresultat ist derzeit, dass ich fleißig IPs banne, was aber nicht wirklich hilft, und zudem neben etwas Traffic (der mich jetzt aber derzeit auch nicht wirklich stört) ein kleines bisschen CPU-Last habe. Allerdings weiß ich auch nicht wirklich, was ich noch gegen das Botnetz tun könnte...