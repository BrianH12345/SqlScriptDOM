﻿SELECT 1 << 1 >> 1;


GO
SELECT c1 << c1 >> c1
FROM t1;


GO
CREATE PROCEDURE sp1
AS
BEGIN
    SELECT c1 << c1 >> c1
    FROM t1;
END