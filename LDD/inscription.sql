CREATE TABLE inscription 
(
    Id_inscription	char(5) unique not null primary key,
    Ref_Election	int not null,
    Ref_Bureau	int not null,
    nbinscrits 	int,
    nbvotants 	int,
    nbexprimes 	int,
    FOREIGN key(Ref_Election)
    REFERENCES election(ID_scrutin),
    FOREIGN key(Ref_Bureau)
    REFERENCES bureau(numbureau)

);
