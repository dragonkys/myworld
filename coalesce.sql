-- COALESCE(expr1, expr2, ..., exprn)
-- => CASE WHEN expr1 ISNOT NULL THEN expr1  ELSE COALESCE(expr2, ..., exprn) END
-- ó�� expr1�� NULL�̸� �� �������� ������ ���� expr2�� NULL�̸� �״������� ��� ������ �´�.  

WITH PRODUCT AS
    ( SELECT 2382 PRODUCT_ID, 850  LIST_PRICE, 731  MIN_PRICE FROM DUAL UNION ALL
      SELECT 3355 PRODUCT_ID, NULL LIST_PRICE, NULL MIN_PRICE FROM DUAL UNION ALL
      SELECT 1770 PRODUCT_ID, NULL LIST_PRICE,  73  MIN_PRICE FROM DUAL UNION ALL
      SELECT 2378 PRODUCT_ID, 305  LIST_PRICE, 247  MIN_PRICE FROM DUAL UNION ALL
      SELECT 1769 PRODUCT_ID,  48  LIST_PRICE, NULL MIN_PRICE FROM DUAL
    )
SELECT PRODUCT_ID, LIST_PRICE, MIN_PRICE,
   COALESCE(0.9*LIST_PRICE, MIN_PRICE, 5) "Sale"
   FROM PRODUCT


