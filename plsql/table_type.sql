-- table type �����
DECLARE
  TYPE Lv_TABLE_REC IS RECORD ( -- RECORD TYPE����
    EMPNM VARCHAR2(30),
    EMPNO VARCHAR2(5),
	GUBUN VARCHAR2(3));  

  TYPE Lv_TABLE_OF_REC IS TABLE OF Lv_TABLE_REC;  -- TABLE OF RECORD TYPE ���� INDEX BY BINARY_INTEGER ������ ���
  Lv_TABLE_OF_R Lv_TABLE_OF_REC := Lv_TABLE_OF_REC(); -- �ʱ�ȭ �� ���� ����

  I NUMBER;

BEGIN

  I := 0;

  FOR EMP IN (
    WITH TEMP1 AS (
      SELECT 'ȫ�浿' AS EMPNM, '10001' AS EMPNO, 'A01' AS GUBUN FROM DUAL UNION ALL
      SELECT '�踻��' AS EMPNM, '10002' AS EMPNO, 'A02' AS GUBUN FROM DUAL UNION ALL
      SELECT 'ȫ����' AS EMPNM, '10003' AS EMPNO, 'A03' AS GUBUN FROM DUAL)
    SELECT EMPNM, EMPNO, GUBUN
      FROM TEMP1
	) LOOP

    I := I + 1;

    Lv_TABLE_OF_R.EXTEND; -- INDEX�� ������� ��������
    Lv_TABLE_OF_R(I).EMPNM := EMP.EMPNM;
    Lv_TABLE_OF_R(I).EMPNO := EMP.EMPNO;
    Lv_TABLE_OF_R(I).GUBUN := EMP.GUBUN;

    dbms_output.put_line('�̸�: ' || Lv_TABLE_OF_R(I).EMPNM);
    dbms_output.put_line('���: ' || Lv_TABLE_OF_R(I).EMPNO);
    dbms_output.put_line('����: ' || Lv_TABLE_OF_R(I).GUBUN);
  END LOOP;
END; 
