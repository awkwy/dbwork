select code_commune_insee as "code de la commune", count(*) as "nombre de bureau" 
from bureau group by code_commune_insee order by count(*) desc;
 