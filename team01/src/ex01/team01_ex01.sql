insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH currency_help AS 
(
    SELECT
                balance.user_id AS user_id,
                currency.id as id,
                currency.name as name,
                balance.money as money,
                (SELECT currency.rate_to_usd FROM currency
                            WHERE currency.id = balance.currency_id
                              AND currency.updated < balance.updated
                            ORDER BY rate_to_usd LIMIT 1
                            ) AS rate_min,
                (SELECT currency.rate_to_usd FROM currency
                            WHERE currency.id = balance.currency_id
                              AND currency.updated > balance.updated
                            ORDER BY rate_to_usd LIMIT 1
                            ) AS rate_max
        FROM currency
        JOIN balance ON currency.id = balance.currency_id
        GROUP BY
            balance.money,
            currency.name,
            currency.id,
            balance.updated,
            balance.currency_id,
            balance.user_id
        ORDER BY rate_min DESC, rate_max
)
SELECT
    COALESCE("user".name, 'not defined') AS name,
    COALESCE("user".lastname, 'not defined') AS lastname,
    currency_help.name,
    currency_help.money * COALESCE(currency_help.rate_min, currency_help.rate_max) AS currency_in_usd
FROM currency_help
LEFT JOIN "user" ON currency_help.user_id = "user".id
ORDER BY "user".name , lastname, currency_help.name;
