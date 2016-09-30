
set lines 280
set colsep |
column p1text format a15
column p2text format a15
column event format a30
column username format a15
column blocking format 999999999
column p1 format 999999999999
column p2 format 999999999999
column "sid,serial" format a12

set lines 280
set colsep |
--
--
column p1text format a15
column p2text format a15
column event format a30
column username format a15
column blocking format 999999999
column p1 format 999999999999
column p2 format 999999999999
column "sid,serial" format a12
select sid ||',' ||serial# as sid
    ,blocking_session blocking
    ,event
    ,username
    , p1text
    , p1
    , p2text
    , p2
from  v$session
where blocking_session is not null ;
--
--

select sid,blocking_session blocking,event,username,
P1TEXT ,
P1     ,
P2TEXT ,
P2     
 from v$session where blocking_session is not null
/

