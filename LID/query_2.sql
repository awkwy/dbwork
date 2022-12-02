-- qui sont les gagnants de chaque election


SELECT  libelle_du_scrutin as 'Élection', Nom, Prenom, total_sum as 'Nombre de vote'
from 
(SELECT ID_scrutin, libelle_du_scrutin, candidat.Nom, candidat.Prenom ,sum(votes.nb_votes) AS total_sum, RANK() over (partition by ID_scrutin, libelle_du_scrutin order by sum(votes.nb_votes) desc ) as ranking
FROM candidat INNER JOIN (votes INNER JOIN election ON votes.Ref_Election = election.ID_scrutin)
ON votes.Ref_candidat = candidat.numdepot
GROUP BY libelle_du_scrutin, ID_scrutin, candidat.Nom, candidat.Prenom
order by libelle_du_scrutin, sum(votes.nb_votes) DESC) as tab1 
where ranking = 1