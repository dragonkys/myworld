WITH
ITEM AS (
    SELECT 'A' ITEM, 1 SEQ, 100 QTY, '20181101' YMD FROM DUAL UNION ALL
    SELECT 'A' ITEM, 2 SEQ, 200 QTY, '20181101' YMD FROM DUAL UNION ALL
    SELECT 'A' ITEM, 3 SEQ, 150 QTY, '20181101' YMD FROM DUAL UNION ALL
    SELECT 'B' ITEM, 1 SEQ, 100 QTY, '20181101' YMD FROM DUAL UNION ALL
    SELECT 'B' ITEM, 2 SEQ, 120 QTY, '20181101' YMD FROM DUAL UNION ALL
    SELECT 'B' ITEM, 3 SEQ, 200 QTY, '20181101' YMD FROM DUAL UNION ALL
    SELECT 'D' ITEM, 1 SEQ, 100 QTY, '20181101' YMD FROM DUAL UNION ALL
    SELECT 'D' ITEM, 2 SEQ, 200 QTY, '20181101' YMD FROM DUAL UNION ALL
    SELECT 'D' ITEM, 3 SEQ, 200 QTY, '20181101' YMD FROM DUAL )
,ITEM_SUM AS (
    SELECT 'A' ITEM, 450 QTY, '20181101' YMD FROM DUAL UNION ALL
    SELECT 'C' ITEM, 300 QTY, '20181101' YMD FROM DUAL UNION ALL
    SELECT 'D' ITEM, 600 QTY, '20181101' YMD FROM DUAL)
SELECT  /*+ OPT_PARAM('_gby_hash_aggregation_enabled' 'false') */
        MIN(DECODE(NO,1,ITEM)) ITEM
        , SEQ
        , SUM(QTY1) QTY1, SUM(QTY2) QTY2
        , DECODE(SEQ,'TOT',NVL(SUM(QTY2),0) - NVL(SUM(QTY1),0)) DIFF  
FROM   
(
    SELECT ITEM, 'TOT' SEQ, NULL QTY1, QTY QTY2, 1 NO
    FROM   ITEM_SUM
    WHERE  YMD = '20181101'
    UNION ALL
    SELECT ITEM, DECODE(NO,1,'TOT',SEQ) SEQ, SUM(QTY) QTY1, NULL QTY2, NO 
    FROM   ITEM A, 
           (SELECT LEVEL NO FROM DUAL CONNECT BY LEVEL <= 2) B
    WHERE  YMD = '20181101'
    GROUP BY ITEM, NO, DECODE(NO,1,'TOT',SEQ)
)
GROUP BY ITEM, NO, SEQ 
