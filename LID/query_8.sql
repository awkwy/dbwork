select * from (
select Ref_Election,nom,prenom 
from votes inner join candidat 
on candidat.numdepot = votes.Ref_candidat 
group by Ref_Election, nom, prenom order by Ref_Election) as a1 
where Ref_Election =3;

