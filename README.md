
OOP Chef Demo
=============

Das Git Repository mit den Beispielen aus unserem OOP Vortrag ["Zu Viele Köche verderben den Brei - Kochen mit Devs und Ops"](http://www.sigs-datacom.de/oop2013/konferenz/sessiondetails.html?tx_mwconferences_pi1%5BshowUid%5D=1037&tx_mwconferences_pi1%5Banchor%5D=%23Di33&tx_mwconferences_pi1%5Bs%5D=0).

Die passenden Folien dazu gibt es auf dem [Zühlke Slideshare Account](http://bit.ly/z_slideshare).

Wo finde ich was?

 * **vagrant-1:** minimales `Vagrantfile` anhand dem wir `vagrant up`, `vagrant status`, `vagrant ssh`, usw gezeigt haben
 * **chef-1:** 
  * das `Vagrantfile` wurde um Provisionierung mit Chef erweitert - damit installieren wir PostgreSQL bzw. Tomcat auf den Vagrant VMs
  * in dem `Cheffile` sind die entsprechenden Cookbooks als Abhängigkeiten definiert, die wir per `librarian-chef install` angezogen haben
 * **myapp-1:** das vollständige Beispiel wie wir eine Java Applikation mit Chef und Vagrant automatisiert deployen
  * in dem `Cheffile` wird nun auch unser eigenes `myapp` Cookbook referenziert
  * in dem `Vagrantfile` werden nun die `myapp::db` und `myapp::web` Rezepte für die Provisionierung benutzt
 * **my-cookbooks/myapp:** ist das Kochbuch, das via `include_recipe` der entsprechenden Rezepte zunächst Tomcat und PostgreSQL installiert
  * in dem `myapp::db` Rezept wird anschließend die Datenbank und der DB User für unsere Applikation erstellt
  * im `myapp::web` Rezept wird die Applikation für die Datenbank konfiguriert und im Tomcat deployed    
