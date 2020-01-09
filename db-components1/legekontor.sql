-- Demo database for testing of db-components
-- originally intended for Norwegian students
-- english names would be customer,product,order,detail

-- create role,database for demo
create role legekontor password '123';     -- legekontor is user
alter role legekontor with login;          -- allow login
create database legekontor owner legekontor;     -- create db

-- enter the new db
\c legekontor;

DROP TABLE IF EXISTS pasient cascade;
DROP TABLE IF EXISTS lege cascade;
DROP TABLE IF EXISTS legetime cascade;

-- pasient
CREATE TABLE pasient (
  pasientid SERIAL PRIMARY KEY,
  fornavn text NOT NULL,
  etternavn text NOT NULL,
  adresse text,
  epost text,
  tlf text,
  kjonn text,
  userid int unique not null
);

-- lege
CREATE TABLE  lege  (
   legeid  SERIAL PRIMARY KEY,
   fornavn  text NOT NULL,
   etternavn text NOT NULL,
   tlf text
);

-- legetime
CREATE TABLE  legetime  (
   legetimeid  SERIAL PRIMARY KEY,
   dato  date NOT NULL,
   kl time,
   legeid  int REFERENCES lege (legeid)
);


ALTER TABLE  legetime  ADD FOREIGN KEY ( pasientid ) REFERENCES  pasient  ( pasientid );
ALTER TABLE  pasient  ADD FOREIGN KEY ( legeid ) REFERENCES  users  ( legeid );
ALTER TABLE  lege  ADD FOREIGN KEY ( legeid ) REFERENCES  lege  ( legeid );

alter table legetime owner to legekontor;
alter table lege owner to legekontor;
alter table pasient owner to legekontor;

