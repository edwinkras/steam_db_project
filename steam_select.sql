set search_path to steam;

-- 1. Find all games where the price is 49.99 and plus, while also having the game names shown
select g.name as name, price
from store
inner join steam.games g on g.gid = store.gid
where price >= 50
order by price asc;

-- 2. Find all users that been on steam for at least 4.5 years

select *
from user_account
where date_created < current_date - interval '4.5 years';

-- Sorry if I couldn't add more before the time limit
