set search_path to steam;

-- 1. Find all games where the price is 49.99 and plus, while also having the game names shown
select g.name as name, price
from store
inner join steam.games g on g.gid = store.gid
where price >= 50
order by price asc;
