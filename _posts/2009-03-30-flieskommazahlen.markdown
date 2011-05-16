--- 
layout: post
title: "Flie\xC3\x9Fkommazahlen"
tags: 
- kurioses
---
In der Computertechnik ist es nicht unbedingt einfach, Kommazahlen zu speichern: Eine Möglichkeit, dies zu tun, besteht bei Beträgen mit einer festen Zahl an Stellen hinter dem Komma, das Komma einfach wegzulasen: In einem Onlineshop rechnet man intern einfach mit Preisen in Cent statt in Euro, einen Betrag von 1,23 Euro speichert man also einfach als 123.
Wenn man dagegen nicht von vornherein weiß, wie die zu speichernden Zahlen aussehen werden, verwendet man dafür einfach die sogenannten Fließkommazahlen. Diese hier zu erklären wäre viel zu aufwändig, wer sich dafür interessiert, kann sich einfach mal den <a href="http://de.wikipedia.org/wiki/Flie%C3%9Fkomma" alt="Wikipedia: Fließkommazahlen">passenden Wikipedia-Eintrag</a> durchlesen. Allerdings haben diese Fließkommazahlen einen mehr oder weniger großen Nachteil: Sie können nicht alle Zahlen genau ausdrücken. Ein guter Programmierer sollte sich dieser Tatsache bewusst sein und seine Anwendungen dementsprechend programmieren - aber man kann dieses halt auch mal vergessen.

Und so kommt es, dass ein Onlineshop von mir 8,98000000000000119 EUR als Versandkosten verlangt.
