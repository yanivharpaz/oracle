set line 200
col module format a30
col event format a20

select distinct substr(a.sid,1,6) as "sid"
    ,substr(A.INST_ID,1,4) as "inst"
    , substr(username,1,10) as "user"
    , substr(a.module,1,30) as module
    , substr(a.osuser,1,8) as osuser
    , substr(status,1,6) as status
    , substr(a.wait_class,1,10) as wclass
    , substr(a.event,1,20) as event
    , hash_value
    ,substr(c.sql_text,1,30) sql_text
from  gv$session a
    , gv$sql c
where a.sql_hash_value = c.hash_value
  and a.wait_time      = 0
  and status           = 'ACTIVE'
order by event
    , hash_value 
;





--set line 200
--col sid format 9999
--col username format a12
--col module format a16
--col osuser format a12
--col status format a10
--col event format a30
--col hash_value format 9999999999
--SELECT DISTINCT a.SID, username, a.module, a.osuser, status, a.wait_class, a.event, hash_value,substr(c.sql_text,1,50) sql_text
--           FROM gv$session a, gv$sql c
--          WHERE a.sql_hash_value = c.hash_value
--            AND a.wait_time = 0
--            AND status = 'ACTIVE'
--       order by EVENT, HASH_VALUE;
--
       
