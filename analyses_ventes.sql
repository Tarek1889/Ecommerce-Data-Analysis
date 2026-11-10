-- 1. Aperçu de la table
SELECT * 
FROM ventes 
LIMIT 5;

-- 2. CA Positif Total
SELECT ROUND(SUM(LineTotal), 2) AS ca_positif 
FROM ventes;

-- 3. Top 10 Produits
SELECT Description, ROUND(SUM(LineTotal), 2) AS montant
FROM ventes
GROUP BY Description
ORDER BY montant DESC
LIMIT 10;

-- 4. Ventes par Pays
SELECT Country, ROUND(SUM(LineTotal), 2) AS montant
FROM ventes
GROUP BY Country
ORDER BY montant DESC
LIMIT 10;

-- 5. Ventes par Mois
SELECT strftime('%Y-%m', InvoiceDate) AS mois,
       ROUND(SUM(LineTotal), 2) AS montant
FROM ventes
GROUP BY mois
ORDER BY mois;

-- 6. Meilleurs Clients
SELECT CustomerID,
       COUNT(DISTINCT InvoiceNo) AS nb_factures,
       ROUND(SUM(LineTotal), 2) AS montant
FROM ventes
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY montant DESC
LIMIT 20;
