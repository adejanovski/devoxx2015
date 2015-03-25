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
