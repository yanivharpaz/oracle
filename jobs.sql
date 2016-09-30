set lines 120 heading on
set colsep |
column job format 9999999
column schema_user format a15
column what format a45
column last format a16
column this format a16
column next format a16
column f format 99
column b format a1
select job
		,schema_user
		,substr(what,1,75) what1
		, failures f
		,broken b
		, to_char(last_date,'ddmmyy hh24:mi:ss') last
		,to_char(next_date,'ddmmyy hh24:mi:ss') next
		,to_char(this_date,'ddmmyy hh24:mi:ss') this
from dba_jobs
order by job
/

