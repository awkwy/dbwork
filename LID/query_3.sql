-- on veut recuperer les gagnant de chaque elections
SELECT *
FROM candidat INNER JOIN (votes INNER JOIN election ON votes.Ref_Election = election.ID_scrutin)
ON votes.Ref_candidat = candidat.numdepot
WHERE(SELECT candidat.Nom, candidat.Prenom,sum(votes.nb_votes) AS total_sum
FROM votes INNER JOIN candidat
ON votes.Ref_candidat = candidat.numdepot
GROUP BY candidat.Nom, candidat.Prenom)



-- on veut recuperer les gagnant de chaque elections
SELECT ID_scrutin, libelle_du_scrutin, max(total_sum) as max_vote
from (SELECT ID_scrutin, libelle_du_scrutin, candidat.Nom, candidat.Prenom ,sum(votes.nb_votes) AS total_sum
FROM candidat INNER JOIN (votes INNER JOIN election ON votes.Ref_Election = election.ID_scrutin)
ON votes.Ref_candidat = candidat.numdepot
GROUP BY libelle_du_scrutin, ID_scrutin, candidat.Nom, candidat.Prenom) as tab1
-- where total_sum = max(total_sum)
GROUP BY libelle_du_scrutin, ID_scrutin

-- where(SELECT candidat.Nom, candidat.Prenom
-- FROM votes INNER JOIN candidat
-- ON votes.Ref_candidat = candidat.numdepot




-- on veut recuperer les gagnant de chaque elections
SELECT *
FROM (SELECT ID_scrutin, libelle_du_scrutin, max(total_sum) as max_vote
from (SELECT ID_scrutin, libelle_du_scrutin, candidat.Nom, candidat.Prenom ,sum(votes.nb_votes) AS total_sum
FROM candidat INNER JOIN (votes INNER JOIN election ON votes.Ref_Election = election.ID_scrutin)
ON votes.Ref_candidat = candidat.numdepot
GROUP BY libelle_du_scrutin, ID_scrutin, candidat.Nom, candidat.Prenom) AS tab1
GROUP BY libelle_du_scrutin, ID_scrutin) AS tab2;

SELECT libelle_du_scrutin, max_vote, Nom
FROM tab1 INNER JOIN tab2
ON tab1.ID_scrutin = tab2.ID_scrutin
GROUP BY libelle_du_scrutin, max_vote, Nom



-- where(SELECT candidat.Nom, candidat.Prenom
-- FROM votes INNER JOIN candidat
-- ON votes.Ref_candidat = candidat.numdepot
-- where total_sum = max(total_sum)


SELECT ID_scrutin, libelle_du_scrutin, Nom, Prenom, total_sum, ranking
from 
(SELECT ID_scrutin, libelle_du_scrutin, candidat.Nom, candidat.Prenom ,sum(votes.nb_votes) AS total_sum, RANK() over (partition by ID_scrutin, libelle_du_scrutin order by sum(votes.nb_votes) desc ) as ranking
FROM candidat INNER JOIN (votes INNER JOIN election ON votes.Ref_Election = election.ID_scrutin)
ON votes.Ref_candidat = candidat.numdepot
GROUP BY libelle_du_scrutin, ID_scrutin, candidat.Nom, candidat.Prenom
order by libelle_du_scrutin, ID_scrutin, sum(votes.nb_votes) DESC) as tab1 
where ranking = 1