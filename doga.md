## DOGA


>doga.sql-ben található az adatbázis, itt pedig hozzá a kérdések és a vállaszok <3

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

14. Kik azok a gazdik akiknek a kisállata Dr. Davis hoz jár?
```sql
SELECT users.name
FROM users
INNER JOIN pets ON users.id = pets.us_id
INNER JOIN doctors ON pets.doc_id = doctors.id
WHERE doctors.doc_name = 'Dr. Davis';
```

15. Adj hozzá egy új rekordot a kisállatok táblához egy létező gazdihoz és doktorhoz.
```sql
INSERT INTO pets (pet_name, us_id, doc_id) 
VALUES ('Bodri', 1, 1);
```

16. (15. feladat kell hozzá) Jelenitse meg azokat az órvosokat akihez 2 kutya is jár ABC szerint a doktorokat
```sql
SELECT doc_name, COUNT(pet_name) AS 'Kutya száma' 
FROM doctors
INNER JOIN pets 
ON pets.doc_id = doctors.id
GROUP BY doc_id
HAVING COUNT(*) >= 2
ORDER BY doc_name ASC;
```

17. Melyik rendelőben rendel és mi a neve a 4-es id vel rendelkező orvosnak?
```sql
SELECT clinics.Clinic_name, doctors.doc_name 
FROM clinics 
INNER JOIN doctors 
ON clinics.id = doctors.clinic_id 
WHERE doctors.id = 4;
```

18. Melyik kisállat megy 2024 01 30 vagy utána orvoshoz?
```sql
SELECT pet_name 
FROM pets 
WHERE id 
IN (
    SELECT pet_id 
    FROM appointments 
    WHERE Time > '2024-01-30'
    );
```

19. Rendezd nővekvő sorrendbe az állatokat a gazdájik pénze szerint.
```sql
SELECT pet_name, money 
FROM pets
INNER JOIN users 
ON pets.us_id = users.id
ORDER BY money ASC;
```

20. Rendezzók csökkenő sorendbe hogy melyik gazdinak hány kisállata van  
```sql
SELECT users.name, COUNT(pets.id) AS 'Number of pets' 
FROM users
INNER JOIN pets 
ON users.id = pets.us_id
GROUP BY users.name
ORDER BY COUNT(pets.id) DESC;
```
