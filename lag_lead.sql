-- ���� ����, ��������, ���Ŀ����� �Ի��� ������� ���ÿ� �����ϴ� ����
-- LAG�� LEAD �Լ��� ����° �Ķ������ DEFAULT ���� 0���� ����Ͽ� , �� �� �Լ���
-- ��ȯ���� NULL�� �Ϳ� ���� 0�� ��ȯ

SELECT TO_CHAR(HIRE_DATE, 'YYYY') �Ի�⵵, COUNT(*) �����, 
      LAG(COUNT(*),1,0) OVER (ORDER BY TO_CHAR(HIRE_DATE, 'YYYY')) �������������,
      LEAD(COUNT(*),1,0) OVER (ORDER BY TO_CHAR(HIRE_DATE, 'YYYY')) ���Ŀ��������
  FROM EMPLOYEES
 GROUP BY TO_CHAR(HIRE_DATE, 'YYYY')
 ORDER BY TO_CHAR(HIRE_DATE, 'YYYY')
 ;