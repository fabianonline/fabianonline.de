--- 
layout: post
title: "\"Schnell mal eben\" auf die Twitter-API zugreifen"
tags: []

---
Seitdem Twitter von Basic Auth auf OAuth umgestellt hat, ist der Zugriff auf die Twitter-API nicht mehr ganz so einfach möglich. Allzu kompliziert ist es aber dann auch nicht... Für dieses Mini-Tutorial gehe ich mal davon aus, dass ihr einen kleinen Bot schreiben wollt, der z.B. regelmäßig Tweets absendet. Sprache der Wahl ist hier PHP, das sollte auf den meisten Servern und so eh schon verfügbar sein.
<!--more-->
<ol>
<li>Besucht <a href="http://dev.twitter.com/apps/new">http://dev.twitter.com/apps/new</a> und loggt euch dort mit dem Account ein, unter dem dann auch auf die API zugegriffen werden soll.</li>
<li>Im folgenden Formular gebt ihr die gewünschten Daten ein:
<ul><li>Einen Namen für die App. Kann eigentlich alles sein. Wenn der Bot tweetet, steht bei den Tweets "via $appname". Darf u.a. nicht "twitter" enthalten.</li>
<li>Eine kleine Beschreibung der App.</li>
<li>Einen Link zu der App. Kann ansonsten auch zu eurer Homepage oder eurem Twitterprofil führen.</li>
<li>Als Organisation tragt euren Twitter-Login ein.</li>
<li>Application-Type ist "Browser".</li>
<li>Eine "Callback-URL" braucht ihr hier eigentlich nicht, allerdings will Twitter eine, also tragt hier einfach die Adresse eures Blogs ein oder so.</li>
<li>"Default Access Type" sollte "Read &amp; Write" sein, außer, euer Bot soll ausschließlich Tweets lesen und selber nix versenden.</li>
<li>Dann noch den Captcha-Code eingeben und fertig.</li>
</ul></li>
<li>Ihr kommt dann auf die Übersichtsseite zu eurer neuen App. Von hier braucht ihr die Werte "Consumer key" und "Consumer secret". Kopiert euch die Werte irgendwo hin, und haltet sie nach Möglichkeit geheim.</li>
<li>Klickt am rechten Rand auf "My Access Token".</li>
<li>Kopiert euch von hier den "Access Token" und "Access Token Secret". Auch diese Werte solltet ihr geheimhalten.</li>
<li>Jetzt geht's ans Code Schreiben. In diesem Tutorial schreiben wir eine kleine App, die einen "Hallo Welt"-Tweet absendet.Erstellt eine weitere PHP-Datei im gleichen Ordner. </li>
<li>Ihr braucht zwei PHP-Libraries: <a href="http://github.com/abraham/twitteroauth/raw/master/twitteroauth/OAuth.php">OAuth.php</a> und <a href="http://github.com/abraham/twitteroauth/raw/master/twitteroauth/twitteroauth.php">twitteroauth.php</a>. Ladet beide Dateien herunter und speichert sie in einem Ordner.</li>
<li>Dazu kommt dann noch ein bisschen Code von euch:
{% highlight php %}
<?php
require_once('twitteroauth.php');
define('OAUTH_CONSUMER_KEY', 'abc123');
define('OAUTH_CONSUMER_SECRET', 'def456');
define('OAUTH_ACCESS_TOKEN', 'ghi789');
define('OAUTH_ACCESS_TOKEN_SECRET', 'jkl012');
$conn = new TwitterOAuth(OAUTH_CONSUMER_KEY, OAUTH_CONSUMER_SECRET, OAUTH_ACCESS_TOKEN, OAUTH_ACCESS_TOKEN_SECRET);
$conn->post('statuses/update', array('status'=>'Hallo, Welt!'));
{% endhighlight %}
Bei den vier define-Anweisungen ersetzt ihr die vier Demo-Werte durch die Werte, die ihr von Twitter bekommen habt.</li>
<li>Was der Code macht:<ul>
<li>In Zeile 2 wird die Library, die ihr runtergeladen habt, eingebunden.</li>
<li>In Zeile 7 wird ein OAuth-Objekt mit euren Keys initialisiert.</li>
<li>In Zeile 8 wird dann ein POST-Request an den Twitter-API-Endpunkt "statuses/update" gesendet, mit dem Parameter "status", der den Wert "Hallo, Welt!" hat.</li></ul></li>
<li>Wenn ihr den Code ausführt, sollte automatisch solch ein Tweet abgesetzt werden. Yaaay. ;-)</li>
<li>Wenn ihr noch andere Sachen machen wollt: Auf <a href="http://dev.twitter.com/doc">http://dev.twitter.com/doc</a> findet ihr alle Methoden, die die Twitter-API anbietet.</li>
<li>Ein Beispiel: Wollt ihr z.B. eure Timeline abrufen, nutzt ihr (die ersten 7 Zeilen der App sollten gleich bleiben):
<code>
$data = $conn->get('statuses/home_timeline', array('count'=>'100'));
print_r($data);
</code>
Der Code macht einen GET-Request zu statuses/home_timeline mit dem Parameter "count" mit dem Wert "100". Die Daten von Twitter werden automatisch geparst und euch als Array zurückgeliefert, welches dann via print_r() ausgegeben wird.
</li>
</ol>
Viel Spaß mit der Twitter-API. ;-)
