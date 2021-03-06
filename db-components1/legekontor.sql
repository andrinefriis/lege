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
<<<<<<< HEAD
DROP TABLE IF EXISTS linje cascade;

create table users (
   userid serial primary key,
   username text not null,
   role text default 'user',
   password text not null
);
=======
>>>>>>> f445ac9adcd658fcffc5fd15de2a48022ca9ee5f

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
   pris text not null
   kl time,
   legeid  int REFERENCES lege (legeid),
   pasientid int REFERENCES pasient (pasientid)
);


ALTER TABLE  legetime  ADD FOREIGN KEY ( pasientid ) REFERENCES  pasient  ( pasientid );
<<<<<<< HEAD
ALTER TABLE  pasient  ADD FOREIGN KEY ( userid ) REFERENCES  users  ( userid );
ALTER TABLE  lege  ADD FOREIGN KEY ( kategori ) REFERENCES  lege  ( legeid );
=======
ALTER TABLE  pasient  ADD FOREIGN KEY ( legeid ) REFERENCES  users  ( legeid );
ALTER TABLE  lege  ADD FOREIGN KEY ( legeid ) REFERENCES  lege  ( legeid );
>>>>>>> f445ac9adcd658fcffc5fd15de2a48022ca9ee5f

alter table legetime owner to legekontor;
alter table lege owner to legekontor;
alter table pasient owner to legekontor;
alter table users owner to legekontor;

