---
layout: post
title: "Mein perfekter Twitter Client"
published: true
---

Dies ist ein Post, den zu schreiben ich eigentlich schon länger vorhatte... jetzt hat @TobHo mit seinem Post "[Der “perfekte” Twitterclient?](http://code-forge.de/?p=158)" das Ganze nochmal angestoßen.

Also gut. "Mein" "perfekter" Twitter-Client sollte zum Einen alle Aktionen beherrschen, die ich häufig (!) nutze. "Reply-To", DMs, etc. Following bzw. Unfollowing mache ich nur recht selten, das kann ich auch mal eben über die Homepage machen.  
Er sollte nur eine Timeline haben. Ich hasse es, wenn ich neben der normalen Timeline noch einen extra Tab mit Mentions und noch einen Tab mit DMs im Blick behalten muss, wenn ich nichts verpassen möchte.  
Und ansonsten wünsche ich mir von einem Client, dass er aktuelle "Trends" in Sachen Twitter-Client-Features schnell mitmachen kann.

<!--more-->

Wobei ich ja durchaus zugeben muss, nicht so ganz unvoreingenommen zu sein: Immerhin habe ich ja meinen eigenen Twitter-Client geschrieben. Den [Geotweeter](https://github.com/fabianonline/geotweeter).

![Der Geotweeter](/images/2012-04-27/geotweeter_1.png "aaa")

Angefangen hatte das ganze Projekt damals, als Twitter die Möglichkeit einführte, Tweets mit Geokoordinaten zu versehen. Da man über die Twitter-Homepage keine beliebigen Orte angeben konnte und die Lokalisierung über die IP nicht annähernd genau war, wollte ich gerne einen Client haben, in dem ich direkt angeben konnte "ich bin in Paderborn". Gab es aber nicht. Oder ich habe es nicht gefunden...  
Also habe ich den Geotweeter erfunden. Damals war er eine simple PHP-Anwendung auf meinem Heimserver, die nichts weiter konnte, als einen Tweet mit einer bestimmten Ortsangabe zu verschicken.  
Dann stellte ich fest, dass die "Reply"-Funktion dabei fehlte. Also wurde er um eine Tweet-Anzeige ergänzt, um dann da bei einem Tweet auf "Antworten" klicken zu können.  
Und dann kam mir die Idee, dass ich Tweets dann ja auch gleich im Geotweeter lesen könnte.

So wuchs und gedieh der Geotweeter als komplett auf dem Server laufende PHP-Anwendung. Und ich war glücklich.

Bis Twitter dann die Streaming-API einführte. Die Streaming-API ermöglichte es damals, dass Twitter einen Client quasi in Echtzeit mit neu angekommenen Tweets versorgt. Vorher musste man regelmäßig (z.B. alle 5 Minuten) die API abfragen, und soetwas wie "direkte Kommunikation" war quasi unmöglich, weil man halt nur alle 5 Minuten mal sehen konnte, was der "Chatpartner" geschrieben hatte.  
Da die Streaming-API allerdings mit einer PHP-Anwendung keinen Sinn macht, musste ich den Geotweeter neu schreiben. Dieses Mal war die Sprache meiner Wahl dann JavaScript.  
Bevor die Programmierer unter meinen Lesern jetzt aufstöhnen: JavaScript läuft problemlos unter allen Betriebssystemen, man braucht nur einen Browser. Und so schlimm, wie ihr alle tut, ist es gar nicht.

Auf jeden Fall wuchs dann halt der JavaScript-basierte Geotweeter fleißig vor sich hin. Ich schaffte es sogar, die ersten User von ihm zu überzeugen. Der [@johnassel](https://twitter.com/johnassel) benutzt ihn zum Beispiel immer noch und codet auch fleißig mit.

Blöderweise wurde der Code vom Geotweeter irgendwann absolut zu unübersichtlich und ich schrieb ihn zum dritten Mal neu. Diesmal in Coffeescript. Da ist quasi eine Syntaxerweiterung für JavaScript und der Code wird anschließend zu reinem JavaScript kompiliert. Dafür macht CoffeeScript das Coden allerdings viel angenehmer und man kann auch ordentlich Objektorientiert coden, was der Geotweeter derzeit auch fleißig nutzt.

Und inzwischen habe ich den Geotweeter dann noch um ein paar (meines Wissens nach) für Twitter-Clients (noch?) einmaligen Features ergänzt. Thumbnail-Anzeige und Autocompletion (!) für ragefac.es.  
Außerdem kann er mit mehreren Accounts umgehen, synchronisiert den "Gelesen-Status" der Tweets über tweetmarker.net und, und, und.

![ragefac.es-Autocompletion in Aktion](/images/2012-04-27/geotweeter_2.png)

Einziger Nachteil vom Geotweeter als JavaScript-App: Man braucht derzeit auf Grund von Sicherheitsfeatures bei JS einen Webserver im Hintergrund. Aber die Leute von Twitter werden derzeit von mir und noch ein paar Entwicklern davon überzeugt, die API entsprechend zu ändern, damit der Geotweeter direkt darauf zugreifen darf. Wenn das einmal der Fall sein wird (und die Zeichen stehen wohl ziemlich gut), wird es ausreichen, den Geotweeter herunterzuladen und die index.html anzuklicken. Das wird großartig werden!

Ansonsten: Wer den Geotweeter mal testen möchte, melde sich einfach mal bei mir. Ich habe da eine Demo-Test-Version laufen, die ihr gerne (auch länger) testen könnt.  
Oder aber ihr holt euch direkt den Code von [Github](https://github.com/fabianonline/geotweeter) und installiert ihn euch lokal.
