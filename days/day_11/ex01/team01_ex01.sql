-- insert 2 entries into the currency table
insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

-- select the entries from the balance table, but with the currency in usd
SELECT COALESCE(usr.name, 'not defined') AS name, 
 -- select the name of the user
 COALESCE(lastname, 'not defined') AS lastname, 
 -- select the lastname of the user
 COALESCE(currency.name, 'not defined') AS currency_name, 
 -- select the name of the currency
 money * rate_to_usd AS currency_in_usd 
 -- select the money in usd
FROM balance FULL JOIN "user" usr ON usr.id = user_id 
 -- join the user table
 JOIN currency ON currency.id = currency_id AND currency.updated = 
 -- join the currency table
  (CASE WHEN ((SELECT MAX(updated) FROM currency WHERE currency.id = currency_id 
   -- case when the entry has a previous version
   AND currency.updated < balance.updated) IS NOT NULL) THEN 
  -- select the highest updated before the entry date
  (SELECT MAX(updated) FROM currency WHERE currency.id = currency_id 
   AND currency.updated < balance.updated) ELSE 
  -- else select the lowest updated
  (SELECT MIN(updated) FROM currency WHERE currency.id = currency_id) END) 
 -- order the entries by name, lastname and currency_name
ORDER BY name DESC, lastname ASC, currency_name ASC;