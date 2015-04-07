CREATE KEYSPACE devoxx
WITH replication = {
	'class': 'SimpleStrategy',
	'replication_factor': 1
};

use devoxx;

DROP TABLE IF EXISTS speaker;
CREATE TABLE speaker (
   id_speaker text PRIMARY KEY,
   nom_speaker text,
   societe text,
   twitter text
);

DROP TABLE IF EXISTS talk;
CREATE TABLE devoxx.talk (
      annee int,
      titre text,
	  categorie text,
      type_talk text,
      speakers set<text>,      
      PRIMARY KEY (annee, titre)
);

DROP TABLE IF EXISTS talk_par_speaker;
CREATE TABLE talk_par_speaker(
	id_speaker text,
	type_talk text,
	titre text,
	annee int,
	PRIMARY KEY(id_speaker, type_talk, titre)	
);

DROP TABLE IF EXISTS talk_par_societe;
CREATE TABLE talk_par_societe(
	societe text,
	type_talk text,
	titre text,
	annee int,
	PRIMARY KEY(societe, type_talk, titre)	
);

DROP TABLE IF EXISTS devoxx.type_talk_par_annee;
CREATE TABLE devoxx.type_talk_par_annee(
     type_talk text,
     annee int,
     nb int,
     PRIMARY KEY(type_talk, annee)
) WITH CLUSTERING ORDER BY (annee ASC);


DROP TABLE IF EXISTS devoxx.speaker_par_annee;
CREATE TABLE devoxx.speaker_par_annee(
     nom_speaker text,
     annee int,
     nb int,
	 id_speaker text,
     PRIMARY KEY(nom_speaker, annee)
) WITH CLUSTERING ORDER BY (annee ASC);

DROP TABLE IF EXISTS devoxx.keyword_par_annee;
CREATE TABLE devoxx.keyword_par_annee(
     keyword text,
     annee int,
     nb int,
     PRIMARY KEY(keyword, annee)
) WITH CLUSTERING ORDER BY (annee ASC);

DROP TABLE IF EXISTS devoxx.societe_par_annee;
CREATE TABLE devoxx.societe_par_annee(
     societe text,
     annee int,
     nb int,
     PRIMARY KEY(societe, annee)
) WITH CLUSTERING ORDER BY (annee ASC);

DROP TABLE IF EXISTS speaker_par_societe;
CREATE TABLE speaker_par_societe (
   id_speaker text,
   nom_speaker text,
   societe text,
   twitter text,
   PRIMARY KEY(societe, id_speaker)
);

use devoxx;


insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Réduire la pression sur l''allocation mémoire : le prochain pas dans l''optimisation des performances de la JVM','','TIA',{'benoitperroud','olivierlamy'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Tester une application Web avec Selenium 2, Selenium Grid et TestNG','','TIA',{'mathildelemee'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'GPGPU facile avec JavaCL, et trivial avec ScalaCL !','','TIA',{'olivierchafik'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Pratiquer DDD en un éclair','','TIA',{'ulrichvachon'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Chouchoutez votre code JavaScript','','TIA',{'romainlinsolas'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Apache Buildr','','TIA',{'alexismidon'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Continuous deployement : Rackspace, Chef et capistrano en action','','TIA',{'bertrandpaquet'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Simplifiez vos développements Android avec AndroidAnnotations !','','TIA',{'pierre-yvesricau','alexandrethomas'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Réaliser des tests de charges avec Gatling','','TIA',{'stéphanelandelle','romainsertelon'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'JDK 8 demo: lambdas in Action','','TIA',{'guillaumetardif'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'De l''audit de Code à l''Inspection Continue','','TIA',{'oliviergaudin'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Dessine moi un language: à la découverte de Xtext','','TIA',{'jeffmaury'});



insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Le taré du terminal: outil pour le développeur de l''extrême','','TIA',{'emmanuelbernard'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'HAProxy level 2 : des bases aux problématiques de scaling','','TIA',{'nicolashelleringer'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'OpenBCI ou comment lire dans les pensées en Java','','TIA',{'mathieuancelin'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'RxJava - From Future To Rx','','TIA',{'bricedutheil','davidwursteisen'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Déboguage de JavaScript','','TIA',{'christophejollivet'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Modulariser son application AngularJS avec Browserify','','TIA',{'antoinerichard'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Coder Tetris en JavaScript, CoffeeScript, ClojureScript, GopherJs et elm','','TIA',{'philippeantoine'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Codez et déployez votre première application Web avec Ceylon','','TIA',{'stéphaneepardaud','julienviet'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Sortez couverts avec Hystrix','','TIA',{'thomasrecloux'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'TypeScript, le JavaScript statiquement typé','','TIA',{'benoitlemoine'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Développer des applications multiplateformes facilement à l''aide de Ionic Framework','','TIA',{'stéphaniemoallic'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Elles ressemblent à quoi mes données ?','','TIA',{'davidpilato','colinsurprenant'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Un Jenkins amélioré avec Docker, Mesos et Marathon','','TIA',{'jean-louisrigau'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Créer des scènes 3D dans un navigateur web avec Three.js','','TIA',{'zheli'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Développement Java avec un IDE dans le Cloud: YES WE CAN','','TIA',{'sunsengdavidtan','florentbenoit'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Des applications Java #?!@ing Manageable','','TIA',{'emmanuelhugonnet','alexishassler'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Java dans le hardware avec la librairie Libbulldog','','TIA',{'laurenthuet'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'WireMock, le serveur HTTP couteau suisse','','TIA',{'etiennepeiniau'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Gitflow in action','','TIA',{'céciliabossard'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Elasticsearch - De l''importance du mapping','','TIA',{'jérômemainaud'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Utilisation de SparkSQL pour analyser vos données Cassandra en Java, Scala et Python','','TIA',{'alexanderdejanovski','maxencelecointe'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Quand Java prend de la vitesse, Apache Maven vous garde sur les rails','','TIA',{'arnaudheritier','hervéboutemy'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'InfluxDB : la base de données chronologique OpenSource autonome','','TIA',{'nicolasmuller'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Et si on arrêtait de se prendre la tête avec la documentation','','TIA',{'guillaumescheibel'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'JavaScript : analyser le code spaghetti d''une page web avec Yellow Lab Tools','','TIA',{'gaëlmétais'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Armez-vous d''un pixel monitoring avec Zeno !','','TIA',{'matthieufourtina'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Une présentation qui ne manque pas d''R!','','TIA',{'nathanielrichand','philippevasconcelos'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'App Engine Managed VMs et Fluent-http, un mariage heureux','','TIA',{'davidgageot'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'React, une autre façon de penser vos composants graphiques','','TIA',{'mathieuancelin'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'La phygitalisation, le super pouvoir du développeur!','','TIA',{'cyrillakech','bertrandgressier'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Tour d’horizon des outils pour être un développeur web productif','','TIA',{'jean-francoisgarreau','julienlanduré'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Comment créer un Web Component en moins de 30 minutes','','TIA',{'christophejolif'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Comment Akka persistence fera de vous un meilleur développeur !','','TIA',{'fredcecilia'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Jeu de rôle en ligne massivement multijoueur avec Firebase','','TIA',{'alexismoussine-pouchkine','thomasguerin'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Oserez vous remplacer JPA par un micro ORM?','','TIA',{'youenchéné','pierreleresteux'});



insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Expression Oriented Programming with F#','','TIA',{'robertpickering'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Golo, de la sucrette syntaxique pour vos applications Java','','TIA',{'philippecharrière'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Programmation et musique avec Clojure et Overtone','','TIA',{'mathieugandin'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'REST facile et robuste avec Vert.x et Groovy','','TIA',{'aurélienmaury'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Un framework Web from scratch en Scala','','TIA',{'françoissarradin'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'30 minutes pour développer une appli Java EE ? C''est largement suffisant avec Forge 2.0!','','TIA',{'antoniogoncalves'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Mesurer directement depuis le CPU: les compteurs de performance','','TIA',{'jean-philippebempel'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Microbenchmarking avec JMH','','TIA',{'henritremblay'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'One Java library to rule all security protocols','','TIA',{'jérômeleleu'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Tout ce que vous avez toujours voulu savoir de la JVM sans jamais oser lui demander en ligne de commande','','TIA',{'briceleporini'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'ZeroMQ : des super sockets pour insérer facilement 400 msg/s dans Elasticsearch','','TIA',{'bertrandpaquet'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Au secours, mon portable part en prod ! (ou presque...)','','TIA',{'pierrechaussalet'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Git++ : Passez au niveau supérieur de la gestion de version','','TIA',{'cyrillakech','hubertsablonnière'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'HAProxy+Keepalived le loadbalancer in house facile','','TIA',{'nicolashelleringer'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'SonarQube sans quitter son IDE','','TIA',{'julienhenry'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'15''pour coder Tetris en CoffeeScript','','TIA',{'philippeantoine'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Apprenez les ficelles de Marionette','','TIA',{'romainmaton'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Créons un web component avec Polymer','','TIA',{'julienjakubowski','romainlinsolas'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Karma et Protractor, testons vos applications AngularJS','','TIA',{'christophejollivet'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Models and Rest APIs on AngularJS with Restangular','','TIA',{'martingontovnikas'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'One tool to module them all','','TIA',{'pauldijou'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'WebSocket, NoSQL, et Non-Blocking Server-Side I/O avec Kaazing, MongoDB, et Node.js','','TIA',{'tugdualgrall'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Bluetooth Low Energy, votre téléphone comme passerelle de l''internet des objets','','TIA',{'romainmenetrier'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Robotium vs Espresso: Get ready to rumble !','','TIA',{'thomasguerin'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Ansible in action - le provisionning au bon niveau d''abstraction','','TIA',{'oliviergirardot'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Comment développer un PaaS Java en 30 minutes avec docker','','TIA',{'nicolasmuller','fabienamico'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Détection de malwares par leur empreinte réseau.','','TIA',{'thomasbailet'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Machine Learning, Python et Open Data : démonstration d''un cas d''usage pour geek','','TIA',{'christophebourguignat'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Redis, une base Not Only NoSQL','','TIA',{'nicolasmartignole'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Spark the data scientist’s toolbox','','TIA',{'tugdualsarazin'});



insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'24 Plugins Chrono','','TIA',{'romainmaton'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'3615 Cloud@Devoxx','','TIA',{'laurenthuet','nicolasloof'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Arquillian pour des tests Web simples et efficaces','','TIA',{'alexishassler'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Build & Deploy on your own cloud','','TIA',{'xaviercoulon'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'CRaSH le shell pour la plateforme Java','','TIA',{'julienviet','alaindefrance'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Déminage d''une application avec JRockit Mission Control','','TIA',{'françoisostyn'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Developing Modern Web Apps With Backbone.js','','TIA',{'sylvainzimmer'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Développer une application web à page unique en Dart','','TIA',{'yohanbeschi'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'eXtreme testing avec Byteman','','TIA',{'mathildelemee'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Faire parler son code source avec Sonar','','TIA',{'freddymallet'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Fast Forward: comment migrer un gros projet de SVN à Git','','TIA',{'renaudbruyeron','thomascarsuzan'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Git Push Deploy - developer collaboration in the cloud with Github & Heroku','','TIA',{'johnstevenson'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Golo, un langage simple et léger basé sur invokedynamic','','TIA',{'julienponge'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Good Bad and Ugly Maven - a puzzler session','','TIA',{'nicolasloof','arnaudheritier'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Gradle, 30 minutes pour tout changer','','TIA',{'sébastiencogneau'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'L''épluche légume : un outil simple et efficace. 5 outils en 5 minute chacun, pour être plus productif dans le développement de tous les jours','','TIA',{'guillaumetardif'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Live coding avec Yeoman & AngularJS','','TIA',{'matthieulux'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Musclez vos applis Android avec les outils du monde Java','','TIA',{'stephanenicolas','jeromevanderlinden'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'NFC, l''interaction facilitée des mobiles avec leur environnement','','TIA',{'romainmenetrier'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'No more (unsecure) secrets, Marty','','TIA',{'mathiasherberts'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Présentation de Frege, un langage fonctionnel dans l''esprit d''Haskell tournant sur la JVM','','TIA',{'yoricklaupa'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Programmation déclarative en Clojure: du destructuring à Datomic','','TIA',{'nilsgrunwald'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Réalité Augmentée avec Android','','TIA',{'atefhaouari'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'SARAH une maison Intelligente pour connecter les objets','','TIA',{'jean-philippeencausse'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Solutions pour programmation calcul de masse - Hadoop distribuée- Pig / Hive / Cascading / MapReduce','','TIA',{'floriandouetteau'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Soon, in a galaxy not so far away','','TIA',{'mathieuancelin'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Space Chatons: Bleeding Edge HTML5','','TIA',{'philippeantoine','pierregayvallet'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Spock, le testing nouvelle génération','','TIA',{'cédricchampeau'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Trucs et astuces avec Java et MongoDB sur Raspberry PI','','TIA',{'guillaumescheibel'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Weld-OSGi in action','','TIA',{'mathieuancelin'});




INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('adityabansod','Aditya Bansod','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('adrienblind','Adrien Blind','Société Générale','@adrienblind');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('adriengrand','Adrien Grand','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('adrientaypamart','Adrien Tay pamart','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('agnèscrepet','Agnes Crepet','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('alainboudard','Alain Boudard','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('alaindefrance','Alain Defrance','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('alainregnier','Alain Regnier','Alto Labs','@altolabs');


 


INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('albanphélip','Alban Phélip','xebia','');



INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('allandenis','Allan Denis','Motwin','');




INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('alexkosowski','Alex Kosowski','Oracle','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('alexsnaps','Alex Snaps','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('alexanderdejanovski','Alexander DEJANOVSKI','Chronopost International','@alexanderDeja');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('alexandreardhuin','Alexandre Ardhuin','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('alexandrebertails','Alexandre Bertails','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('alexandredelegue','Alexandre Delegue','serli','@chanksleroux');


INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('alexanderheusingfeld','Alexander Heusingfeld','innoQ','@goldstift');




INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('alexandrelacroux','Alexandre Lacroux ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('alexandremechain','Alexandre Mechain','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('alexandrenavarro','Alexandre Navarro','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('alexandrethomas','Alexandre Thomas','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('alexandrevasseur','Alexandre Vasseur','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('alexandrevictoor','Alexandre Victoor','Société Générale','@Alex_Victoor');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('alexisagahi','Alexis Agahi','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('alexisgaches','Alexis Gaches','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('alexisguéganno','Alexis Guéganno','Valwin','@agueganno');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('alexishassler','Alexis Hassler','sewatech','@AlexisHassler');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('alexiskinsella','Alexis Kinsella','Xebia','@alexiskinsella');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('alexismidon','Alexis Midon','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('alexismoussine-pouchkine','Alexis Moussine-Pouchkine','Google','@alexismp');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('alexisseigneurin','Alexis Seigneurin','Ippon Technologies','@aseigneurin');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('alinepaponaud','Aline Paponaud','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('alvinberthelot','Alvin Berthelot','','@alvinberthelot');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('amaurycrickx','Amaury Crickx ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('amiralakhal','Amira LAKHAL','Valtech','@miralak');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('andrewspencer','Andrew Spencer','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('andypetrella','Andy Petrella','NextLab','@noootsab');

INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('antoinedetante','Antoine Detante','InTech S.A.','@antoined');


INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('antoinerichard','Antoine Richard','SQLI','@richard_antoine');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('antoinesabot-durand','Antoine Sabot-Durand','Red Hat','@antoine_sd');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('antoinevernois','Antoine Vernois ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('antoninstefanutti','Antonin Stefanutti','Murex','@astefanut');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('antoniogoncalves','Antonio Goncalves','AGoncal Consulting','@agoncal');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('arnaudbailly','Arnaud Bailly','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('arnaudbétrémieux','Arnaud Bétrémieux ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('arnaudheritier','Arnaud Héritier','eXo platform','@aheritier');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('arnaudtaffanel','Arnaud Taffanel','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('arnaudtournier','Arnaud Tournier','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('arungupta','Arun Gupta','Red Hat','@arungupta');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('atefhaouari','Atef Haouari','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('audeamarrurtu','Aude Amarrurtu','Arolla','@AudeAmarrurtu');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('audreyneveu','Audrey Neveu','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('aurélieballet','Aurélie Ballet','Ullink','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('aurélienbroszniowski','Aurelien Broszniowski','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('aurélienmaury','Aurélien Maury','WeScale','@aurelienmaury');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('aurélienpelletier','Aurelien Pelletier','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('axelfontaine','Axel Fontaine','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('axelhaustant','Axel Haustant','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('azzeddineramrami','Azzeddine Ramrami','Groupe Pierre & Vacances CenterParcs','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('benevans','Ben Evans','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('benjamincabé','Benjamin Cabé','Eclipse Foundation','@kartben');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('benjamindegerbaix','Benjamin Degerbaix','LesFurets.com','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('benjaminmarron','Benjamin Marron','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('benoitbossuet','Benoit Bossuet','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('benoîtlacelle','Benoît Lacelle ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('benoitlemoine','Benoit Lemoine','Xebia','@benoit_lemoine');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('benoitperroud','Benoit Perroud','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('bertrandgressier','Bertrand Gressier','ADEO','bgressier');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('bertrandpaquet','Bertrand Paquet','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('bettymoreau','Betty MOREAU','ADR&Com','@AdretCom');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('bodilstokke','Bodil Stokke','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('brianclozel','Brian Clozel','Pivotal inc.','@brianclozel');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('briangoetz','Brian Goetz','Oracle','@briangoetz');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('bricedutheil','Brice Dutheil','Arkey','@BriceDutheil');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('briceleporini','Brice Leporini','Indépendant','@blep');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('brunoemsellem','Bruno Emsellem','','');

INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('brunoboucard','Bruno Boucard','','');





INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('camillemaussang','Camille Maussang ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('camilleroux','Camille Roux','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('carlosconde','Carlos Conde','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('carlossanchez','Carlos Sanchez','','csanchez');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('céciliabossard','Cécilia Bossard','Timwi Consulting','@ceciliaBossard');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('cédricchampeau','Cédric Champeau','n/a','@CedricChampeau');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('cédricfinance','Cédric Finance','Soat','@CedricFinance');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('cedricpineau','Cedric Pineau','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('charlesfry','Charles Fry','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('charlesnutter','Charles Nutter','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('christophebourguignat','Christophe Bourguignat','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('christophejolif','Christophe Jolif','IBM','@cjolif');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('christophejollivet','Christophe Jollivet','Apside TOP','@jollivetc');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('christopherbatey','Christopher Batey','DataStax','@chbatey');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('clarisseherrenschmidt','Clarisse Herrenschmidt','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('claudefalguiere','Claude Falguiere ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('clémentdelafargue','Clément Delafargue','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('clémentrochas','Clément Rochas','Xebia','@crochas');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('colinsurprenant','Colin Surprenant','elasticsearch','@colinsurprenant');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('craigmorrison','Craig Morrison','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('cypriendecouty','Cyprien Decouty','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('cyrilbalit','Cyril Balit','Sfeir','@cbalit');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('cyrillakech','Cyril Lakech','ADEO','@cyril_lakech');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('cyrilmorcrette','Cyril Morcrette','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('cyrilmottier','Cyril Mottier','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('cyrilledupuydauby','Cyrille DUPUYDAUBY ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('cyrilleleclerc','Cyrille Le Clerc','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('cyrillemartraire','Cyrille Martraire','Arolla','@cyriux');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('damiencavaillès','Damien Cavaillès','Tripndrive','@thedamfr');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('damienkrotkine','Damien Krotkine','Booking.com','@damsieboy');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('danallen','Dan Allen','OpenDevise','@mojavelinux');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('danhardiker','Dan Hardiker','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('danieldeluca','Daniel De Luca ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('dannygooris','Danny Gooris ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('davidblevins','David Blevins','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('daviddelabassee','David Delabassee','Oracle','@delabassee');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('davidgageot','David Gageot','Retour1024','@dgageot');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('davidkrolak','David Krolak','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('davidlarlet','David Larlet','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('davidlindsay','David Lindsay','Coverity','@thornmaker');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('davidmartin','David MARTIN','Ippon Technologies','@_dmartin_');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('davidpilato','David Pilato','elasticsearch','@dadoonet');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('davidwursteisen','David Wursteisen','Soat','@dwursteisen');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('didiergirard','Didier Girard','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('didierherbault','Didier Herbault','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('dimitribaeli','Dimitri BAELI','LesFurets.com','@dbaeli');

INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('dineshbolkensteyn','Dinesh Bolkensteyn','SonarSource','@dbolkensteyn');


INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('dmitryjemerov','Dmitry Jemerov','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('dominiqueguilbaud','Dominique Guilbaud','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('dominiquevandeth','Dominique Van Deth ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('duyhaidoan','DuyHai DOAN','Datastax','@doanduyhai');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('éamonnmcmanus','Éamonn McManus','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('edouardvanbelle','Edouard Vanbelle','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('ekbelbouzgarrou','Ekbel Bouzgarrou ','','');
 
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('ellènedijouxsiber','Ellène Dijoux Siber','AgileDev','@ElleneSiber');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('emmanuelbernard','Emmanuel Bernard','Red Hat','emmanuelbernard');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('emmanuelfeller','emmanuel feller','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('emmanuelhugonnet','Emmanuel Hugonnet','Red Hat','@ehsavoie');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('emmanuellecharny','Emmanuel Lecharny','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('emmanuelpavaux','Emmanuel PAVAUX ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('ericbottard','Eric Bottard','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('ericlemerdy','Eric le Merdy','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('ericleponner','Eric Le ponner','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('ericlefevre-ardant','Eric Lefevre-Ardant ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('ericmaillard','Eric Maillard ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('etiennepeiniau','Etienne Peiniau','Ekino','@lepnio');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('evgenymandrikov','Evgeny Mandrikov ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('eyallezmy','Eyal LEZMY','Genymobile','Eyal_Lezmy');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('fabienamico','Fabien Amico ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('fabricecroiseaux','Fabrice Croiseaux','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('fabricerobini','Fabrice Robini','Viadeo','@frobini');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('ferdatartanoglu','Ferda Tartanoglu','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('florenceherrou','Florence Herrou','Ippon Technologies','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('florentbenoit','Florent BENOIT','Codenvy','@florentbenoit');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('florentbiville','Florent Biville','Vidal / Freelance','@fbiville');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('florentduveau','Florent DUVEAU','Xebia','@florentduveau');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('florentlegall','Florent Le Gall','Xebia','@flornt');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('florentramière','Florent Ramière','Jaxio','@framiere');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('florianboulay','Florian Boulay','Next Performance','@FlorianBoulay');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('floriandouetteau','Florian Douetteau','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('francesccampoyflores','Francesc Campoy Flores','Google','@francesc');


 
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('françoisbeaufort','François Beaufort','Google','');

 
 
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('françoisledroff','François le Droff ','Adobe','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('francoisnollen','Francois Nollen','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('françoisostyn','Francois Ostyn','soat','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('françoissarradin','Francois Sarradin','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('frankpavageau','Frank Pavageau','Ekino','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('fredcecilia','Fred CECILIA','Sépage','@naikyworld');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('fredsimon','Fred Simon','JFrog','@freddy33');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('freddymallet','Freddy Mallet','SonarSource','@FreddyMallet');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('frédéricbardeau','Frédéric Bardeau','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('frédéricbouquet','Frédéric Bouquet ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('frédériccamblor','Frederic Camblor','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('frédéricdubois','Frederic Dubois','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('frederichornain','Frederic Hornain','Red Hat','@fhornain');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('fredericlemouel','Frederic Le Mouel','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('frédéricweisbecker','Frédéric Weisbecker ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('gabrielkastenbaum','Gabriel Kastenbaum','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('gaëlmétais','Gaël Métais','Freelance','@gaelmetais');



INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('gaëllebourven','Gaëlle BOURVEN','','');

INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('garrettsmith','Garrett Smith','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('gavinking','Gavin King','Red Hat','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('geertbevin','Geert Bevin ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('geoffreybérard','Geoffrey Bérard ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('geoffreydesmet','Geoffrey De Smet','Red hat','@GeoffreyDeSmet');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('geoffroycouprie','Geoffroy Couprie','','@gcouprie');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('ghislainseguy','Ghislain SEGUY ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('giltene','Gil Tene','Azul Systems','@giltene');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('gildascuisinier','Gildas Cuisinier','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('gillesbabinet','Gilles Babinet ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('gillesdiguglielmo','Gilles Di Guglielmo','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('gillesportier','Gilles Portier ','','');

INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('gojkoadzic','Gojko Adzic','Neuri Consulting LLP','@gojkoadzic');





INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('graylouis','Gray Louis','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('gregtruchetet','Greg Truchetet','Viadeo','@Myxz');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('gregtruty','Greg Truty','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('grégorypaul','Gregory Paul','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('grégoryweinbach','Grégory Weinbach','EZOKY','@gweinbach');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('guedesbruno','Guedes Bruno','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('guillaumearnaud','Guillaume Arnaud ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('guillaumebort','Guillaume Bort','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('guillaumeduquesnay','Guillaume Duquesnay','I''m my own company','@duquesnay');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('guillaumeehret','Guillaume Ehret ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('guillaumegirou','Guillaume Girou','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('guillaumelaforge','Guillaume Laforge','Pivotal','@glaforge');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('guillaumelours','Guillaume LOURS ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('guillaumescheibel','Guillaume Scheibel','Expedia','@g_scheibel');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('guillaumetardif','Guillaume Tardif','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('guymamou-mani','Guy Mamou-Mani ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('gwennaelgate','Gwennael Gate','','angus.ai');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('habibguergachi','Habib Guergachi','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('hadihariri','Hadi Hariri','JetBrains','@hhariri');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('hayssamsaleh','Hayssam Saleh','ebiznext','@hayssams');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('heinzkabutz','Heinz Kabutz','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('henrifournet','Henri Fournet ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('henrigomez','Henri Gomez ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('henritremblay','Henri Tremblay','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('henriverdier','Henri Verdier','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('hervéboutemy','Hervé Boutemy','ASF','@hboutemy');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('hirammadelaine','Hiram MADELAINE','Eloquent Logic','@HiramMadelaine');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('hoilam','Hoi Lam ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('hollycummins','Holly Cummins','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('horaciogonzalez','Horacio Gonzalez','Cityzen Data','@LostInBrittany');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('howardchu','Howard Chu','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('hubertsablonnière','Hubert SABLONNIÈRE','INEAT Conseil','@hsablonniere');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('hugogeissmann','Hugo Geissmann','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('hugolassiège','Hugo Lassiège','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('ivanbeauvais','Ivan Beauvais','Xebia','@ibeauvais');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('jamesward','James Ward','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('jamesweaver','James Weaver','Oracle','@JavaFXpert');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('jameswilliams','James Williams','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('jeanhelou','Jean Helou','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('jean-baptistedefard','Jean-Baptiste Defard ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('jean-baptistelemee','Jean-baptiste Lemee','','');

INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('jean-baptisteclaramonte','Jean-Baptiste Claramonte','','');

 
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('jean-baptistenote','Jean-Baptiste Note','Criteo','');

INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('jean-pascalthiery','Jean-Pascal Thiery','Criteo','');



INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('jean-christophesirot','Jean-Christophe Sirot','Arkena','@jcsirot');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('jean-eudescouignoux','Jean-Eudes Couignoux','Xebia','@Jean-Eudes');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('jean-françoisarcand','Jean-François Arcand','Async-IO.org','@jfarcand');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('jean-francoisdenise','Jean-francois Denise','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('jean-francoisgarreau','Jean-Francois Garreau','SQLI / GDG Nantes / Nantes Wit / Devoxx4Kids','@jefBinomed');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('jean-françoispaccini','Jean-François Paccini ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('jean-laurentdemorlhon','Jean-Laurent de Morlhon','Serpodile','@morlhon');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('jean-louisrigau','Jean-Louis Rigau','Xebia','@jlrigau');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('jean-louisrousselin','Jean-Louis Rousselin','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('jean-micheldoudoux','Jean-michel Doudoux','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('jean-philippebempel','Jean-Philippe Bempel','Ullink','@jpbempel');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('jean-philippebunaz','Jean-Philippe Bunaz ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('jean-philippeencausse','Jean-philippe Encausse','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('jean-pierredacher','Jean-Pierre Dacher','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('jeffmaury','Jeff Maury','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('jeffmaury','Jeff MAURY','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('jérémiechassaing','Jeremie Chassaing','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('jeremysevellec','Jeremy Sevellec','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('jérômebernard','Jérôme Bernard','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('jérômeleleu','Jerome Leleu','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('jeromelouvel','Jerome Louvel','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('jérômemainaud','Jérôme Mainaud','Ippon Technologies','@jxerome');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('jeromevanderlinden','Jerome Van der linden','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('jevgenikabanov','Jevgeni Kabanov','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('jimweaver','Jim Weaver','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('joemarini','Joe Marini ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('joelcostigliola','Joel Costigliola','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('joelgauci','Joel Gauci','IBM','@joel_gauci');

INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('joelwurtz','Joel Wurtzx','JoliCode','@joelwurtz');




INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('johnstevenson','John Stevenson','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('jonathanellis','Jonathan Ellis ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('jonathanlellouche','Jonathan Lellouche','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('jonathanwinandy','Jonathan Winandy','Valwin','ahoy_jon');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('josépaumard','José Paumard','Très indépendant','@JosePaumard');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('joshlong','Josh Long','Pivotal','starbuxman');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('juergenhoeller','Juergen Hoeller','Pivotal','@springjuergen');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('juliendubois','Julien Dubois','Ippon Technologies','@juliendubois');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('juliendurillon','Julien Durillon','Clever Cloud','@juuduu');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('julienhenry','Julien HENRY ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('julienjakubowski','Julien Jakubowski','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('julienjakubowski','Julien JAKUBOWSKI ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('julienlanduré','Julien Landuré','Zenika / GDG Nantes','@jlandure');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('julienponge','Julien Ponge','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('julienroche','Julien Roche ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('julienruchaud','Julien Ruchaud','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('julienvey','Julien Vey','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('julienviet','Julien Viet','Red Hat','@julienviet');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('kathrynrotondo','Kathryn Rotondo ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('katiaaresti','Katia Aresti ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('kevinbourrillion','Kevin Bourrillion','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('khalidjebbari','Khalid Jebbari','Freelance','@Dj3bbZ');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('kitomann','Kito Mann','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('kurtkluever','Kurt Kluever','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('kwameyamgnane','Kwame Yamgnane ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('lailletcédric','Laillet Cédric','Apside Top','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('laurentdoguin','Laurent Doguin','Couchbase','@ldoguin');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('laurenthuet','Laurent HUET','BA Systèmes','@lhuet35');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('laurentruaud','Laurent Ruaud','','');


INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('laurentvion','Laurent Vion','Criteo','');

 
 
 
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('loïcknuchel','Loïc KNUCHEL','Indépendant','loicknuchel');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('loïclebel','Loïc Le Bel','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('louisjacomet','Louis Jacomet','Terracotta','@ljacomet');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('louisrouffineau','Louis Rouffineau','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('lucbizeul','Luc Bizeul','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('luclegardeur','Luc Legardeur','Xebia','@llegardeur');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('ludovicborie','Ludovic Borie ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('ludovicchampenois','Ludovic Champenois','Google','@ludoch');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('ludoviccinquin','Ludovic Cinquin','OCTO TECHNOLOGY','@lcinquin');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('ludovichavel','Ludovic Havel','Optiflows','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('ludovicpiot','Ludovic Piot ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('ludovicpoitou','Ludovic Poitou','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('ludwineprobst','Ludwine Probst','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('majirusfansi','Majirus Fansi','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('mandywaite','Mandy Waite','google','@tekgrrl');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('marcbojoly','Marc Bojoly ','','');

INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('marcuseliasson','Marcus Eliasson','Bitcraze','@bitcraze_se');




INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('markuswinand','Markus Winand','Tuning developers for SQL performance','@MarkusWinand');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('martijnverburg','Martijn Verburg','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('martingontovnikas','Martin Gontovnikas ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('martingörner','Martin Gorner','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('martinodersky','Martin Odersky','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('martinthompson','Martin Thompson','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('mathiasherberts','Mathias Herberts','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('mathiasseguy','Mathias Seguy','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('mathieuancelin','Mathieu ANCELIN','SERLI','@TrevorReznik');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('mathieubreton','Mathieu Breton','Xebia','@MatBreton');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('mathieubroutin','Mathieu BROUTIN','Objectif Informatique','@mathieubroutin');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('mathieuchataigner','Mathieu Chataigner','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('mathieugandin','Mathieu Gandin ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('mathieuparisot','Mathieu Parisot','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('mathieupoumeyrol','Mathieu Poumeyrol','Indépendant','@kalizoy');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('mathildelemee','Mathilde Lemée','Aetys','@MathildeLemee');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('mattraible','Matt Raible','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('mattheweernisse','Matthew Eernisse','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('matthieubandon','Matthieu Bandon ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('matthieufourtina','Matthieu Fourtina','LesFurets.com','@mfourtina');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('matthieulux','Matthieu Lux','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('matthieuplantey','Matthieu PLANTEY','Wemanity','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('mattiaskarlsson','Mattias Karlsson','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('maxencelecointe','Maxence Lecointe','Chronopost International','@maxospiquante');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('maximegréau','Maxime Gréau','DGFIP - SRE','@mgreau');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('maximemader','Maxime Mader','Carbon IT','@kawabytes');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('michaëldesmet','Michael De smet','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('michaelseghers','Michael Seghers','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('mickaelbaron','Mickael Baron','','');

 
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('mikaelrobert','Mikael Robert','Octo Technology','@mikaelrob');


INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('mickaeldebonnaire','Mickael Debonnaire','Apside Top','@mdebonnaire');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('mouhcinemoulou','Mouhcine MOULOU','Soat','@mouloumouhcine');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('natpryce','Nat Pryce','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('nathanielrichand','Nathaniel Richand','AgileTribu','@nrichand');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('nealford','Neal Ford','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('nicolasbabel','Nicolas Babel','streamdata.io','@StreamdataIO');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('nicolascolomer','Nicolas Colomer','Viadeo','@n_colomer');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('nicolasdeloof','Nicolas de Loof','CloudBees','@ndeloof');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('nicolasfonrose','Nicolas Fonrose','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('nicolasfrançois','Nicolas François ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('nicolashelleringer','Nicolas Helleringer','Criteo','@nhelleringer');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('nicolasjozwiak','Nicolas Jozwiak','Xebia','@njozwiak');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('nicolasleroux','Nicolas Leroux','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('nicolasloof','Nicolas Loof','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('nicolaslorain','Nicolas Lorain','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('nicolasmartignole','Nicolas Martignole','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('nicolasmuller','Nicolas Muller','Treeptik','@zepouet');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('nicolasrigaud','Nicolas Rigaud','Aldebaran','wtfirl');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('nicolasroard','Nicolas Roard','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('nicolasromanetti','Nicolas Romanetti','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('niklastherning','Niklas Therning','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('nilsgrunwald','Nils Grunwald','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('nothumbnail.giffound','No Thumbnail.gif found','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('olegshelajev','Oleg Shelajev ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('olivierbazoud','Olivier Bazoud','','@obazoud');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('olivierbourgain','Olivier Bourgain','OBMG','@olivierbourgain');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('olivierchafik','Olivier Chafik','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('oliviercroisier','Olivier Croisier','Moka Technologies','@OlivierCroisier');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('oliviergaudin','Olivier Gaudin','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('oliviergirardot','Olivier Girardot','Lateral Thoughts','@ogirardot');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('olivierhuber','Olivier Huber','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('olivierlamy','Olivier Lamy','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('olivierphilippot','Olivier Philippot','','');

INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('olivierrobert','Olivier Robert','','');





INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('oripekelman','Ori Pekelman','Constellation Matrix','oripekelman');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('pablolopez','Pablo Lopez','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('pascalrichier','Pascal Richier ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('pascalvancauwenberghe','Pascal Van cauwenberghe','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('patriceséqué','Patrice Séqué ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('patrickchanezon','Patrick Chanezon','Microsoft','@chanezon');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('patrickcurran','Patrick Curran','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('pauldijou','Paul Dijou','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('paulpanserrieu','Paul Panserrieu','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('paulsandoz','Paul Sandoz','Oracle','@PaulSandoz');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('paulineiogna','Pauline Iogna','@pauline_io','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('petracross','Petra Cross','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('pfliegerarnaud','Pflieger Arnaud','LesFurets.com','@ArnaudPflieger');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('philippeantoine','Philippe Antoine','Xebia','@PhilippeAntoine');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('philippecharrière','Philippe Charrière','TypeUnsafe & SQLI','@k33g_org');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('philippecomte','Philippe Comte','IBM','@philippecomte');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('philippemartin','Philippe Martin','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('philippeprados','Philippe Prados','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('philippethomas','Philippe Thomas','IBM','@phthom77');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('philippevasconcelos','Philippe vasconcelos','carboatmedia','@bandbike_team');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('pierrebaillet','Pierre Baillet','','@octplane');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('pierrechaussalet','Pierre Chaussalet','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('pierredal-pra','Pierre Dal-pra','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('pierregayvallet','Pierre Gayvallet','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('pierrelaporte','Pierre Laporte','Datastax','@pingtimeout');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('pierreleresteux','Pierre LERESTEUX','Masternaut','@pierreleresteux');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('pierremistrot','Pierre Mistrot ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('pierrepadrixe','Pierre Padrixe','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('pierrepezziardi','Pierre Pezziardi','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('pierresutra','Pierre Sutra','University of Neuchâtel','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('pierre-antoinegrégoire','Pierre-Antoine Grégoire','Agile Partner S.A.','@zepag');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('pierre-yvesricau','Pierre-Yves Ricau ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('quentinadam','Quentin Adam','Clever Cloud','@waxzce');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('quentinsallat','Quentin Sallat','iD.apps','@Aerilys');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('quentinsuire','Quentin Suire','Viadeo','@kuhess');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('rafaelwinterhalter','Rafael Winterhalter','Bouvet ASA','@rafaelcodes');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('ramsguillaume','Rams Guillaume','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('raphaëlbrugier','Raphaël Brugier','LesFurets.com','rbrugier');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('raytsang','Ray Tsang','Google','@saturnism');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('rémiforax','Remi Forax','Unuiversité Paris Est Marne-la-Vallée','over_my_dead_body');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('renaudbruyeron','Renaud Bruyeron','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('robertpickering','Robert Pickering','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('robertocortez','Roberto Cortez','Self Employed','@radcortez');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('rodolphegelin','Rodolphe Gelin','Aldebaran','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('romainguy','Romain Guy','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('romainlinsolas','Romain Linsolas','Société Générale','@romaintaz');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('romainmanni-bucau','Romain Manni-Bucau','Tomitribe','@rmannibucau');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('romainmaton','Romain Maton','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('romainmenetrier','Romain Menetrier','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('romainniccoli','Romain Niccoli ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('romainpelisse','Romain Pelisse','Red Hat','@rpelisse');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('romainsertelon','Romain Sertelon','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('ruicarvalho','Rui Carvalho','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('sachalabourey','Sacha Labourey','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('sadekdrobi','Sadek Drobi','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('sambessalah','Sam Bessalah','LatticeIQ','@samklr');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('samijaber','Sami Jaber','DNG Consulting','@samijaber');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('samuelleberrigaud','Samuel Le berrigaud','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('sandromancuso','Sandro Mancuso ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('sébastianlemerdy','Sébastian Le Merdy ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('sebastienblanc','Sebastien Blanc','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('sébastienbratières','Sebastien Bratieres','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('sébastiencogneau','Sebastien Cogneau','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('sébastiendeleuze','Sébastien Deleuze','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('sébastienlesaint','Sébastien Lesaint','SonarSource','@LesaintSeb');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('sergeabiteboul','Serge Abiteboul ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('shaybanon','Shay Banon','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('sidimohammedramdani','Sidi Mohammed RAMDANI ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('simonbaslé','Simon Baslé','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('simonchignard','Simon Chignard ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('simonmaple','Simon Maple','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('simonritter','Simon Ritter','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('sofianeammar','Sofiane AMMAR ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('stephantual','Stephan Tual','Ethereum','@stephantual');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('stéphanebortzmeyer','Stéphane Bortzmeyer','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('stéphaneepardaud','Stéphane Épardaud','Red Hat','@UnFroMage');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('stephanegodbillon','Stephane Godbillon','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('stephaneguerin','Stephane Guerin','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('stéphanelandelle','Stephane Landelle','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('stephanemaldini','Stephane Maldini','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('stéphanemanciot','Stéphane Manciot','ebiznext','@smanciot');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('stephanenicolas','Stephane Nicolas','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('stéphanenicoll','Stéphane Nicoll','Pivotal','@snicoll');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('stéphanepriolet','Stéphane Priolet','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('stéphaniemoallic','Stéphanie MOALLIC','','@steffy_29');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('stephenchin','Stephen Chin ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('stevefreeman','Steve Freeman','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('stevennoels','Steven Noels','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('sunsengdavidtan','Sun Seng David TAN','Serli','@sun.seng.david.tan');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('sylvainavril','Sylvain Avril','Indépendant','@sylvain_avril');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('sylvaingaland','Sylvain Galand','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('sylvainlebresne','Sylvain Lebresne','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('sylvainveyrié','Sylvain Veyrié','Transparency Rights Management','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('sylvainweber','Sylvain Weber','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('sylvainzimmer','Sylvain Zimmer','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('tashacarl','Tasha Carl','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('teddunning','Ted Dunning','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('thibaultchassagnette','Thibault CHASSAGNETTE ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('thibaultpouget','Thibault Pouget','Cirruseo','@thibaultpouget');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('thierryabaléa','Thierry Abaléa','SGCIB','@ThierryAbalea');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('thierrychatel','Thierry Chatel','MethoTIC Conseil','@ThierryChatel');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('thierrydassonville','Thierry Dassonville','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('thierryleriche','Thierry Leriche','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('thierrywasylczenko','Thierry Wasylczenko','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('thomasbailet','Thomas Bailet ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('thomasbassetto','Thomas Bassetto','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('thomascarsuzan','Thomas Carsuzan','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('thomasguerin','Thomas Guerin','Xebia','@Tom404_');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('thomasjaskula','Thomas JASKULA','COMPOSE IT','@tjaskula');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('thomaslorblanches','Thomas Lorblanches','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('thomaspierrain','Thomas Pierrain','SG CIB','@tpierrain');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('thomaspierrain','Thomas PIERRAIN','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('thomasrecloux','Thomas Recloux','LET IT ZEN','@thomasrecloux');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('tobiasantonsson','Tobias Antonsson','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('tombujok','Tom Bujok ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('trishagee','Trisha Gee','JetBrains','trisha_gee');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('tugdualgrall','Tugdual Grall','MongoDB','@tgrall');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('tugdualsarazin','Tugdual Sarazin','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('ulrichvachon','Ulrich Vachon','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('vianneylecroart','Vianney Lecroart','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('victorarslan','Victor Arslan','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('vincentferries','Vincent Ferries','','');

INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('vincentheuschling','Vincent Heuschling','','');





INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('vincentmassol','Vincent Massol','XWiki SAS','@vmassol');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('vincentspiewak','Vincent Spiewak','Xebia','@vspiewak');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('vincentvansteenbergen','Vincent Van Steenbergen','IDAaaS','@nsteenv');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('waynebeaton','Wayne Beaton','The Eclipse Foundation','@waynebeaton');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('willemvandenende','Willem van den Ende','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('williammccabe','William Mccabe','','');




INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('williammontaz','William Montaz','xebia','');

INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('willytarreau','Willy Tarreau','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('xavierbourguignon','Xavier Bourguignon ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('xavierbucchiotty','Xavier Bucchiotty','Xebia','@xbucchiotty');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('xaviercoulon','Xavier Coulon','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('xavierhanin','Xavier Hanin','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('xavierrenaudin','Xavier Renaudin','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('yannblazart','Yann Blazart','ByCode Technologies','@yblazart');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('yannickchartois','Yannick Chartois ','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('yannickgrenzinger','Yannick grenzinger','Carbon IT','@ygrenzinger');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('yohanbeschi','Yohan Beschi','','');

INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('yoannbenoit','Yoann Benoit','xebia','');




INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('yolandepoirier','Yolande Poirier','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('yoricklaupa','Yorick Laupa','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('youenchéné','Youen Chéné','Creative Data','@youen_chene');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('yveslecleach','Yves LE CLEACH','IBM','@ylecleach');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('yvesparès','Yves Pares','','');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('zheli','Zhe LI','ARCA Computing','@AuroreZheLI');
INSERT INTO speaker (id_speaker, nom_speaker, societe,twitter) VALUES ('zouheircadi','Zouheir Cadi','JVKWA','@zouheircadi');




insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Comment git a sauvé notre projet (ou presque)','','quickie',{'céciliabossard'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Ignite 1','','quickie',{'guillaumeduquesnay'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Unit testing concurrent code','','quickie',{'rafaelwinterhalter'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Faites votre Guignol : le bazar des modules Puppet','','quickie',{'sylvainveyrié'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Un nuage dans l''café: Bonnes pratiques JEE à l''heure du PaaS','','quickie',{'juliendurillon'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'15''minutes to setup and try Apache Spark using the Spark Notebook and Docker','','quickie',{'andypetrella'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'APT, trésor caché de la JVM !?','','quickie',{'raphaëlbrugier'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Avro: la souplesse du JSON, les performances du binaire','','quickie',{'alexandrevictoor'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'CSS pour les nuls','','quickie',{'hubertsablonnière'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Se préparer dès maintenant à l''arrivée d''Angular 2','','quickie',{'romainlinsolas'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Ignite 2','','quickie',{'guillaumeduquesnay'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Révision des fondamentaux : equals et hashCode c''est important','','quickie',{'briceleporini'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'BDD - Attention à la gueule de bois','','quickie',{'clémentrochas'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Apprendre en s’amusant avec son compteur électrique','','quickie',{'cédricfinance'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'La latence applicative mobile : enjeux, sources, solutions ... la révolution Netflix + Push','','quickie',{'nicolasbabel','allandenis'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Réplication de machine à états: l’arme fatale des systèmes répartis','','quickie',{'pierresutra'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Du 100% pur Guice !','','quickie',{'paulineiogna'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Uniformisez vos postes de développement avec Fig','','quickie',{'etiennepeiniau'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'5 reasons why it''s time developers pay attention to robotics','','quickie',{'nicolasrigaud'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Ignite 3','','quickie',{'guillaumeduquesnay'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Vos managers ne veulent pas entendre parler de la dette technique, tant mieux !','','quickie',{'freddymallet'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Tolérance aux pannes avec le Circuit Breaker Pattern','','quickie',{'mouhcinemoulou'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Intégrer et exploiter le format de données ouvert GTFS. Fails et succès, ce qui marche et ce qui ne marche pas !','','quickie',{'alexiskinsella'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Asynchronismes en JavaScript','','quickie',{'florentlegall'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Packaging et déploiement d’une application JavaEE avec Docker et Ansible','','quickie',{'stéphanemanciot'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'De la cryptographie dans le navigateur avec WebCrypto API','','quickie',{'jean-christophesirot'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Flux, l''architecture de Facebook','','quickie',{'florentduveau'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Ignite 4','','quickie',{'guillaumeduquesnay'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Stratégie de mise en place de revues de code','','quickie',{'davidwursteisen'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Bluetooth Low Energy : Du mobile aux objets connectés','','quickie',{'damiencavaillès'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Toute la stack technique de Viadeo sur un poste de développement avec Docker','','quickie',{'nicolascolomer','quentinsuire'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Culture Craft','','quickie',{'thomaspierrain'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Savoir faire le deuil de son code','','quickie',{'ellènedijouxsiber'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Pub/Sub avec MongoDB, WebSockets et Java','','quickie',{'tugdualgrall'});



insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Bootstrap your Productivity with Spring Boot','','quickie',{'joshlong'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Chérie, j’ai rétréci le build ! 300kloc / 30kt / 3m','','quickie',{'geoffreybérard'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'David m''a refactorer','','quickie',{'sébastianlemerdy'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Des maths et des recommandations','','quickie',{'loïcknuchel'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Erlang : et si on faisait un pas de côté','','quickie',{'gabrielkastenbaum'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Etre développeur à la sortie de l''école','','quickie',{'frédéricbouquet'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'git-deliver : le déploiement pro, pas que pour Java','','quickie',{'sylvainveyrié','arnaudbétrémieux'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Java8 + RxJava pour sortir de l''enfer des callbacks?','','quickie',{'simonbaslé'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'La puissance de mon monoïde est supérieure à 9000','','quickie',{'benoitlemoine'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Les concepts de la programmation fonctionnelle illustrés avec Java 8','','quickie',{'yannickchartois'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Mongodb aggregation pipeline','','quickie',{'paulineiogna'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Monitoring d''un compteur EDF avec Node.js','','quickie',{'laurenthuet'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Outils pour manager une équipe (de développement)','','quickie',{'youenchéné'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'PIT, pour savoir si vos tests vous protègent des mutants','','quickie',{'alexandrevictoor'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Pourquoi vous devriez essayer sérieusement les Object Calisthenics','','quickie',{'guillaumeduquesnay'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Pourquoi vous ne devriez jamais écrire AES ou SHA dans votre code ?','','quickie',{'thierryabaléa'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Promesses et Yield : les Future<?> de JavaScript','','quickie',{'florentlegall'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Raft : le consensus réparti pour les nuls','','quickie',{'arnaudbailly'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Sinon.JS, l''ami du test unitaire JavaScript','','quickie',{'florentduveau'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Virtualisation 2.0 et kernel linux','','quickie',{'jean-eudescouignoux'});



insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Comment inspecter le code généré par le compilateur JIT de la JVM ?','','quickie',{'jean-philippebempel'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'CSS: more or Less ?','','quickie',{'julienroche'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Découvrir WebMotion','','quickie',{'julienruchaud'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Gavagai, un pont entre Java et Clojure','','quickie',{'nilsgrunwald'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Java on a Rasperry Pi','','quickie',{'stephenchin'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'JavaScript pour les développeurs Java : quels sont les pièges à éviter ?','','quickie',{'florianboulay'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Le templating en JavaScript','','quickie',{'mathieuparisot'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Les bronzés font du dev','','quickie',{'ellènedijouxsiber'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Montez votre serveur OAuth 2 avec Apache Oltu (ex Amber)','','quickie',{'guillaumelours'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Simplifiez vos tests avec les assertions AssertJ ! (fork de FEST Assert)','','quickie',{'joelcostigliola'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Coder un outil en Java... en 15 minutes !','','quickie',{'romainpelisse'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Do''s and don''ts pour le choix des exigences qualités','','quickie',{'oliviergaudin'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Les lambda arrivent. En attendant, êtes-vous sûr d''avoir compris les génériques?','','quickie',{'henritremblay'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Peut on toujours être développeur après 40 ans ?','','quickie',{'benjaminmarron'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Posez vos conventions Java sur le divan de Freud.','','quickie',{'raphaëlbrugier'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Programmation fonctionnelle, Haskell vous intéresse?','','quickie',{'mathieuchataigner','yvesparès'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Quelle JVM prendre pour votre carte ARM ?','','quickie',{'laurenthuet'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'QueryDSL: du typage fort au quotidien','','quickie',{'florentbiville'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Un code JavaScript à toute épreuve avec l''aide PMD','','quickie',{'romainpelisse'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Une appli mobile pour plusieurs tailles d’écran. Que faire ?','','quickie',{'atefhaouari'});



insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'NoSQL avec SQL: et pourquoi pas ?','','quickie',{'alexandrevasseur'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Bref, comment je suis devenu commiter Apache (presque) par accident','','quickie',{'antoinesabot-durand'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Localize your apps','','quickie',{'hugolassiège'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'C’est si simple GIT !','','quickie',{'ulrichvachon'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'OVH public cloud avec jclouds','','quickie',{'davidkrolak','edouardvanbelle'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Seren, la serialisation sous steroides !','','quickie',{'oliviercroisier'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'FluentLenium, une autre facon de faire du Selenium','','quickie',{'mathildelemee'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Musée des horreurs du FBI (Fausse Bonne Idée)','','quickie',{'emmanuelfeller'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Sexy le développpement web mobile ?','','quickie',{'julienroche'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Depoussierez votre code java avec Lombok !','','quickie',{'florentramière'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Incanter, des statistiques en un coup de baguette magique','','quickie',{'claudefalguiere'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Faire du code centré sur l’humain.','','quickie',{'yannickgrenzinger'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Code Reviews - One Thing Every Programmer Should Know','','quickie',{'mattiaskarlsson'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'TestNG, parce que vos tests le valent bien','','quickie',{'romainlinsolas'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Tester la persistance Java avec Arquillian','','quickie',{'alexishassler'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Live coding: Tetris simplifié avec TDD et Javascript','','quickie',{'philippeantoine'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'DevOps illustré : la jungle de la configuration d''une application','','quickie',{'dimitribaeli','gillesdiguglielmo'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'(R)évolutionnez vos bases de données avec Liquibase !','','quickie',{'florentbiville'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'L''heure de la SSII coopérative a sonné','','quickie',{'andrewspencer'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'CRaSH un shell pour étendre la plateforme Java','','quickie',{'julienviet'});




insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'De zéro à héros avec Spring Boot','','lab',{'stéphanenicoll','brianclozel'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Understanding Latency & Application Responsiveness','','lab',{'giltene'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Mesos University','','lab',{'aurélienmaury','pablolopez','jean-baptisteclaramonte','jean-pascalthiery'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Comprendre enfin JavaScript','','lab',{'thierrychatel'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'La Google Cloud Plaform - Au delà des simples démos','','lab',{'davidgageot','ludovicchampenois'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Initiation à Spark avec Java 8 et Scala','','lab',{'hayssamsaleh','oliviergirardot'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Ceylon Walkthrough','','lab',{'gavinking','stéphaneepardaud'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Having fun with NAO Robot','','lab',{'nicolasrigaud'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Linux: arrêtez de bidouiller et créez vos packages!','','lab',{'pierre-antoinegrégoire','olivierrobert'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Hands-on w/ Google Compute Engine','','lab',{'raytsang'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Quand DevOps rencontre BigData!','','lab',{'olivierbazoud','vincentheuschling'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Java EE c''est EEasy !','','lab',{'yannblazart','romainmanni-bucau','mathieubroutin'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Les Streams sont parmi nous ! Traitement de données en Java 8','','lab',{'josépaumard'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Trois heures à l’assaut d’une application réactive','','lab',{'nicolasjozwiak','xavierbucchiotty','vincentspiewak'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Programmation Lock-Free : les techniques des pros','','lab',{'jean-philippebempel'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Coder sans peur du changement, avec la même pas mal ! architecture hexagonale','','lab',{'cyrillemartraire','thomaspierrain'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Allons plus loin avec CDI 1.2','','lab',{'antoinesabot-durand','antoninstefanutti'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'AngularJS : The Good Parts','','lab',{'cyrilbalit'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Initiation au Machine Learning avec Spark','','lab',{'mathieubreton','albanphélip','yoannbenoit'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Microservices Bootcamp','','lab',{'joshlong','sébastiendeleuze'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'gagnez du temps avec un profiler','','lab',{'briceleporini','florentramière'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Go tutorial','','lab',{'francesccampoyflores'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Compile-time annotation processing : @Nailed(it)','','lab',{'florentbiville','sébastienlesaint'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'RxJava, les mains dans le code','','lab',{'simonbaslé','laurentdoguin'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Let''s sketch together !','','lab',{'alvinberthelot'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'IBM Bluemix en pratique','','lab',{'philippethomas','philippecomte','yveslecleach'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Cloud endpoints, Polymer, material design: the Google stack, infinitely scalable, positively beautiful','','lab',{'martingörner','horaciogonzalez','mandywaite','raytsang'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'(learn ''Clojure :with #_ a #fullstack ''web-app)','','lab',{'jonathanwinandy','fredcecilia'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'3h pour créer votre application mobile de chat','','lab',{'loïcknuchel'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Une application complète en JavaScript','','lab',{'christophejollivet','lailletcédric','mickaeldebonnaire'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Refactoring fonctionnel avec Java 8','','lab',{'ivanbeauvais','nicolasjozwiak'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Atelier Fruit Shop, la vie d''un projet en 3h','','lab',{'jean-laurentdemorlhon','brunoboucard'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Batch API (JSR 352) Hands-on Lab','','lab',{'daviddelabassee','robertocortez'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Writing Java Secure Code','','lab',{'azzeddineramrami'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Workshop Logstash','','lab',{'davidpilato','colinsurprenant'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Un Spotify à la maison avec Spark & Cassandra','','lab',{'duyhaidoan','alexisseigneurin'});




insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Java SE 8 for Tablets, Pis, and Legos','','lab',{'stephenchin'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Java 8 Streams & Collectors : patterns, performances, parallélisation','','lab',{'josépaumard'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Je fais ce que je veux avec Java EE','','lab',{'alexishassler','antoinesabot-durand'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Tout ce que vous avez toujours voulu savoir sur les lambdas et plus encore','','lab',{'rémiforax'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Linux 101 (ou Linux, domptez le pingouin)','','lab',{'pierre-antoinegrégoire','frédéricweisbecker'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Université de la performance','','lab',{'henritremblay','ludovicpiot','marcbojoly','mikaelrobert'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Javascript as a first programming language : votre IC prête pour la révolution !','','lab',{'julienroche','frédéricdubois','frédéricbouquet'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Techniques de modélisation avancée avec Cassandra','','lab',{'duyhaidoan'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Prenez le contrôle d’un aéroport avec Akka!','','lab',{'xavierbucchiotty','jeanhelou'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'The Dart side of disruption','','lab',{'alexandreardhuin','guillaumegirou','mathieubreton','nicolasfrançois'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Introduction et mise en pratique de Java EE 7','','lab',{'antoinesabot-durand','daviddelabassee','alexishassler'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Baby Code Retreat','','lab',{'vincentferries','antoinevernois'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Test Driven Infrastructure: TDD pour DevOps','','lab',{'olivierbazoud','joelwurtz'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Tests de Performance Continue','','lab',{'guillaumearnaud','williammontaz'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Votre livrable avec Docker, en prod dès demain !','','lab',{'julienvey','pierrepadrixe'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'AngularJS from scratch : comprendre Angular en le re-faisant de zéro','','lab',{'matthieulux','olivierhuber'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Application Web Moderne en Java - The CodeStory Way.','','lab',{'jean-laurentdemorlhon','davidgageot'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Reactive All The Way Down','','lab',{'jamesward','nicolasleroux'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Hands on elasticsearch','','lab',{'davidpilato','adriengrand'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'{ développeur: "viens découvrir mongoDB"}','','lab',{'davidwursteisen','katiaaresti','tugdualgrall'});





insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'AngularJS, ou le futur du développement Web','','lab',{'thierrychatel'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Collections de printemps','','lab',{'josépaumard'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Frontend Live Coding : Tour d''horizon de l''outillage et des technos web d''aujourd''hui','','lab',{'frédériccamblor'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Introduction iOS6 pour les développeurs Java','','lab',{'michaelseghers'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Le fantome, le zombie et testacular, panorama des outils de tests pour application web moderne.','','lab',{'jean-laurentdemorlhon','pierregayvallet'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Le Temps c''est de l''argent. Prenez le en compte avec Distributed DDD, CQRS et EventSourcing','','lab',{'jérémiechassaing'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Memory Systems ,how to get the best out of them','','lab',{'martinthompson'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Monitoring Open Source pour Java avec JmxTrans, Graphite et Nagios','','lab',{'cyrilleleclerc','henrigomez'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'6 Minute Apps! Build Your First Modern Web App','','lab',{'jamesward','nicolasleroux'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Android, take it to the next level','','lab',{'eyallezmy','sylvaingaland','thierrydassonville'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'C’est le moment de se lancer dans s’cas la !','','lab',{'ludwineprobst','jonathanwinandy','mathieuchataigner','jeanhelou'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'De l''idée à la startup: comment concevoir un projet exceptionnel','','lab',{'nathanielrichand','yannickgrenzinger'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Gatling Crash Course','','lab',{'stéphanelandelle','pierredal-pra'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Introduction à Go','','lab',{'francesccampoyflores'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Lab : Introduction et mise en pratique de Java EE 7','','lab',{'daviddelabassee','arungupta','laurentruaud'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Les mains dans le Ceylon : venez coder avec les auteurs du langage','','lab',{'stéphaneepardaud','emmanuelbernard'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Mise en Production Continue avec Puppet','','lab',{'ericlemerdy','pierrechaussalet'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Pratiques de caching avancées','','lab',{'mathildelemee','aurélienbroszniowski'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Stratégie de testing de code legacy','','lab',{'jean-laurentdemorlhon','davidgageot'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'The Mocha Raspberry Pi Lab','','lab',{'stephenchin','simonritter'});






insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Android, A Quick Course','','lab',{'mathiasseguy'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'CDI mis en pratique avec travers Seam Social et Weld OSGI','','lab',{'antoinesabot-durand','mathieuancelin'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Code Story','','lab',{'davidgageot','jean-laurentdemorlhon','sébastianlemerdy','ericlemerdy'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'De Runnable et synchronized à parallel() et atomically()','','lab',{'josépaumard'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Developing, Deploying and Scaling in the Cloud with Play','','lab',{'jamesward','nicolasleroux','guillaumebort'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Extreme Startup','','lab',{'arnaudbailly','willemvandenende'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Guide de survie en théorie des langages','','lab',{'alexandrebertails'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Hackergarten Paris','','lab',{'bricedutheil','mathildelemee'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Hands on Cassandra','','lab',{'nicolasromanetti','sylvainlebresne','florentramière','jeremysevellec'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Introduction à Cassandra','','lab',{'nicolasromanetti'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'JavaServer Faces Antipatterns and Best Practices','','lab',{'kitomann'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Le président est...','','lab',{'didiergirard','ludovicchampenois','martingörner'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Légendes urbaines sur Scala','','lab',{'sadekdrobi','guillaumebort'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Les 3 A pour Java EE 6','','lab',{'alexishassler','yannblazart','antoinesabot-durand'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Les 5 mercenaires du DevOps','','lab',{'henrigomez','arnaudheritier','pierre-antoinegrégoire','dimitribaeli','gildascuisinier'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Programatoo: Atelier de programmation pour les enfants','','lab',{'alinepaponaud','audreyneveu'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'The Productive Programmer','','lab',{'nealford'});






insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Machine learning et régulation numérique','','conf',{'guillaumelaforge','didiergirard'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Priming Java for Speed','','conf',{'giltene'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Développeur sous influence','','conf',{'guillaumeduquesnay'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Java 9 Plan','','conf',{'briangoetz','paulsandoz'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Modern Enterprise Java Architectures with Spring 4.1','','conf',{'juergenhoeller','stéphanenicoll'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Refactoring to Functional','','conf',{'hadihariri'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'UX : le Poids des Mots...','','conf',{'grégoryweinbach'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'10 trucs que j''ai appris en lisant le code source de Chrome OS','','conf',{'françoisbeaufort'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Applications Concurrentes Polyglottes avec Vert.x','','conf',{'julienviet'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Bluemix: l''avenir du développement dans le Cloud','','conf',{'joelgauci'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Caching reboot: javax.cache & Ehcache 3','','conf',{'louisjacomet'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Ceylon Idioms','','conf',{'gavinking'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Changing the wheel of a moving car - faire évoluer l''infra sans interruption','','conf',{'nicolasdeloof'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Coding, fast & slow','','conf',{'maximemader','yannickgrenzinger'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Comment rater ses benchmarks ?','','conf',{'pierrelaporte'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Concurrency in Enterprise Java','','conf',{'alexanderheusingfeld','arungupta'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Construire des applications Big Data avec Docker et Mesos.','','conf',{'sambessalah'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Datomic, la base de données qui n''oublie rien','','conf',{'hirammadelaine'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Devops my code','','conf',{'zouheircadi'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Groovy et son process de release: nous l’avons rendu « grooooooovy » !','','conf',{'guillaumelaforge','fredsimon','cédricchampeau'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Hashons peu mais hashons bien','','conf',{'oliviercroisier','olivierbourgain'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Holo to Material Design Transition','','conf',{'quentinsallat'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'I don''t always write Reactive applications, but when I do, it runs on Raspberry Pi','','conf',{'alexandredelegue','mathieuancelin'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Java EE 7 Batch Processing in the Real World','','conf',{'robertocortez','daviddelabassee'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Java EE 8, a snapshot overview','','conf',{'daviddelabassee'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Java Mission Control for Earthlings','','conf',{'jamesweaver'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Je déploie dans mon datacenter virtuel avec OpenStack','','conf',{'sylvainavril'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Les idées reçues de l''informatique : Quand nos erreurs de raisonnement nous limitent.','','conf',{'ludoviccinquin'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Les tests exploratoires','','conf',{'mathildelemee'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Logstash: l’arme secrète pour vaincre le coté obscur de vos logs','','conf',{'colinsurprenant'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Ma grand-mère Excel en grammaire Antlr','','conf',{'florentramière'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Machine Learning avec Spark, MLLib et D3.js','','conf',{'hayssamsaleh'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Making Java more dynamic','','conf',{'rafaelwinterhalter'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Modern SQL','','conf',{'markuswinand'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'On n''est pas que des cobayes: ORM et NoSQL sont-ils solubles?','','conf',{'emmanuelbernard'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Scaling Docker with Kubernetes','','conf',{'carlossanchez'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Sécuriser votre produit, from scratch','','conf',{'geoffroycouprie'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Streaming/Kafka Avancé','','conf',{'jonathanwinandy','alexisguéganno'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Un monde où 1 ms vaut 100 M€','','conf',{'thierryabaléa','alexandrevictoor'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Venez découvrir CDI, la perle de Java EE !','','conf',{'antoniogoncalves'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Web Components, Polymer and Material Design','','conf',{'horaciogonzalez'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Why postgres SQL deserve noSQL fan respect','','conf',{'quentinadam'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Comment manager des Geeks','','conf',{'luclegardeur'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Groovy avec le style !','','conf',{'guillaumelaforge'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Level Up your Dev Skills with Static Analysis','','conf',{'davidlindsay'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'L''expérience utilisateur est importante pour nous','','conf',{'florenceherrou'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Tout ce que vous avez toujours voulu savoir sur les clients Java HTTP concurrents, asynchrones, sans oser demander!','','conf',{'fredsimon'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'API Asynchrones en Java 8','','conf',{'josépaumard'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Des tablettes d''écriture aux tablettes pour écrire','','conf',{'clarisseherrenschmidt','bettymoreau'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Créer des applications cognitives avec IBM Watson Engagement Explorer et Bluemix','','conf',{'philippecomte'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Plugin Gradle, prenez le contrôle du build !','','conf',{'eyallezmy','cédricchampeau'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'DevOps with Java EE','','conf',{'arungupta'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Infinite Infinispan','','conf',{'raytsang'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Stockage et analyse temps réel d''événements avec Riak chez Booking.com','','conf',{'damienkrotkine'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'De l''API au protocole','','conf',{'geoffroycouprie'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'OptaPlanner ou comment optimiser les itinéraires, les plannings et bien plus encore...','','conf',{'geoffreydesmet','frederichornain'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'L''ecosysteme Docker sur Azure','','conf',{'patrickchanezon'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Java 8 in Anger','','conf',{'trishagee'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Les monoïdes démystifiés, en Java et avec des verres de bière','','conf',{'cyrillemartraire'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Eclipse is much more than just an IDE!','','conf',{'benjamincabé','waynebeaton'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Comprendre l''IOT grâce à une boule ... mais pas que','','conf',{'laurenthuet','philippecharrière'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Building fault tolerant microservices','','conf',{'christopherbatey'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Conference wm Web, Mobile & UX API hypermedia','','conf',{'davidmartin'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Un News Feed temps réel personnalisé pour 65 millions d’utilisateurs','','conf',{'gregtruchetet','fabricerobini','quentinsuire'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'IoT, Java, and Autonomous Drones','','conf',{'jamesweaver'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Project Jigsaw','','conf',{'paulsandoz'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Conference lang Alternate Languages Présentation de Rust, le langage le plus excitant depuis l''arrivée de Scala','','conf',{'mathieupoumeyrol','pierrebaillet'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Write in AsciiDoc, Publish Everywhere!','','conf',{'danallen','maximegréau'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Conference wm Web, Mobile & UX Développement web : ce qui vous attend en 2015','','conf',{'romainlinsolas'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Livrer chaque jour ce qui est prêt ! Points clés du développement d''un produit avec une livraison par jour.','','conf',{'dimitribaeli','benjamindegerbaix'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'UBFC - Ultimate Bug Fighting Championship','','conf',{'aurélieballet','gaëllebourven'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Les développeurs aussi maîtrisent le systemd','','conf',{'jean-eudescouignoux'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Conference wm Web, Mobile & UX http/2: A deux c''est mieux!','','conf',{'jean-françoisarcand'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Finally, Security API JSR 375','','conf',{'alexkosowski'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'JDBC / JPA / Hibernate: Sans maîtrise la puissance n''est rien','','conf',{'briceleporini'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Conference wm Web, Mobile & UX Le retour en force de GWT','','conf',{'samijaber'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Conference wm Web, Mobile & UX La révolution hors-ligne du Web arrive avec les Service Workers','','conf',{'hubertsablonnière'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Des objets connectés c''est bien, utiles c''est mieux !','','conf',{'matthieuplantey','ludovichavel','gwennaelgate'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Recettes CQRS, pour bien cuisiner son architecture','','conf',{'thomasjaskula'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'No one at Google uses MapReduce anymore - Cloud Dataflow explained for dummies','','conf',{'martingörner'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Algorithmes distribués pour le Big Data','','conf',{'duyhaidoan'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Conference wm Web, Mobile & UX Les nouveaux outils du développeur web','','conf',{'philippeantoine'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Conference wm Web, Mobile & UX JHipster, le générateur d''applications Spring Boot + AngularJS','','conf',{'juliendubois'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Anatomie de l''infrastructure de prédiction @Criteo: machine learning, log management, Hadoop.','','conf',{'jean-baptistenote','laurentvion'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Conference wm Web, Mobile & UX Migration d''une webapp Tomcat vers Vert.x','','conf',{'florianboulay'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Proxy 2.0','','conf',{'rémiforax'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Le Continuous Merge chez LesFurets.com','','conf',{'pfliegerarnaud'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Les Cast Codeurs Podcast : table ronde','','conf',{'emmanuelbernard','vincentmassol','antoniogoncalves','arnaudheritier','guillaumelaforge'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2015,'Barbus et Barbares','','conf',{'françoisledroff','romainpelisse'});






insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Au secours, mon code AngularJS est pourri !','','conf',{'thierrychatel'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'33 things you want to do better','','conf',{'tombujok'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'42 IntelliJ IDEA tips and tricks in 45 minutes','','conf',{'hadihariri'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'50 nouvelles choses que l''on peut faire avec Java 8','','conf',{'josépaumard'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Android app bashing : apprendre des erreurs des grands','','conf',{'eyallezmy'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Attaquez le Mahout de face pour exploiter vos Téraoctets d’historique !','','conf',{'sidimohammedramdani'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Basses latences, hauts débits : les secrets de la finance pour avoir des systèmes réactifs','','conf',{'cyrilledupuydauby','thomaspierrain'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Bitcoin et monnaies cryptographiques','','conf',{'grégorypaul'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Building a Real-Time Risk Analysis System in Java','','conf',{'alexandrenavarro','benoîtlacelle'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Building Reactive Apps','','conf',{'jamesward'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Cassandra, une nouvelle ère','','conf',{'jonathanellis'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Ceylon d‘ici à l‘infini : tour d‘horizon et le futur','','conf',{'stéphaneepardaud'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Chrome Apps for Desktop and Mobile','','conf',{'joemarini'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Construire une application réelle de jeux en ligne avec NoSQL','','conf',{'ferdatartanoglu'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Crazyflie: Developement d''un quadrirotor miniature opensource','','conf',{'arnaudtaffanel','marcuseliasson','tobiasantonsson'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Des applications réactives avec Spring 4, AngularDart et Websocket','','conf',{'sébastiendeleuze'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Des SSII aux SS3I ? Sociétés au service des individus de l’ingénierie informatique','','conf',{'audeamarrurtu','bettymoreau'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Deux années de Continuous Delivery au pays des traders','','conf',{'alexandrevictoor','patriceséqué'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Développer en mode Kick-Ass','','conf',{'samuelleberrigaud'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Développer ou debugger ?','','conf',{'gillesportier','ericmaillard'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Développer son conteneur d’application Java léger avec la SPI Weld 2.x et les extensions CDI 1.1','','conf',{'antoninstefanutti'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Do you really get classloaders?','','conf',{'olegshelajev'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Embracing HTTP in the era of API’s','','conf',{'hadihariri'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Extremist Programming : l''art de s''amuser avec du code','','conf',{'ericlefevre-ardant','cyrillemartraire'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Fault Tolerance In Erlang','','conf',{'garrettsmith'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Fifty New Features of Java EE 7','','conf',{'arungupta'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Go pour Javaneros','','conf',{'francesccampoyflores'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Google App Engine... Ca bouge, ca bouge beaucoup....','','conf',{'ludovicchampenois'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Google Cast Development - Lessons Learned','','conf',{'hoilam'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Gradle ne fait pas que remplacer Maven','','conf',{'cédricchampeau'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Groovy en 2014 et au-delà','','conf',{'guillaumelaforge'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Hacking your home','','conf',{'laurenthuet'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Hadoop @ Criteo, du laboratoire à la production 24h/24','','conf',{'jean-baptistenote','loïclebel'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'How to not just survive but thrive with flexible scope','','conf',{'gojkoadzic'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Identification d''une empreinte vocale pour les Nuls','','conf',{'amaurycrickx'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Il n''y a pas que les war dans la vie... Les bundles OSGI ça marche aussi.','','conf',{'jean-baptistedefard','alexandrelacroux'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Introduction aux Google Glass','','conf',{'alainregnier'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Java 8 Lambdas in the Stream','','conf',{'paulsandoz'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'JavaScript, the next big ... bytecode','','conf',{'mathieubreton'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'La culture du programmeur','','conf',{'jean-laurentdemorlhon'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'La révolution Docker','','conf',{'nicolasdeloof','ludovicchampenois'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Lambda Architecture - Choose your tools for Real-Time Big Data','','conf',{'floriandouetteau'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Le bon testeur il teste.... et le mauvais testeur il teste aussi...','','conf',{'agnèscrepet','guillaumeehret'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Les Applications Réactives : un nouveau paradigme pour relever les défis de l''économie numérique.','','conf',{'fabricecroiseaux','antoinedetante'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Les Cast Codeurs reviennent et ils ne sont pas content !','','conf',{'emmanuelbernard','vincentmassol','arnaudheritier','antoniogoncalves','guillaumelaforge'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'MeteorJS : extinction imminente des dinosaures du web','','conf',{'vianneylecroart','pascalrichier'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Pas à PaaS : CloudFoundry in action','','conf',{'thibaultchassagnette','ghislainseguy'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Personal Kanban - Retrouvez votre efficacité !','','conf',{'guillaumelours'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Pourquoi utiliser un portail en 2014','','conf',{'emmanuelpavaux'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Programmation système robuste avec Rust','','conf',{'clémentdelafargue','geoffroycouprie'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Reactive Angular','','conf',{'martingontovnikas'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Realtime Web avec Akka, Kafka, Spark et Mesos','','conf',{'hayssamsaleh','jean-philippebunaz'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Rétrospective: les projets cloud computing','','conf',{'aurélienpelletier'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'SARAH: connecter et interagir avec l''Internet des Objets au quotidien','','conf',{'jean-philippeencausse'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Se plugger dans le compilateur Java','','conf',{'éamonnmcmanus'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'So Easy a Child Could Do It: Designing Mobile Apps for Children','','conf',{'kathrynrotondo'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Software Craftsmanship','','conf',{'sandromancuso'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Soyons RESTful avec RESTX','','conf',{'xavierhanin'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Square: de la collecte d’information à la prise de décision','','conf',{'pierre-yvesricau'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Tester simplement et efficacement une application mobile avec Rational Test Workbench','','conf',{'dominiqueguilbaud'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'The Art of Parsing','','conf',{'evgenymandrikov','dineshbolkensteyn'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Truly Native Java Apps on iOS with RoboVM','','conf',{'niklastherning'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Utiliser TLS sans se tromper','','conf',{'stéphanebortzmeyer'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Vive les WebSockets Libres!','','conf',{'jean-françoisarcand'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Votez pour nous ! L''internet des objets par l''exemple.','','conf',{'pablolopez'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Web performances, regardons les résultats de près','','conf',{'jeffmaury','nicolasleroux','philippecharrière','rémiforax'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Chez les barbus: master chef et puppet show','','conf',{'françoisledroff','romainpelisse'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Spring4TW!','','conf',{'joshlong'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Etendre le Web avec les Web Components','','conf',{'christophejolif'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2014,'Mise en production continue - 1 an après','','conf',{'pierrechaussalet','ericlemerdy'});







insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'7 idées pour transformer une bonne équipe en équipe exceptionnelle.','','conf',{'samuelleberrigaud'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Architecting for Continuous Delivery','','conf',{'axelfontaine'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'BigData@DevoxxFr, Saison 2','','conf',{'pablolopez','hugogeissmann'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Boucles étranges : étranges boucles (puzzlers et curiosités)','','conf',{'ericlefevre-ardant','guillaumetardif'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Comparing JVM Web Frameworks','','conf',{'mattraible'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Coprocesseur de calcul: Intel Xeon Phi','','conf',{'victorarslan'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'De compiletout.bat à l''Usine Logicielle pour Java','','conf',{'ramsguillaume'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Developers: Prima Donna''s of the 21st Century','','conf',{'hadihariri'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Développement d''applications JavaFX 2','','conf',{'thierrywasylczenko','jimweaver'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Elastifiez votre application : du SQL au NoSQL en moins d''une heure','','conf',{'davidpilato','tugdualgrall'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Faciliter le développement d’applications Web hors-ligne en JAVA avec GWT','','conf',{'arnaudtournier'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'FLATMAP ZAT SHIT : les monades expliquées aux geeks','','conf',{'françoissarradin'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Gérer une infrastructure hétéroclites facilement grâce à Puppet et MCollective','','conf',{'romainpelisse'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Hands On with Clojure','','conf',{'bodilstokke'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Implémenter la qualité sur un projet Java','','conf',{'vincentmassol'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Java EE 7 en détail','','conf',{'arungupta','daviddelabassee'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'JCP & Adopt-a-JSR Workshop','','conf',{'patrickcurran','patrickcurran','arungupta'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'L''art de Bricoler','','conf',{'sylvainweber'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Le Space-Mountain du développement Java d''entreprise','','conf',{'florentramière'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Les tests: pourquoi et comment ?','','conf',{'axelhaustant','xavierrenaudin','grégorypaul'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Mastering Android Drawables','','conf',{'cyrilmottier'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Modèles de concurrence en Go','','conf',{'francesccampoyflores'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'No(Geo)SQL','','conf',{'nicolashelleringer'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Play Framework vs. Grails Smackdown','','conf',{'jamesward','mattraible'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Raising Your Visibility Seed Round','','conf',{'graylouis'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'RealityIS_AGraph','','conf',{'florentbiville'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Structures de données exotiques, au delà de ArrayList, HashMap et autres HashSet.','','conf',{'sambessalah'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'The Adventurous Developer''s guide to JVM Languages','','conf',{'simonmaple'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'The Wearable Application Server and Other Adventures in Software Engineering','','conf',{'hollycummins'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'What Every Hipster Should Know About Functional Programming','','conf',{'bodilstokke'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Secret Diaries of the Performance Tuning Superhero','','conf',{'alexandremechain'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Le classpath n''est pas mort, mais presque','','conf',{'alexishassler'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Quick Start avec le Cloud Google','','conf',{'alexismoussine-pouchkine','didiergirard'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Winter is coming','','conf',{'aurélienpelletier','didiergirard'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Comment paraître sexy auprès des développeurs ?','','conf',{'camilleroux'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Groovy et les DSLs statiquement typés','','conf',{'cédricchampeau','guillaumelaforge'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Invokedynamic in 45 Minutes','','conf',{'charlesnutter'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Apache TomEE, Java EE 6 Web Profile on Tomcat','','conf',{'davidblevins'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Java EE 7 ,EJB 3.2, what made it ,what got the axe','','conf',{'davidblevins'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Bean Validation 1.1: on n''est plus au pays des Beansounours','','conf',{'emmanuelbernard'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Les Cast Codeurs Podcast... putain 4 ans deja!','','conf',{'emmanuelbernard','vincentmassol','arnaudheritier','guillaumelaforge','antoniogoncalves'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'NIO, pas si simple ?','','conf',{'emmanuellecharny'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Cloud Best Practices','','conf',{'ericbottard'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Git : qu,une application complexe saute le pas','','conf',{'francoisnollen'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Live Coding session: Une application WOA en 50 minutes','','conf',{'guillaumebort','sadekdrobi'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'The Lightning Memory-Mapped Database','','conf',{'howardchu'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Creating Games with WebGL ,Three.js','','conf',{'jameswilliams'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'CAS, un SSO web open source','','conf',{'jérômeleleu'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Entre HPC et big data: un case study sur la simulation du risque de contrepartie','','conf',{'jonathanlellouche','adrientaypamart'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'The Spring Update: Looking at Spring 3.1, 3.2, ,4.0','','conf',{'joshlong'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'De Devoxx au CAC40','','conf',{'juliendubois'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Du Javascript propre ? Challenge Accepted','','conf',{'julienjakubowski','romainlinsolas'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Domotique Low Cost, façon DIY','','conf',{'laurenthuet'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Les secrets des Géants du Web - 10 pratiques pour mieux travailler','','conf',{'ludoviccinquin'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Sécurité pour les entreprises dans un monde nuageux et mobile.','','conf',{'ludovicpoitou'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Animez vos pages HTML5: un tour d''horizon complet des techniques d''animation en HTML5','','conf',{'martingörner'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Challenging the myths & folklore in developing high-performance systems','','conf',{'martinthompson'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Le brevet logiciel en Europe? Kit de survie.','','conf',{'michaëldesmet'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Continuous (Cloud) Cost Testing','','conf',{'nicolasfonrose'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'WTF - What''s The Fold ?','','conf',{'oliviercroisier'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'5 ans et 500 releases en 50 minutes !','','conf',{'oliviergaudin','freddymallet'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Real Options: qu,et comment (ne pas) prendre des decisions','','conf',{'pascalvancauwenberghe'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Android Bad Practices : comment foirer son app','','conf',{'pierre-yvesricau'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'The bright dynamic future of Java','','conf',{'rémiforax'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Technologies vocales pour développement web','','conf',{'sébastienbratières'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'99 recettes de Ceylon','','conf',{'stéphaneepardaud','emmanuelbernard'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Building on SOLID Foundations','','conf',{'stevefreeman','natpryce'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'Real-time Hadoop: Do it right now with Hadoop ,Storm','','conf',{'teddunning'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2013,'IDE Java : astuces de productivité pour le quotidien','','conf',{'xavierhanin'});







insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'.Net pour le développeur Java : une source d''inspiration ?','','conf',{'cyrillemartraire','ruicarvalho'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'55 fonctionnalités de Java 7 dont vous n''avez (probablement) pas encore entendu parler','','conf',{'daviddelabassee'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'A la découverte de JavaFX','','conf',{'nicolaslorain','jean-francoisdenise','ericleponner'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'An Overview of Guava: Google Core Libraries for Java','','conf',{'kurtkluever','kevinbourrillion'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Android, Graphisme et Performance','','conf',{'romainguy'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Bâtir des applications web mobiles dans le Cloud avec Grails','','conf',{'sebastienblanc','stephanemaldini'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Behind the Scenes of Day-To-Day Software Development at Google','','conf',{'petracross'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'BigData et Hadoop au secours de téraoctets de logs inexploitables chez l''un des plus grands sites marchands du web européen','','conf',{'pablolopez'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Building Mobile HTML5 Apps in Hours Not Days','','conf',{'adityabansod'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Client/Server Apps with HTML5 and Java','','conf',{'jamesward'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Cloud et PaaS: les développeurs reprennent le pouvoir','','conf',{'sachalabourey'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Comment tester son idée et concevoir un prototype web en un minimum de temps ?','','conf',{'camilleroux'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'CQRS (Comm,,Queries Responsibility Segregation)','','conf',{'jérémiechassaing'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Deadlock Victim','','conf',{'heinzkabutz','oliviercroisier'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'DevOps : pas que pour gérer des serveurs','','conf',{'jérômebernard'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'ElasticSearch : moteur de recherche NoSQL/REST/JSON taillé pour le cloud','','conf',{'davidpilato'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Faire (bien) tourner Java en environnement virtuel et cloud.','','conf',{'alexandrevasseur'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Google App Engine: la complexité inversement proportionnelle a la scalabilité','','conf',{'ludovicchampenois','didiergirard'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Google Web Toolkit à l''épreuve du feu','','conf',{'samijaber'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Groovy 2.0 : quoi de neuf doc ?','','conf',{'guillaumelaforge','cédricchampeau'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Hacking the Kinect','','conf',{'danhardiker'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Il n''y a pas de bon Modèle Métier','','conf',{'grégoryweinbach'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'import continuous.delivery.*','','conf',{'jevgenikabanov'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Improving Resource Utilisation - the JVM, the OS ,the Hardware','','conf',{'benevans','martijnverburg'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Input/Output : 16 ans après','','conf',{'jean-micheldoudoux'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Introduction à Ceylon','','conf',{'stéphaneepardaud','emmanuelbernard'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Invokedynamic them all','','conf',{'rémiforax'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Java à Murex: un retour d''expérience','','conf',{'craigmorrison','jean-pierredacher'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Java Caching with Guava','','conf',{'charlesfry'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Java sur Amazon Web Services','','conf',{'carlosconde'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Kanban pour les nuls !','','conf',{'guillaumelours','dimitribaeli'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Le Web mobile avec Dojo','','conf',{'christophejolif'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Les Cast Codeurs Podcast','','conf',{'emmanuelbernard','vincentmassol','arnaudheritier','guillaumelaforge','antoniogoncalves'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Lily va faire les courses - Lily goes shopping','','conf',{'stevennoels','guedesbruno'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Linked Data - Big Data at Web scale','','conf',{'alexandrebertails'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Manipulation de bytecode : démocratisons la magie noire','','conf',{'julienponge','fredericlemouel'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'MongoDB et Mustache. Vers la mort du cache ?','','conf',{'mathieupoumeyrol','pierrebaillet'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'NodeJS and JavaScript Everywhere','','conf',{'mattheweernisse'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Nouveau look pour une nouvelle vie: Spring, JQuery et HTML5','','conf',{'juliendubois'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Obésiciel et impact environnemental : Green Patterns appliqués à Java','','conf',{'olivierphilippot'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'OOM m''a tuer : paramétrage de la Heap et du Garbage Collector sous forte charge','','conf',{'renaudbruyeron','frankpavageau'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Optimiser vos applications HTML pour Android','','conf',{'nicolasroard'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Optimiser votre site Web sur mobile','','conf',{'romainmaton'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Pimp My Legacy','','conf',{'françoisostyn'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Play 2.0, un framework pour une nouvelle génération d''application Web','','conf',{'guillaumebort','sadekdrobi'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Pour un développement durable','','conf',{'frédéricdubois'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Pour une fois soyons physique! Une introduction a Arduino.','','conf',{'daviddelabassee'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Programmation concurrente en Java dans la pratique','','conf',{'alexsnaps'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Recherche d’information (RI) : Fondements et illustration avec Apache Lucene','','conf',{'majirusfansi'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'sizeOf en Java — parce que la taille… ça compte!','','conf',{'alexsnaps'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Spring est mort, longue vie à Spring !','','conf',{'gildascuisinier'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'The Jazz platform: An overview of our collaborative software development tools','','conf',{'benoitbossuet','alexisgaches'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'The Kotlin Programming Language','','conf',{'dmitryjemerov'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Visualiser un document Office dans une appli Android','','conf',{'jean-louisrousselin','alainboudard'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Voxxr: Ze Highly Interactive Talk','','conf',{'xavierhanin'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Web Oriented Architecture, une transmutation des pratiques de construction des SI','','conf',{'habibguergachi'});






insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Réduire la pression sur l''allocation mémoire : le prochain pas dans l''optimisation des performances de la JVM','','TIA',{'benoitperroud','olivierlamy'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Tester une application Web avec Selenium 2, Selenium Grid et TestNG','','TIA',{'mathildelemee'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'GPGPU facile avec JavaCL, et trivial avec ScalaCL !','','TIA',{'olivierchafik'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Pratiquer DDD en un éclair','','TIA',{'ulrichvachon'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Chouchoutez votre code JavaScript','','TIA',{'romainlinsolas'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Apache Buildr','','TIA',{'alexismidon'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Continuous deployement : Rackspace, Chef et capistrano en action','','TIA',{'bertrandpaquet'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Simplifiez vos développements Android avec AndroidAnnotations !','','TIA',{'pierre-yvesricau','alexandrethomas'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Réaliser des tests de charges avec Gatling','','TIA',{'stéphanelandelle','romainsertelon'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'JDK 8 demo: lambdas in Action','','TIA',{'guillaumetardif'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'De l''audit de Code à l''Inspection Continue','','TIA',{'oliviergaudin'});
insert into talk(annee, titre, categorie, type_talk, speakers) VALUES (2012,'Dessine moi un language: à la découverte de Xtext','','TIA',{'jeffmaury'});