SELECT p.firstName, p.lastName, a.city, a.state
FROM Person p
LEFT JOIN Address a ON p.personId = a.personId;  -- LEFT JOIN 是保留左表所有記錄的關鍵：即使右表沒有匹配，也會返回左表的記錄，右表中無匹配的欄位以 NULL 顯示。
