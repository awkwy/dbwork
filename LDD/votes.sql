CREATE TABLE votes 
(
    Ref_Election	int not null,
    Ref_Bureau	int not null,
    Ref_candidat	int not null,
    nb_votes	int not null,
    FOREIGN key(Ref_Election)
    REFERENCES election(ID_scrutin),
    FOREIGN key(Ref_Bureau)
    REFERENCES bureau(numbureau),
    FOREIGN key(Ref_candidat)
    REFERENCES candidat(numdepot)
);
