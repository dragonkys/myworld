/* ���̳����� ���� �� �������� �����ϱ� */
with aa as 
 ( 
 select '������'   as �̸�, 4 as ���� from dual union all 
 select '�ҳ�ô�' as �̸�, 5 as ���� from dual union all 
 select '������'   as �̸�, 5 as ���� from dual union all 
 select '��ư�'   as �̸�, 6 as ���� from dual union all 
 select '�ҳ�ô�' as �̸�, 8 as ���� from dual union all 
 select 'AOA'      as �̸�, 4 as ���� from dual union all 
 select '���座��' as �̸�, 5 as ���� from dual union all 
 select '���κ���' as �̸�, 5 as ���� from dual union all 
 select 'AOA'      as �̸�, 5 as ���� from dual union all 
 select '���座��' as �̸�, 3 as ���� from dual 
) 
select �̸�, sum(����) as ���� 
from aa 
where �̸� in (select regexp_substr('AOA,�ҳ�ô�', '[^,]+', 1, lv) 
from (select level as lv from dual connect by level <= regexp_count('AOA,�ҳ�ô�',',') + 1) 
) 
group by �̸� 

