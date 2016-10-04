Eine kleine Sammlung nützlicher Tools für uberspace.
Um bei neuen Projekten nicht etwas zu vergessen, habe ich mir eine kleine Toolssammlung zugelegt.

**Das Ganze ist noch nicht fertig!** Bei Fehlern oder Verbesserungsvorschlägen bitte kurzes Feedback.
Das Ganze ist eigentlich für mich selber gedacht. Benutzung daher ausdrücklich auf eigene Gefahr!

= Was ist drin =
== logrotate ==
Neben den Logs von uberspace-Diensten sollen auch eigene erstellt werden können. ~/logs/ ist nicht schreibbar. Daher wird ~/.logs/ verwendet.

== Mailfilter ==
Spamfilterung -> Dank an [Nerdoc](https://github.com/nerdoc/uberspace-tools)

== Letsencrypter ==
Renewal für Letsencrypt-Zertifikate (basierend auf [Nerdoc](https://github.com/nerdoc/uberspace-tools)) und noch nicht fertige automatische Erstellung der Zertifikate.
(Grundlage ist eine entsprechende Konfig-Datei ~/.config/letsencrypt/$DOMAIN.cli.ini [z.Bsp. meindomain.de.cli.ini]. Ich mache Zertifikate mit mehreren Domains nur für www/ohne www. Ansonsten bekommt jede Domain eine eigene cli.ini)

== Logscanner ==
Logscanner von [gehaxelt](http://www.gehaxelt.in/blog/ueberspace-logscanner/) für grobe Scans der Weblogs. Falls es Probleme gibt, wird eine Mail versandt.

== Quota ==
mu-quota zeigt den genutzten Speicher des Nutzers an, damit nicht jedesmal die Optionen eingegeben werden müssen.

== Setup ==
Die uberspace-tools auf dem uberspace speichern, mu-install.sh ausführbar machen und starten.
```bash
chmod +x mu-install.sh
./mu-install.sh
```

= Sonstiges =
mu-xxx - MyUberspace … so merke ich mir die wichtigsten Befehle schneller.

Danke an die Autoren der genutzten Tools, das Wiki von uberspace und natürlich uberspace für das geniale Hostingkonzept.

genutzte Software:
mailfilter, Letsencrypt-renewer - https://github.com/nerdoc/uberspace-tools
logscanner - http://www.gehaxelt.in/blog/ueberspace-logscanner/