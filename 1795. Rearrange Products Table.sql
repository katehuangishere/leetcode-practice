SELECT product_id, 'store1' AS store, store1 AS price -- 這裡的 'store1' 是一個字串，並且將這個字串別名為 store。結果集中，store 欄位的值將始終顯示為 "store1"。這樣做的目的是在結果中明確標示出這筆數據是來自於 store1。
FROM Products
WHERE store1 IS NOT NULL
UNION
SELECT product_id, 'store2' AS store, store2 AS price
FROM Products
WHERE store2 IS NOT NULL
UNION
SELECT product_id, 'store3' AS store, store3 AS price
FROM Products
WHERE store3 IS NOT NULL
