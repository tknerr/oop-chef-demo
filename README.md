
OOP Chef Demo
=============

Das Git Repository mit den Beispielen aus unserem OOP Vortrag "Zu Viele Köche Verderben den Brei - Kochen mit Devs und Ops"

Die passenden Folien dazu gibt es auf Slideshare:
http://bit.ly/z_slideshare

Wo finde ich was?

 * *vagrant-1:* minimales `Vagrantfile` anhand dem wir `vagrant up`, `vagrant status`, `vagrant ssh`, usw gezeigt haben.
 * *chef-1:* das `Vagrantfile` wurde um Provisionierung mit Chef erweitert - damit installieren wir PostgreSQL bzw. Tomcat auf den Vagrant VMs. In dem `Cheffile` sind die entsprechenden Cookbooks als Abhängigkeiten definiert, die wir per `librarian-chef install` angezogen haben.
 * *myapp-1:* das vollständige Beispiel wie wir eine Java Applikation mit Chef und Vagrant automatisiert deployen. In dem `Cheffile` wird nun auch unser eigenes `myapp` Cookbook referenziert
 * *my-cookbooks/myapp:* ist das Cookbook, das via include der entsprechenden Kochbücher zunächst Tomcat und PostgreSQL installiert. Anschließend wird in dem `db` Rezept die Datenbank und der DB User für unsere Applikation erstellt, und im `web` Rezept die Applikation für die Datenbank konfiguriert und im Tomcat deployed.    
