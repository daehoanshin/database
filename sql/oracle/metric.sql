SELECT
	TABLESPACE_NAME,
	TOTAL_BYTES,
	TOTAL_BLOCKS,
	FREE_BYTES,
	USED_BYTES
FROM
	(
	SELECT
		D.TABLESPACE_NAME,
		TOTAL_BYTES,
		TOTAL_BLOCKS,
		FREE_BYTES,
		TOTAL_BYTES - NVL(FREE_BYTES, 0) "USED_BYTES"
	FROM
		(
		SELECT
			TABLESPACE_NAME,
			SUM (BYTES) TOTAL_BYTES,
			SUM (BLOCKS) TOTAL_BLOCKS
		FROM
			DBA_DATA_FILES
		GROUP BY
			TABLESPACE_NAME) D,
		(
		SELECT
			TABLESPACE_NAME,
			SUM (BYTES) FREE_BYTES
		FROM
			DBA_FREE_SPACE
		GROUP BY
			TABLESPACE_NAME) F
	WHERE
		D.TABLESPACE_NAME = F.TABLESPACE_NAME(+)
UNION ALL
	SELECT
		D.TABLESPACE_NAME,
		TOTAL_BYTES,
		TOTAL_BLOCKS,
		NVL(FREE_BYTES, 0) "FREE_BYTES",
		USED_BYTES
	FROM
		(
		SELECT
			TABLESPACE_NAME,
			SUM(BYTES) TOTAL_BYTES,
			SUM(BLOCKS) TOTAL_BLOCKS
		FROM
			DBA_TEMP_FILES
		GROUP BY
			TABLESPACE_NAME) D,
		(
		SELECT
			TABLESPACE_NAME,
			SUM(BYTES_USED) USED_BYTES,
			SUM(BYTES_FREE) FREE_BYTES
		FROM
			V$TEMP_SPACE_HEADER
		GROUP BY
			TABLESPACE_NAME) F
	WHERE
		D.TABLESPACE_NAME = F.TABLESPACE_NAME(+));
--------------
 SELECT
	*
FROM
	v$instance
CROSS JOIN (
	SELECT
		VALUE AS NLS_CHARACTERSET
	FROM
		nls_database_parameters
	WHERE
		PARAMETER = 'NLS_CHARACTERSET')
CROSS JOIN (
	SELECT
		VALUE AS NLS_LANGUAGE
	FROM
		nls_database_parameters
	WHERE
		PARAMETER = 'NLS_LANGUAGE')
CROSS JOIN (
	SELECT
		VALUE AS NLS_TERRITORY
	FROM
		nls_database_parameters
	WHERE
		PARAMETER = 'NLS_TERRITORY')
CROSS JOIN (
	SELECT
		VALUE AS NLS_SORT
	FROM
		nls_database_parameters
	WHERE
		PARAMETER = 'NLS_SORT');
-----------------------------------
 SELECT
	instance_name,
	host_name,
	all_users.username,
	all_users.user_id,
	sql_id,
	sql_fulltext,
	plan_hash_value,
	DECODE(command_type, 11, 'ALTERINDEX', 15, 'ALTERTABLE', 170, 'CALLMETHOD', 9, 'CREATEINDEX', 1, 'CREATETABLE', 7, 'DELETE' , 50, 'EXPLAIN', 2, 'INSERT', 26, 'LOCKTABLE', 47, 'PL/SQLEXECUTE', 3, 'SELECT', 6, 'UPDATE', 189, 'UPSERT') command_name,
	CASE
		WHEN executions > 0 THEN ROUND(elapsed_time / executions, 3)
		ELSE NULL
	END elap_per_exec,
	parsing_schema_name,
	module,
	elapsed_time,
	executions,
	PHYSICAL_READ_BYTES / 1024 read_kb,
	buffer_gets,
	rows_processed
FROM
	v$sqlarea,
	all_users
CROSS JOIN (
	SELECT
		instance_name,
		host_name
	FROM
		v$instance)
WHERE
	v$sqlarea.PARSING_USER_ID = all_users.user_id;

--------------------------------------------------------------------

