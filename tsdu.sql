select   dbf.tablespace_name,TBS.ALLOCATION_TYPE
         ,decode(greatest(1000,round(sum(bytes)/1024/1024))
                 ,1000, substr(round(sum(bytes)/1024/1024) ||' mb',1,20)
                 ,substr(round(sum(bytes)/1024/1024/1024,1) ||' GB',1,20) ) sum
         ,decode(
                greatest(0,round((sum(maxbytes)-sum(bytes))/1024/1024))
                ,0, 'not auto-extendable'
                ,decode(
                       greatest(1000,round((sum(maxbytes)-sum(bytes))/1024/1024))
                       ,1000, substr(round((sum(maxbytes)-sum(bytes))/1024/1024)||' mb',1,20)
                       ,substr(round((sum(maxbytes)-sum(bytes))/1024/1024/1024,1)||' GB',1,20) )
         )  can_extend_by
from     dba_data_files dbf
         ,dba_tablespaces tbs
where    DBF.TABLESPACE_NAME = TBS.TABLESPACE_NAME		 
group by dbf.tablespace_name,TBS.ALLOCATION_TYPE
order by TABLESPACE_NAME;

select   dbf.tablespace_name,TBS.ALLOCATION_TYPE
         ,decode(greatest(1000,round(sum(bytes)/1024/1024))
                 ,1000, substr(round(sum(bytes)/1024/1024) ||' mb',1,20)
                 ,substr(round(sum(bytes)/1024/1024/1024,1) ||' GB',1,20) ) sum
         ,decode(
                greatest(0,round((sum(maxbytes)-sum(bytes))/1024/1024))
                ,0, 'not auto-extendable'
                ,decode(
                       greatest(1000,round((sum(maxbytes)-sum(bytes))/1024/1024))
                       ,1000, substr(round((sum(maxbytes)-sum(bytes))/1024/1024)||' mb',1,20)
                       ,substr(round((sum(maxbytes)-sum(bytes))/1024/1024/1024,1)||' GB',1,20) )
         )  can_extend_by
from     dba_data_files dbf
         ,dba_tablespaces tbs
where    DBF.TABLESPACE_NAME = TBS.TABLESPACE_NAME		 
GROUP BY DBF.TABLESPACE_NAME,TBS.ALLOCATION_TYPE
HAVING SUM(BYTES) > 1024*1024*1024*10 -- 10000000000
ORDER BY TABLESPACE_NAME;

select   round(sum(bytes)/1024/1024/1024,2) || ' GB' Total_Files_Size
from     dba_data_files;


