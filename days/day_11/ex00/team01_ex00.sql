-- select coalesced values for name, lastname, type, volume, currency_name and last_rate_to_usd
SELECT COALESCE(usr.name, 'not defined') AS name, 
       -- select coalesced values for name, lastname, type, volume, currency_name and last_rate_to_usd
       COALESCE(usr.lastname, 'not defined') AS lastname, 
       -- type of the entry
       type, 
       -- sum of money
       SUM(money) AS volume, 
       -- name of the currency
       COALESCE(currency.name, 'not defined') AS currency_name, 
       -- last known rate to usd
       COALESCE(rate_to_usd, 1) AS last_rate_to_usd, 
       -- total volume in usd, rounded if the result is an integer
       CASE 
           -- if the sum multiplied by the rate to usd is equal to its floor
           WHEN SUM(money * COALESCE(rate_to_usd, 1)) = FLOOR(SUM(money * COALESCE(rate_to_usd, 1))) 
           -- then round the sum
           THEN FLOOR(SUM(money * COALESCE(rate_to_usd, 1))) 
           -- else leave the sum as is
           ELSE SUM(money * COALESCE(rate_to_usd, 1)) 
       END AS total_volume_in_usd 
-- join the tables
FROM balance 
FULL JOIN "user" usr ON usr.id = user_id 
FULL JOIN currency ON currency.id = currency_id 
AND currency.updated = (SELECT MAX(updated) FROM currency) 
-- filter out the entries which type is null
WHERE type IS NOT NULL 
-- group the entries by name, lastname, type, currency_name and last_rate_to_usd
GROUP BY usr.name, usr.lastname, type, currency.name, last_rate_to_usd 
-- order the entries by name, lastname and type
ORDER BY name DESC, lastname ASC, type ASC;