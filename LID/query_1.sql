SELECT candidat.Nom, sum(votes.nb_votes) AS votes_total
FROM votes INNER JOIN candidat 
ON votes.Ref_candidat = candidat.numdepot
GROUP BY candidat.Nom  -- jusque la je selectionne le nombre de vote tout election confondu sanss le where
ORDER BY sum(votes.nb_votes) DESC
