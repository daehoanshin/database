SELECT
	DISTINCT T4.name
FROM
	users T1,
	groups T4,
	parent_child_links T4mm
WHERE
	T1.dbid = T4mm.parent_dbid (+)
	AND 16777334 = T4mm.parent_fielddef_id (+)
	AND T4mm.child_dbid = T4.dbid (+)
	AND (T1.dbid <> 0
	AND (T4.name IN ('NGN',
	'IT_Test',
	'WiFi_M2M' )));

=================================================

SELECT
	DISTINCT T4.name
FROM
	users T1
LEFT JOIN parent_child_links T4mm ON
	(T4mm.child_dbid = T1.dbid)
LEFT JOIN groups T4 ON
	(T4.dbid = T4mm.parent_dbid)
WHERE
	T1.dbid <> 0
	AND T4mm.parent_fielddef_id = 16777334
	AND T4.name IN ('NGN',
	'IT_Test',
	'WiFi_M2M' ));


SELECT
	DISTINCT T4.name
FROM
	users T1
LEFT JOIN groups T4 ON
	(T1.dbid = T4.dbid)
LEFT JOIN parent_child_links T4mm ON
	(T4mm.child_dbid = T4mm.parent_dbid)
WHERE
	T1.dbid <> 0
	AND T4.name IN ('NGN',
	'IT_Test',
	'WiFi_M2M' ));



SELECT * FROM TB_LOCK l

SELECT id FROM TB_APPROVE_HISTORY a, FORTIFY f, TB_LOCK l
WHERE a.WIID = f.ID AND a.APPROV_NM = l.USER_NM 

SELECT id FROM TB_APPROVE_HISTORY a, FORTIFY f
WHERE a.WIID = f.ID

SELECT DISTINCT id FROM TB_APPROVE_HISTORY a
left JOIN FORTIFY f ON (a.WIID = f.ID)
left JOIN TB_LOCK l ON (a.APPROV_NM = l.USER_NM)

