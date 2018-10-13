SELECT N,TO_CHAR(R,'YYYY-MM-DD HH24:MI:SS') R,TO_CHAR(T,'YYYY-MM-DD HH24:MI:SS') T  
FROM 
(
    ( 
        SELECT '1. CC' N, ROUND(SYSDATE, 'CC') R, TRUNC(SYSDATE,'CC') T FROM DUAL -- ���� , 100�����
    )
    UNION
    ( 
        SELECT '2. YEAR' N, ROUND(SYSDATE, 'YEAR') R, TRUNC(SYSDATE,'YEAR') T FROM DUAL --�����
    )
    UNION
    (
        SELECT '3. Q' N, ROUND(SYSDATE,'Q') R, TRUNC(SYSDATE,'Q') T FROM DUAL --�б�
    )
    UNION
    ( 
        SELECT '4. MONTH' N, ROUND(SYSDATE, 'MONTH') R, TRUNC(SYSDATE,'MONTH') T FROM DUAL --������
    )
    UNION
    (
        SELECT '5. W' N, ROUND(SYSDATE, 'W') R, TRUNC(SYSDATE,'W') T FROM DUAL --�ִ���
    )
    UNION
    (
        SELECT '6. DAY' N, ROUND(SYSDATE, 'DAY') R, TRUNC(SYSDATE,'DAY') T FROM DUAL --�ϴ���
    )
    UNION
    (
        SELECT '7. D' N, ROUND(SYSDATE, 'D') R, TRUNC(SYSDATE,'D') T FROM DUAL
    )
    UNION
    (
        SELECT '8. HH' N, ROUND(SYSDATE, 'HH') R, TRUNC(SYSDATE,'HH') T FROM DUAL
    )
    UNION
    (
        SELECT '9. MI' N, ROUND(SYSDATE, 'MI') R, TRUNC(SYSDATE,'MI') T FROM DUAL
    )
); 

