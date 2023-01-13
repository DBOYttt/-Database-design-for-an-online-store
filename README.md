


# Tabela produktów
Cel tabeli: Przechowywanie danych dotyczących produktów.

# Struktura tabeli:
```
Kolumna	Typ	Ograniczenie
product_id	INT	PRIMARY KEY
name	VARCHAR(255)	NOT NULL
price	DECIMAL(10,2)	NOT NULL
description	TEXT	NOT NULL
image	VARCHAR(255)	
category	VARCHAR(255)	NOT NULL
Przykładowe zapytanie SQL do pobrania wszystkich produktów z tabeli:
```
```
SELECT * FROM products;
Przykładowe zapytanie SQL do pobrania produktów z konkretną kategorią:
```
```
SELECT * FROM products WHERE category = 'Category 1';
Dodanie miejsca na zdjęcie, możesz dodać kolumnę o nazwie "image" typu VARCHAR(255) do tabeli produktów.
You can add a column named "image" of type VARCHAR(255) to the products table.
```
```
ALTER TABLE products ADD COLUMN image VARCHAR(255);
```
