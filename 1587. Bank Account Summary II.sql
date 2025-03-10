SELECT u.name, SUM(t.amount) AS balance
FROM Users u
LEFT JOIN Transactions t USING(account)
GROUP BY u.account
HAVING balance > 10000;
