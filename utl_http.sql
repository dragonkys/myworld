-- 오라클 11g 이상에서는 다음을 이용하여 utl_http 사용하기
-- sysdba권한이 있는 유저에서 수행해야 함

exec dbms_network_acl_admin.create_acl('network_services.xml','Network connection permission to mail server for hr','HR',true,'connect');

exec dbms_network_acl_admin.add_privilege('network_services.xml','HR',true,'resolve');

exec dbms_network_acl_admin.assign_acl('network_services.xml','*');

exec dbms_network_acl_admin.unassign_acl('network_services.xml','mail-server.ge.com');

SELECT * FROM DBA_NETWORK_ACLS;

select * from DBA_NETWORK_ACL_PRIVILEGES;

select * from USER_NETWORK_ACL_PRIVILEGES;
                             
exec dbms_network_acl_admin.drop_acl('network_services.xml');

SELECT UTL_HTTP.REQUEST('http://localhost:8080/test11.jsp') FROM DUAL
-- 80으로 호출을 하면 UTL_HTTP 오류가 발생(왜 그러는지 잘 모르겠음)
