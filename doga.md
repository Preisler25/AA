## Még nincs kész

1.	Hogy hívják az egyes usereket?
```sql
SELECT name 
FROM doga.users;
```

2.	Melyek azok az életkorok amelyeknek átlagosan 1000 több pénze van, növekvő sorrendben életkor alapján?
```sql
SELECT age 
FROM users 
GROUP BY age 
HAVING AVG(money) > 1000 
ORDER BY age ASC;
```

3.	Melyek azok az életkorok amelyeknek átlagosan 1200 kevesebb pénze van, növekvő sorrendben életkor alapján?
```sql
SELECT age 
FROM users 
GROUP BY age 
HAVING AVG(money) < 1200 
ORDER BY age ASC;
```

4. Kérdezd le hogy életkorokra átlagolva mennyi az átlagos pénz ezeket rendezd csökkenő sorrendbe átlag pénz szerint.
```sql
SELECT age, AVG(money) 
FROM users 
GROUP BY age 
HAVING AVG(money) > 1000 
ORDER BY AVG(money) DESC;
```

5. Listázd ki a Usereket és a hozzájuk tartozó kisállatokat
```sql
SELECT users.name, pets.pet_name
FROM users
INNER JOIN pets 
ON users.id = pets.us_id;
```

6. Listázd ki hogy melyik kisállathoz melyik doktor tartozik
```sql
SELECT pet_name, doc_name 
FROM pets
INNER JOIN doctors 
ON pets.doc_id = doctors.id;
```

7. Max kisállatnak ki a gazdija és ki az orvosa?
```sql
SELECT p.pet_name, u.name, d.doc_name
FROM pets p
INNER JOIN users u ON p.us_id = u.id
INNER JOIN doctors d ON p.doc_id = d.id
WHERE p.id = (SELECT MAX(id) FROM pets);
```

8. Melyik életkornak van a átlagosan legtöbb pénze?
```sql
SELECT age 
FROM users 
GROUP BY age 
ORDER BY AVG(money) DESC 
LIMIT 1;
```

9. Melyik életkornak van átlagosan a legkevesebb pénze pénze?
```sql
SELECT age 
FROM users 
GROUP BY age 
ORDER BY AVG(money) ASC 
LIMIT 1;
```

10. Hány éves a legidősebb gazdi?
```sql
SELECT MAX(age) FROM users;
```

11. Hány éves a legfiatalabb gazdi
```sql
SELECT MIN(age) FROM users;
```

12. Hány különbőző életkoru gazdi van?
```sql
SELECT COUNT(DISTINCT age) FROM users;
```

13. Mikorra van Milo nevű kisállatnak időpntja?
```sql
SELECT pet_name, Time FROM pets
INNER JOIN appointments ON pets.id = appointments.pet_id
WHERE pet_name = 'Milo';
```

14. Ki a gazdija annak a kisállatnak aki Dr. Davis hoz jár?
```sql
SELECT users.name
FROM users
INNER JOIN pets ON users.id = pets.us_id
INNER JOIN doctors ON pets.doc_id = doctors.id
WHERE doctors.doc_name = 'Dr. Davis';
```

