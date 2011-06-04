---
layout: post
title: "Ade, Wordpress. Hallo, Jekyll."
published: true
tags:
  - blog
---

Ich habe es endlich getan. In diesem Blog war ja schon länger nicht mehr
wirklich viel los; allerdings hatte ich doch schon noch vor, hier mal wieder
etwas mehr Aktivität zu zeigen.

Eine Sache gab es dabei jedoch, die auf mich irgendwie "abstoßend" wirkte:
Wordpress. Ich meine, Wordpress ist eine coole Blog-Software. Allerdings
benötigt sie natürlich recht viel Leistung (PHP-Skripte, MySQL-Server) und
stellt natürlich auch ein gewisses Risiko für den Server da. Denkt man mal
nicht daran, ein Update einzuspielen, hat man u.U.  auf einmal irgendwelche
Hacker auf dem Server...

<!--more-->

Also musste eine neue Software her. Und die heißt
"[Jekyll](https://github.com/mojombo/jekyll)".  Jekyll erstellt aus Posts, die
ich als einzelne Dateien angelegt habe, statische HTML-Dateien. Die dann zum
Einen von jedem noch-so-alten Webserver ausgeliefert werden können und zum
Anderen defintiv keine Sicherheitsrisiken für den Server darstellen.

Okay, dynamische Sachen wie zum Beispiel Kommentare fallen damit natürlich
raus, aber einerseits könnte ich die über einen externen Dienst (Stichwort
"Disqus") nachrüsten - und andererseits, seien wir doch mal ehrlich, sind
Kommentare in Blogs abseits der wirklich großen Blogs eh tot. Zudem hatte ich
in letzter Zeit eh eine gewisse Paranoia bei neuen Kommentaren entwickelt, weil
ich überall Leute witterte, die nur scharf darauf waren, einen Link zu ihrer
Seite irgendo unterzubringen...

Um das Ganze richtig cool zu machen, liegen die gesamten Quell-Dateien für
dieses Blog [bei github](https://github.com/fabianonline/fabianonline.de), sind
also völlig frei einsehbar und können euch vielleicht als Vorlage oder
"Nachschlagewerk" dienen, wenn ihr selber mal mit Jekyll spielen wollt.


Übrigens: Sämtliche Posts sowohl aus meinem alten Wordpress-Blog als auch aus
meinem "alten alten" Serendipity-Blog konnte ich recht problemlos zu
Jekyll-Posts umwandeln, wodurch endlich alle meine geistigen Ergüsse in einem
Blog versammelt sind (früher gab es blog.fabianonline.de und
fabianonlinede/blog - zwei verschiedene Blog mit verschiedenen Inhalten). Dazu
kam dann noch eine .htaccess, die möglich viele der alten URLs auf die neuen
URLs umbiegt, und fertig.  Zum Import-Prozess und der .htaccess werde ich dann
aber in einem seperaten Post mal noch etwas ausführlicher etwas schreiben.
