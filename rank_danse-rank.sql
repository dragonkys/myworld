-- rank, dense_rank ����
select last_name,salary,
rank() over(order by salary desc) rank,        -- ���� ������ 2���ִ� ��� ex) 8,8 ���� 10 �̵�
dense_rank() over(order by salary desc) drank, -- ���� ������ 2���ִ� ��� ex) 8,8 ���� 9�� ��
row_number() over(order by salary desc) rowno  -- ���� �����ϰ� �������
from   employees

-- ���� �˰� �ִ� ��� ���° �������� �� �� �ִ�.
select rank(11000) within group(order by salary desc) rank
from   employees
;
