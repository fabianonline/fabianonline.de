--- layout: post title: "Umzug von Wordpress zu Jekyll" published: true tags:
  - blog
  - howto ---

Nachdem ich jetzt schon das eine oder andere Mal gefragt wurde, wie ich denn
die Inhalte meiner alten Blogs zu Jekyll migriert habe, gibt es hier dann also
ein kleines Howto. In diesem Fall dann erstmal für den Wordpress-Teil der
Migration.

<!--more-->

Für die eigentliche Datenkonvertierung habe ich bei github ein gist mit einem
[passenden Wordpress-Importer](https://gist.github.com/790971) gefunden und
gleich mal ein kleines bisschen angepasst. Die [von mir verwendete Version des
Skripts](https://github.com/fabianonline/fabianonline.de/blob/master/_scripts/wordpress_importer.rb)
gibt's bei github.

Man kann sie wie folgt aufrufen:

{% highlight bash %}
ruby -r 'wordpress' -e 'Jekyll::WordPress.process(
  "<DB_NAME>", "<DB_USER>", "<DB_PASS>");'
{% endhighlight %}

Statt <DB_NAME> setzt ihr natürlich den Namen der MySQL-DB ein und als
<DB_USER> und <DB_PASS> passende Zugangsdaten. Das Skript geht stillschweigend
davon aus, dass der MySQL-Server auf localhost läuft. Ansonsten sollte es für
euch nicht schwer sein, das Skript anzupassen.

Das Skript erstellt dann automatisch einen Ordner "_posts", in dem für jeden
Blogeintrag des Wordpress-Blogs eine Post-Datei für Jekyll liegt.

Im Prinzip kann man die Dateien dann einfach in den _posts-Ordner von Jekyll
werfen und ist schon fertig damit - bei mir war das allerdings nicht ganz so einfach.
In den Wordpress-Posts waren die Links zu Bildern mit absoluten Pfaden angegeben.
Im Standard-Wordpress-Verzeichnis-Layout. Also z.B.
"http://blog.fabianonline.de/wp-content/uploads/test.jpg". Das war für mich aus
zwei Gründen nicht ganz so toll:

* Dieses "wp-content" schaut nicht wirklich toll aus. Ich will es lieber
  loswerden, statt weiter mit herumschleppen.  
* Absolute Pfade müssen doch auch nicht sein. Lieber relativ.

Das Problem, in vielen Dateien nach bestimmten Strings zu suchen und selbige
durch was anderes zu ersetzen, kann man mit Ruby recht einfach lösen.  Ich
verwendete einfach folgenden Befehl:

{% highlight bash %}
ruby -pi.bak -e "gsub(/http:\/\/blog.fabianonline.de\/wp-content\/uploads\//,
  '/uploads/images/')" _posts/*.markdown
{% endhighlight %}

Dieser Befehl geht alle passenden Dateien (_posts/*.markdown) durch, sucht und
ersetzt dort "http://blog.fabianonline.de/wp-content/uploads/" durch
"/uploads/images/" und erzeugt, wenn eine Datei geändert wurde, eine passende
Backup-Datei mit ".bak" als Endung. Das kann man ganz wunderbar nutzen, um
stichprobenartig Dateien a la "Vorher / Nachher" zu vergleichen und zu schauen,
ob auch alles geklappt hat. Ich musste bei mir das gleiche nochmal für
/wp-content/main machen, weil ich das PhotoQ-Plugin für Wordpress nutzte,
welches dort die Bilder speicherte. Danach dann halt mal eben "rm *.bak" und
schon ist der ordner wieder wunderschön aufgeräumt.

Nachdem nun die Links in den markdown-Files angepasst waren, reichte ein
einfaches "cp wordpress_blog/wp-content/uploads/* jekyll_blog/uploads/images",
um die ganzen Dateien in den Root des Jekyll-Ordners zu kopieren. Nach einem
Durchlauf von Jekyll sollten dann jetzt die "neuen" "alten" Posts im Ergebnis
auftauchen und auch die Bilder-Links funktionieren.

Eine letzte Sache blieb dann noch: Ich wollte möglichst viele Links des alten
Blogs auch im neuen Blog verfügbar haben. Ich habe mir noch [ein kleines
Skript](https://github.com/fabianonline/fabianonline.de/blob/master/_scripts/check_permalinks.rb)
geschrieben, welches die sitemap.xml (für die hatte ich ein extra-Plugin
installiert) vom alten Blog abrief (der Einfachkeit halber via HTTP) und
prüfte, welche der Links im Ergebnis von Jekyll nicht mehr funktionieren
würden. Das sah bei mir allerdings sehr gut aus, bis auf ein oder zwei
Ausnahmen blieben alle Links funktionsfähig. Was natürlich vor Allem daran lag,
dass die Permalink-Struktur im Wordpress-Blog der
"pretty"-Permalink-Einstellung von Jekyll ziemlich sehr ähnlich war.

Allerletzter Schritt: Weiterleitungen einrichten. Folgende Zeilen kamen bei mir
in die
[.htaccess](https://github.com/fabianonline/fabianonline.de/blob/master/.htaccess):

{% highlight apacheconf %}
RewriteEngine On

RewriteRule ^wp-content/uploads/(.*)$  /uploads/images/$1  [R=permanent]
RewriteRule ^wp-content/main/(.*)$     /uploads/images/$1  [R=permanent]

RewriteRule ^feed/(.*)$                /atom.xml           [R=permanent]
{% endhighlight %}

Zwei Regeln, um Anfragen an die alten Bild-URLs zu den neuen URLs zu leiten, und
eine, um sämtliche Anfragen zu den RSS-Feeds auf die neue atom.xml umzuleiten.

Und fertig. So läuft das bei mir. Und als nächstes kommt dann der Umzug meiner
Posts von Serendipity zu Jekyll dran.  Schonmal als "Vorwarnung": Es beinhaltet
über 1200 Zeilen in der .htacces...

