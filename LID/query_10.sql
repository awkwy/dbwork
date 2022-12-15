select distinct nom, prenom 
from candidat inner join votes 
on candidat.numdepot = votes.Ref_candidat
where nb_votes = 0;