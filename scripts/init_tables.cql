CREATE KEYSPACE devoxx
WITH replication = {
	'class' : 'SimpleStrategy',
	'replication_factor' : 1
};

use devoxx;

CREATE TABLE speakers (
   speaker text PRIMARY KEY,
   name text,
   company text,
   twitter text
);

CREATE TABLE devoxx.talk (
      annee int,
      titre text,
      description text,
      type_talk text,
      speakers set<text>,      
      PRIMARY KEY (annee, titre)
);

CREATE TABLE devoxx.type_talk_par_annee(
     type_talk text,
     annee int,
     nb int,
     PRIMARY KEY(type_talk, annee)
) WITH CLUSTERING ORDER BY (annee ASC);


CREATE TABLE devoxx.speaker_par_annee(
     speaker text,
     annee int,
     nb int,
     PRIMARY KEY(speaker, annee)
) WITH CLUSTERING ORDER BY (annee ASC);

CREATE TABLE devoxx.keyword_par_annee(
     keyword text,
     annee int,
     nb int,
     PRIMARY KEY(keyword, annee)
) WITH CLUSTERING ORDER BY (annee ASC);

CREATE TABLE devoxx.societe_par_annee(
     societe text,
     annee int,
     nb int,
     PRIMARY KEY(societe, annee)
) WITH CLUSTERING ORDER BY (annee ASC);


INSERT INTO speakers (speaker, name,company,twitter) VALUES ('adrien_blind','Adrien Blind','Société Générale','@adrienblind');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('alain_regnier','Alain Regnier','Alto Labs','@altolabs');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('alex_kosowski','Alex Kosowski','Oracle','');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('alexander_dejanovski','Alexander DEJANOVSKI','Chronopost International','@alexanderDeja');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('alexandre_delegue','Alexandre Delegue','serli','@chanksleroux');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('alexandre_victoor','Alexandre Victoor','Société Générale','@Alex_Victoor');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('alexis_gueganno','Alexis Guéganno','Valwin','@agueganno');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('alexis_hassler','Alexis Hassler','sewatech','@AlexisHassler');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('alexis_kinsella','Alexis Kinsella','Xebia','@alexiskinsella');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('alexis_moussine-pouchkine','Alexis Moussine-Pouchkine','Google','@alexismp');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('alexis_seigneurin','Alexis Seigneurin','Ippon Technologies','@aseigneurin');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('alvin_berthelot','Alvin Berthelot','','@alvinberthelot');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('amira_lakhal','Amira LAKHAL','Valtech','@miralak');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('andy_petrella','Andy Petrella','NextLab','@noootsab');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('antoine_richard','Antoine Richard','SQLI','@richard_antoine');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('antoine_sabot-durand','Antoine Sabot-Durand','Red Hat','@antoine_sd');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('antonin_stefanutti','Antonin Stefanutti','Murex','@astefanut');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('antonio_goncalves','Antonio Goncalves','AGoncal Consulting','@agoncal');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('arnaud_heritier','Arnaud Héritier','eXo platform','@aheritier');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('arun_gupta','Arun Gupta','Red Hat','@arungupta');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('aude_amarrurtu','Aude Amarrurtu','Arolla','@AudeAmarrurtu');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('aurelie_ballet','Aurélie Ballet','Ullink','');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('aurelien_maury','Aurélien Maury','WeScale','@aurelienmaury');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('azzeddine_ramrami','Azzeddine Ramrami','Groupe Pierre &amp; Vacances CenterParcs','');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('benjamin_cabe','Benjamin Cabé','Eclipse Foundation','@kartben');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('benjamin_degerbaix','Benjamin Degerbaix','LesFurets.com','');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('benoit_lemoine','Benoit Lemoine','Xebia','@benoit_lemoine');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('bertrand_gressier','Bertrand Gressier','ADEO','bgressier');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('betty_moreau','Betty MOREAU','ADR&amp;Com','@AdretCom');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('brian_clozel','Brian Clozel','Pivotal inc.','@brianclozel');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('brian_goetz','Brian Goetz','Oracle','@briangoetz');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('brice_dutheil','Brice Dutheil','Arkey','@BriceDutheil');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('brice_leporini','Brice Leporini','Indépendant','@blep');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('carlos_sanchez','Carlos Sanchez','','@csanchez');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('christophe_jolif','Christophe Jolif','IBM','@cjolif');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('christophe_jollivet','Christophe Jollivet','Apside TOP','@jollivetc');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('christopher_batey','Christopher Batey','DataStax','@chbatey');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('clement_rochas','Clément Rochas','Xebia','@crochas');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('colin_surprenant','Colin Surprenant','elasticsearch','@colinsurprenant');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('cyril_balit','Cyril Balit','Sfeir','@cbalit');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('cyril_lakech','Cyril Lakech','ADEO','@cyril_lakech');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('cyrille_martraire','Cyrille Martraire','Arolla','@cyriux');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('cecilia_bossard','Cécilia Bossard','Timwi Consulting','@ceciliaBossard');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('cedric_finance','Cédric Finance','Soat','@CedricFinance');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('damien_cavailles','Damien Cavaillès','Tripndrive','@thedamfr');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('damien_krotkine','Damien Krotkine','Booking.com','@damsieboy');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('dan_allen','Dan Allen','OpenDevise','@mojavelinux');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('david_delabassee','David Delabassee','Oracle','@delabassee');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('david_gageot','David Gageot','Retour1024','@dgageot');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('david_lindsay','David Lindsay','Coverity','@thornmaker');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('david_martin','David MARTIN','Ippon Technologies','@_dmartin_');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('david_pilato','David Pilato','elasticsearch','@dadoonet');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('david_wursteisen','David Wursteisen','Soat','@dwursteisen');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('duyhai_doan','DuyHai DOAN','Datastax','@doanduyhai');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('ellene_dijoux_siber','Ellène Dijoux Siber','AgileDev','@ElleneSiber');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('emmanuel_bernard','Emmanuel Bernard','Red Hat','emmanuelbernard');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('emmanuel_hugonnet','Emmanuel Hugonnet','Red Hat','@ehsavoie');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('etienne_peiniau','Etienne Peiniau','Ekino','@lepnio');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('eyal_lezmy','Eyal LEZMY','Genymobile','Eyal_Lezmy');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('fabrice_robini','Fabrice Robini','Viadeo','@frobini');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('florence_herrou','Florence Herrou','Ippon Technologies','');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('florent_benoit','Florent BENOIT','Codenvy','@florentbenoit');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('florent_biville','Florent Biville','Vidal / Freelance','@fbiville');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('florent_duveau','Florent DUVEAU','Xebia','@florentduveau');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('florent_le_gall','Florent Le Gall','Xebia','@flornt');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('florent_ramiere','Florent Ramière','Jaxio','@framiere');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('florian_boulay','Florian Boulay','Next Performance','@FlorianBoulay');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('francesc_campoy_flores','Francesc Campoy Flores','Google','@francesc');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('fred_cecilia','Fred CECILIA','Sépage','@naikyworld');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('fred_simon','Fred Simon','JFrog','@freddy33');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('freddy_mallet','Freddy Mallet','SonarSource','@FreddyMallet');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('frederic_hornain','Frederic Hornain','Red Hat','@fhornain');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('gavin_king','Gavin King','Red Hat','');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('gael_metais','Gaël Métais','Freelance','@gaelmetais');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('geoffrey_de_smet','Geoffrey De Smet','Red hat','@GeoffreyDeSmet');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('geoffroy_couprie','Geoffroy Couprie','Geoffroy Couprie','@gcouprie');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('gil_tene','Gil Tene','Azul Systems','@giltene');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('greg_truchetet','Greg Truchetet','Viadeo','@Myxz');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('gregory_weinbach','Grégory Weinbach','EZOKY','@gweinbach');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('guillaume_duquesnay','Guillaume Duquesnay','I&#x27;m my own company','@duquesnay');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('guillaume_laforge','Guillaume Laforge','Pivotal','@glaforge');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('guillaume_scheibel','Guillaume Scheibel','Expedia','@g_scheibel');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('hadi_hariri','Hadi Hariri','JetBrains','@hhariri');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('hayssam_saleh','Hayssam Saleh','ebiznext','@hayssams');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('hiram_madelaine','Hiram MADELAINE','Eloquent Logic','@HiramMadelaine');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('horacio_gonzalez','Horacio Gonzalez','Cityzen Data','@LostInBrittany');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('hubert_sablonniere','Hubert SABLONNIERE','INEAT Conseil','@hsablonniere');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('ivan_beauvais','Ivan Beauvais','Xebia','@ibeauvais');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('james_weaver','James Weaver','Oracle','@JavaFXpert');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('jean-baptiste_note','Jean-Baptiste Note','Criteo','');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('jean-christophe_sirot','Jean-Christophe Sirot','Arkena','@jcsirot');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('jean-eudes_couignoux','Jean-Eudes Couignoux','Xebia','@Jean-Eudes');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('jean-francois_garreau','Jean-Francois Garreau','SQLI / GDG Nantes / Nantes Wit / Devoxx4Kids','@jefBinomed');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('jean-francois_arcand','Jean-François Arcand','Async-IO.org','@jfarcand');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('jean-laurent_de_morlhon','Jean-Laurent de Morlhon','Serpodile','@morlhon');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('jean-louis_rigau','Jean-Louis Rigau','Xebia','@jlrigau');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('jean-philippe_bempel','Jean-Philippe Bempel','Ullink','@jpbempel');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('joel_gauci','Joel Gauci','IBM','@joel_gauci');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('jonathan_winandy','Jonathan Winandy','Valwin','ahoy_jon');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('josh_long','Josh Long','Pivotal','starbuxman');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('jose_paumard','José Paumard','Très indépendant','@JosePaumard');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('juergen_hoeller','Juergen Hoeller','Pivotal','@springjuergen');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('julien_dubois','Julien Dubois','Ippon Technologies','@juliendubois');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('julien_durillon','Julien Durillon','Clever Cloud','@juuduu');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('julien_landure','Julien Landuré','Zenika / GDG Nantes','@jlandure');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('julien_viet','Julien Viet','Red Hat','@julienviet');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('jerome_mainaud','Jérôme Mainaud','Ippon Technologies','@jxerome');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('khalid_jebbari','Khalid Jebbari','Freelance','@Dj3bbZ');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('laillet_cedric','Laillet Cédric','Apside Top','');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('laurent_doguin','Laurent Doguin','Couchbase','@ldoguin');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('laurent_huet','Laurent HUET','BA Systèmes','@lhuet35');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('louis_jacomet','Louis Jacomet','Terracotta','@ljacomet');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('loic_knuchel','Loïc KNUCHEL','Indépendant','loicknuchel');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('luc_legardeur','Luc Legardeur','Xebia','@llegardeur');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('ludovic_champenois','Ludovic Champenois','Google','@ludoch');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('ludovic_cinquin','Ludovic Cinquin','OCTO TECHNOLOGY','@lcinquin');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('markus_winand','Markus Winand','Tuning developers for SQL performance','@MarkusWinand');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('mathieu_ancelin','Mathieu ANCELIN','SERLI','@TrevorReznik');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('mathieu_broutin','Mathieu BROUTIN','Objectif Informatique','@mathieubroutin');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('mathieu_breton','Mathieu Breton','Xebia','@MatBreton');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('mathieu_poumeyrol','Mathieu Poumeyrol','Indépendant','@kalizoy');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('mathilde_lemee','Mathilde Lemée','Aetys','@MathildeLemee');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('matthieu_plantey','Matthieu PLANTEY','Wemanity','');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('matthieu_fourtina','Matthieu fourtina','LesFurets.com','@mfourtina');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('maxime_greau','Maxime Gréau','DGFIP - SRE','@mgreau');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('maxime_mader','Maxime Mader','Carbon IT','@kawabytes');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('mickael_debonnaire','Mickael Debonnaire','Apside Top','@mdebonnaire');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('mouhcine_moulou','Mouhcine MOULOU','Soat','@mouloumouhcine');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('nathaniel_richand','Nathaniel Richand','AgileTribu','@nrichand');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('nicolas_babel','Nicolas Babel','Motwin','@motwin_inc');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('nicolas_colomer','Nicolas Colomer','Viadeo','@n_colomer');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('nicolas_helleringer','Nicolas Helleringer','Criteo','@nhelleringer');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('nicolas_jozwiak','Nicolas Jozwiak','Xebia','@njozwiak');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('nicolas_muller','Nicolas Muller','Treeptik','@zepouet');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('nicolas_rigaud','Nicolas Rigaud','Aldebaran','wtfirl');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('nicolas_de_loof','Nicolas de Loof','CloudBees','@ndeloof');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('olivier_bazoud','Olivier Bazoud','','@obazoud');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('olivier_bourgain','Olivier Bourgain','OBMG','@olivierbourgain');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('olivier_croisier','Olivier Croisier','Moka Technologies','@OlivierCroisier');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('olivier_girardot','Olivier Girardot','Lateral Thoughts','@ogirardot');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('ori_pekelman','Ori Pekelman','Constellation Matrix','oripekelman');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('patrick_chanezon','Patrick Chanezon','Microsoft','@chanezon');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('paul_sandoz','Paul Sandoz','Oracle','@PaulSandoz');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('pauline_iogna','Pauline Iogna','','@_p_a_u_l_i_n_e_');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('pflieger_arnaud','Pflieger Arnaud','LesFurets.com','@ArnaudPflieger');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('philippe_antoine','Philippe Antoine','Xebia','@PhilippeAntoine');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('philippe_charriere','Philippe Charrière','TypeUnsafe &amp; SQLI','@k33g_org');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('philippe_comte','Philippe Comte','IBM','@philippecomte');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('philippe_thomas','Philippe Thomas','IBM','@phthom77');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('philippe_vasconcelos','Philippe vasconcelos','carboatmedia','@bandbike_team');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('pierre_baillet','Pierre Baillet','','@octplane');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('pierre_leresteux','Pierre LERESTEUX','Masternaut','@pierreleresteux');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('pierre_laporte','Pierre Laporte','Datastax','@pingtimeout');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('pierre_sutra','Pierre Sutra','University of Neuchâtel','');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('quentin_adam','Quentin Adam','Clever Cloud','@waxzce');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('quentin_sallat','Quentin Sallat','iD.apps','@Aerilys');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('quentin_suire','Quentin Suire','Viadeo','@kuhess');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('rafael_winterhalter','Rafael Winterhalter','Bouvet ASA','@rafaelcodes');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('raphael_brugier','Raphaël Brugier','LesFurets.com','rbrugier');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('ray_tsang','Ray Tsang','Google','@saturnism');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('remi_forax','Remi Forax','Unuiversité Paris Est Marne-la-Vallée','over_my_dead_body');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('rodolphe_gelin','Rodolphe Gelin','Aldebaran','');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('romain_linsolas','Romain Linsolas','Société Générale','@romaintaz');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('romain_manni-bucau','Romain Manni-Bucau','Tomitribe','@rmannibucau');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('sam_bessalah','Sam Bessalah','LatticeIQ','@samklr');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('sami_jaber','Sami Jaber','DNG Consulting','@samijaber');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('stephan_tual','Stephan Tual','Ethereum','@stephantual');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('stephane_manciot','Stéphane Manciot','ebiznext','@smanciot');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('stephane_nicoll','Stéphane Nicoll','Pivotal','@snicoll');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('stephane_epardaud','Stéphane Épardaud','Red Hat','@UnFroMage');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('stephanie_moallic','Stéphanie MOALLIC','','@steffy_29');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('sun_seng_david_tan','Sun Seng David TAN','Serli','@sun.seng.david.tan');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('sylvain_avril','Sylvain Avril','Indépendant','@sylvain_avril');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('sylvain_veyrie','Sylvain Veyrié','Transparency Rights Management','');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('sebastien_lesaint','Sébastien Lesaint','SonarSource','@LesaintSeb');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('thibault_pouget','Thibault Pouget','Cirruseo','@thibaultpouget');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('thierry_abalea','Thierry Abaléa','SGCIB','@ThierryAbalea');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('thierry_chatel','Thierry Chatel','MethoTIC Conseil','@ThierryChatel');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('thomas_guerin','Thomas Guerin','Xebia','@Tom404_');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('thomas_jaskula','Thomas JASKULA','COMPOSE IT','@tjaskula');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('thomas_pierrain','Thomas Pierrain','SG CIB','@tpierrain');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('thomas_recloux','Thomas Recloux','LET IT ZEN','@thomasrecloux');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('trisha_gee','Trisha Gee','JetBrains','trisha_gee');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('tugdual_grall','Tugdual Grall','MongoDB','@tgrall');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('vincent_massol','Vincent Massol','XWiki SAS','@vmassol');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('vincent_spiewak','Vincent Spiewak','Xebia','@vspiewak');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('vincent_van_steenbergen','Vincent Van Steenbergen','IDAaaS','@nsteenv');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('xavier_bucchiotty','Xavier Bucchiotty','Xebia','@xbucchiotty');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('yann_blazart','Yann Blazart','ByCode Technologies','@yblazart');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('yannick_grenzinger','Yannick grenzinger','Carbon IT','@ygrenzinger');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('youen_chene','Youen Chéné','Masternaut','@youen_chene');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('yves_le_cleach','Yves LE CLEACH','IBM','@ylecleach');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('zhe_li','Zhe LI','ARCA Computing','@AuroreZheLI');
INSERT INTO speakers (speaker, name,company,twitter) VALUES ('zouheir_cadi','Zouheir Cadi','JVKWA','@zouheircadi');



INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'francois_beaufort'},'Langages alternatifs','10 trucs que j''ai appris en lisant le code source de Chrome OS');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'gavin_king'},'Langages alternatifs','Ceylon Idioms');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'guillaume_laforge'},'Langages alternatifs','Groovy avec le style !');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'florent_ramiere'},'Langages alternatifs','Ma grand-mère Excel en grammaire Antlr');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'mathieu_poumeyrol'},'Langages alternatifs','Présentation de Rust, le langage le plus excitant depuis l''arrivée de Scala');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'pierre_baillet'},'Langages alternatifs','Présentation de Rust, le langage le plus excitant depuis l''arrivée de Scala');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'maxime_mader'},'Agilité, Methodologie & Tests','Coding, fast & slow');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'yannick_grenzinger'},'Agilité, Methodologie & Tests','Coding, fast & slow');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'luc_legardeur'},'Agilité, Methodologie & Tests','Comment manager des Geeks');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'clarisse_herrenschmidt'},'Agilité, Methodologie & Tests','Des tablettes d''écriture aux tablettes pour écrire');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'betty_moreau'},'Agilité, Methodologie & Tests','Des tablettes d''écriture aux tablettes pour écrire');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'guillaume_duquesnay'},'Agilité, Methodologie & Tests','Développeur sous influence');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'pflieger_arnaud'},'Agilité, Methodologie & Tests','Le Continuous Merge chez LesFurets.com');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'ludovic_cinquin'},'Agilité, Methodologie & Tests','Les idées reçues de l''informatique : Quand nos erreurs de raisonnement nous limitent.');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'mathilde_lemee'},'Agilité, Methodologie & Tests','Les tests exploratoires');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'david_lindsay'},'Agilité, Methodologie & Tests','Level Up your Dev Skills with Static Analysis');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'dimitri_baeli'},'Agilité, Methodologie & Tests','Livrer chaque jour ce qui est prêt ! Points clés du développement d''un produit avec une livraison par jour.');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'benjamin_degerbaix'},'Agilité, Methodologie & Tests','Livrer chaque jour ce qui est prêt ! Points clés du développement d''un produit avec une livraison par jour.');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'eyal_lezmy'},'Agilité, Methodologie & Tests','Plugin Gradle, prenez le contrôle du build !');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'cedric_champeau'},'Agilité, Methodologie & Tests','Plugin Gradle, prenez le contrôle du build !');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'aurelie_ballet'},'Agilité, Methodologie & Tests','UBFC - Ultimate Bug Fighting Championship');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'gaelle_bourven'},'Agilité, Methodologie & Tests','UBFC - Ultimate Bug Fighting Championship');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'gregory_weinbach'},'Agilité, Methodologie & Tests','UX : le Poids des Mots...');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'laurent_huet'},'Future Devoxx, IoT, Robotique','Comprendre l''IOT grâce à une boule ... mais pas que');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'philippe_charriere'},'Future Devoxx, IoT, Robotique','Comprendre l''IOT grâce à une boule ... mais pas que');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'philippe_comte'},'Future Devoxx, IoT, Robotique','Créer des applications cognitives avec IBM Watson Engagement Explorer et Bluemix ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'matthieu_plantey'},'Future Devoxx, IoT, Robotique','Des objets connectés c''est bien, utiles c''est mieux ! ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'ludovic_havel'},'Future Devoxx, IoT, Robotique','Des objets connectés c''est bien, utiles c''est mieux ! ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'gwennael_gate'},'Future Devoxx, IoT, Robotique','Des objets connectés c''est bien, utiles c''est mieux ! ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'james_weaver'},'Future Devoxx, IoT, Robotique','IoT Primer for Java Developers');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'duyhai_doan'},'Big Data & Analytics','Algorithmes distribués pour le Big Data');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'jean-baptiste_note'},'Big Data & Analytics','Anatomie de l''infrastructure de prédiction @Criteo: machine learning, log management, Hadoop.');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'laurent_vion'},'Big Data & Analytics','Anatomie de l''infrastructure de prédiction @Criteo: machine learning, log management, Hadoop.');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'hiram_madelaine'},'Big Data & Analytics','Datomic, la base de données qui n''oublie rien');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'colin_surprenant'},'Big Data & Analytics','Logstash: l’arme secrète pour vaincre le coté obscur de vos logs');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'hayssam_saleh'},'Big Data & Analytics','Machine Learning avec Spark, MLLib et D3.js');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'guillaume_laforge'},'Big Data & Analytics','Machine learning et régulation numérique');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'didier_girard'},'Big Data & Analytics','Machine learning et régulation numérique');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'markus_winand'},'Big Data & Analytics','Modern SQL');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'emmanuel_bernard'},'Big Data & Analytics','On n''est pas que des cobayes: ORM et NoSQL sont-ils solubles?');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'geoffrey_de_smet'},'Big Data & Analytics','OptaPlanner ou comment optimiser les itinéraires, les plannings et bien plus encore... ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'frederic_hornain'},'Big Data & Analytics','OptaPlanner ou comment optimiser les itinéraires, les plannings et bien plus encore... ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'damien_krotkine'},'Big Data & Analytics','Stockage et analyse temps réel d''événements avec Riak chez Booking.com');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'jonathan_winandy'},'Big Data & Analytics','Streaming/Kafka Avancé');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'alexis_gueganno'},'Big Data & Analytics','Streaming/Kafka Avancé');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'quentin_adam'},'Big Data & Analytics','Why postgres SQL deserve noSQL fan respect');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'jose_paumard'},'Java, JVM, Javas SE/EE','API Asynchrones en Java 8');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'christopher_batey'},'Java, JVM, Javas SE/EE','Building  fault tolerant microservices ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'louis_jacomet'},'Java, JVM, Javas SE/EE','Caching reboot: javax.cache & Ehcache 3 ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'alexander_heusingfeld'},'Java, JVM, Javas SE/EE','Concurrency in Enterprise Java');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'arun_gupta'},'Java, JVM, Javas SE/EE','Concurrency in Enterprise Java');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'benjamin_cabe'},'Java, JVM, Javas SE/EE','Eclipse is much more than just an IDE!  ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'wayne_beaton'},'Java, JVM, Javas SE/EE','Eclipse is much more than just an IDE!  ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'alex_kosowski'},'Java, JVM, Javas SE/EE','Finally, Security API JSR 375');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'olivier_croisier'},'Java, JVM, Javas SE/EE','Hashons peu mais hashons bien ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'olivier_bourgain'},'Java, JVM, Javas SE/EE','Hashons peu mais hashons bien ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'brice_leporini'},'Java, JVM, Javas SE/EE','JDBC / JPA / Hibernate: Sans maîtrise la puissance n''est rien  ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'trisha_gee'},'Java, JVM, Javas SE/EE','Java 8 in Anger  ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'brian_goetz'},'Java, JVM, Javas SE/EE','Java 9 Plan');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'paul_sandoz'},'Java, JVM, Javas SE/EE','Java 9 Plan');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'roberto_cortez'},'Java, JVM, Javas SE/EE','Java EE 7 Batch Processing in the Real World ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'david_delabassee'},'Java, JVM, Javas SE/EE','Java EE 7 Batch Processing in the Real World ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'david_delabassee'},'Java, JVM, Javas SE/EE','Java EE 8, a snapshot overview  ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'james_weaver'},'Java, JVM, Javas SE/EE','Java Mission Control for Earthlings     ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'emmanuel_bernard'},'Java, JVM, Javas SE/EE','Les Cast Codeurs Podcast : table ronde  ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'vincent_massol'},'Java, JVM, Javas SE/EE','Les Cast Codeurs Podcast : table ronde  ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'antonio_goncalves'},'Java, JVM, Javas SE/EE','Les Cast Codeurs Podcast : table ronde  ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'arnaud_heritier'},'Java, JVM, Javas SE/EE','Les Cast Codeurs Podcast : table ronde  ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'guillaume_laforge'},'Java, JVM, Javas SE/EE','Les Cast Codeurs Podcast : table ronde  ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'cyrille_martraire'},'Java, JVM, Javas SE/EE','Les monoïdes démystifiés, en Java et avec des verres de bière ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'rafael_winterhalter'},'Java, JVM, Javas SE/EE','Making Java more dynamic');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'juergen_hoeller'},'Java, JVM, Javas SE/EE','Modern Enterprise Java Architectures with Spring 4.1  ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'stephane_nicoll'},'Java, JVM, Javas SE/EE','Modern Enterprise Java Architectures with Spring 4.1  ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'paul_sandoz'},'Java, JVM, Javas SE/EE','Project Jigsaw   ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'remi_forax'},'Java, JVM, Javas SE/EE','Proxy 2.0  ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'antonio_goncalves'},'Java, JVM, Javas SE/EE','Venez découvrir CDI, la perle de Java EE !  ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'david_martin'},'Java, JVM, Javas SE/EE','API hypermedia  ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'julien_viet'},'Java, JVM, Javas SE/EE','Applications Concurrentes Polyglottes avec Vert.x  ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'romain_linsolas'},'Java, JVM, Javas SE/EE','Développement web : ce qui vous attend en 2015  ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'quentin_sallat'},'Java, JVM, Javas SE/EE','Holo to Material Design Transition  ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'julien_dubois'},'Java, JVM, Javas SE/EE','JHipster, le générateur d''applications Spring Boot + AngularJS  ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'florence_herrou'},'Java, JVM, Javas SE/EE','L''expérience utilisateur est importante pour nous  ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'hubert_sablonniere'},'Java, JVM, Javas SE/EE','La révolution hors-ligne du Web arrive avec les Service Workers  ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'sami_jaber'},'Java, JVM, Javas SE/EE','Le retour en force de GWT   ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'philippe_antoine'},'Java, JVM, Javas SE/EE','Les nouveaux outils du développeur web ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'florian_boulay'},'Java, JVM, Javas SE/EE','Migration d''une webapp Tomcat vers Vert.x  ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'horacio_gonzalez'},'Java, JVM, Javas SE/EE','Web Components, Polymer and Material Design  ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'jean-francois_arcand'},'Java, JVM, Javas SE/EE','http/2: A deux c''est mieux!');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'joel_gauci'},'Cloud, DevOps, Outils','Bluemix: l''avenir du développement dans le Cloud ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'nicolas_de_loof'},'Cloud, DevOps, Outils','Changing the wheel of a moving car - faire évoluer l''infra sans interruption  ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'sylvain_avril'},'Cloud, DevOps, Outils','Cloud DevOps avec OpenStack ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'sam_bessalah'},'Cloud, DevOps, Outils','Construire des applications Big Data avec Docker et Mesos.  ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'arun_gupta'},'Cloud, DevOps, Outils','DevOps with Java EE  ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'zouheir_cadi'},'Cloud, DevOps, Outils','Devops my code  ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'guillaume_laforge'},'Cloud, DevOps, Outils','Groovy et son process de release: nous l’avons rendu « grooooooovy » !  ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'fred_simon'},'Cloud, DevOps, Outils','Groovy et son process de release: nous l’avons rendu « grooooooovy » !  ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'cedric_champeau'},'Cloud, DevOps, Outils','Groovy et son process de release: nous l’avons rendu « grooooooovy » !  ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'ray_tsang'},'Cloud, DevOps, Outils','Infinite Infinispan  ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'patrick_chanezon'},'Cloud, DevOps, Outils','L''ecosysteme Docker sur Azure  ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'jean-eudes_couignoux'},'Cloud, DevOps, Outils','Les développeurs aussi maîtrisent le systemd  ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'carlos_sanchez'},'Cloud, DevOps, Outils','Scaling Docker with Kubernetes  ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'greg_truchetet'},'Architecture, Performance & Securité','Un News Feed temps réel personnalisé pour 65 millions d’utilisateurs ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'fabrice_robini'},'Architecture, Performance & Securité','Un News Feed temps réel personnalisé pour 65 millions d’utilisateurs ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'quentin_suire'},'Architecture, Performance & Securité','Un News Feed temps réel personnalisé pour 65 millions d’utilisateurs ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'francois_le_droff'},'Architecture, Performance & Securité','Barbus et Barbares  ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'romain_pelisse'},'Architecture, Performance & Securité','Barbus et Barbares  ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'pierre_laporte'},'Architecture, Performance & Securité','Comment rater ses benchmarks ?  ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'geoffroy_couprie'},'Architecture, Performance & Securité','De l''API au protocole  ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'alexandre_delegue'},'Architecture, Performance & Securité','I don''t always write Reactive applications, but when I do, it runs on Raspberry Pi  ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'mathieu_ancelin'},'Architecture, Performance & Securité','I don''t always write Reactive applications, but when I do, it runs on Raspberry Pi  ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'gil_tene'},'Architecture, Performance & Securité','Priming Java for Speed  ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'thomas_jaskula'},'Architecture, Performance & Securité','Recettes CQRS, pour bien cuisiner son architecture  ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'hadi_hariri'},'Architecture, Performance & Securité','Refactoring to Functional ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'geoffroy_couprie'},'Architecture, Performance & Securité','Sécuriser votre produit, from scratch  ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'fred_simon'},'Architecture, Performance & Securité','Tout ce que vous avez toujours voulu savoir sur les clients Java HTTP concurrents, asynchrones, sans oser demander!    ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'thierry_abalea'},'Architecture, Performance & Securité','Un monde où 1 ms vaut 100 M€  ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'alexandre_victoor'},'Architecture, Performance & Securité','Un monde où 1 ms vaut 100 M€  ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'dan_allen'},'Architecture, Performance & Securité','Write in AsciiDoc, Publish Everywhere!  ');
INSERT INTO talk (annee, type_talk, speakers,description , titre ) VALUES (2015,'conf',{'maxime_greau'},'Architecture, Performance & Securité','Write in AsciiDoc, Publish Everywhere!  ');
