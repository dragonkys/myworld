-- https://docs.oracle.com/cd/B28359_01/appdev.111/b28419/d_job.htm#BABHCBFD  ����
-- ����Ŭ job���
begin
    dbms_job.submit(
    :jobid,             -- jobid�� ���������� �Ҵ��
    'test1;',           -- �������� ; �߰��ؾ���, procedure ���
    sysdate+1/1440,     -- dateŸ�� 1���Ŀ� ó�� ���� next_date
    'sysdate+10/1440'); -- ����Ÿ��, case���� ��밡��, 10�� �������� ���� interval
    commit;
end;
/

-- ����Ŭ job���� �Ķ���ʹ� user_jobs���� ���̴� job��ȣ
exec dbms_job.remove(6);

-- ����Ŭ job�� ��ϵǾ� �ִ� ���� ���� �ٷ� �������� ����
exec dbms_job.run(6);