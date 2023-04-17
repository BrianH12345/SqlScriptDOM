CREATE SPATIAL INDEX sp1
    ON a.c (d)
    ON ab;

CREATE SPATIAL INDEX sp1
    ON a.c (d)
    ON "default";

CREATE SPATIAL INDEX sp1
    ON a.c (d)
    ON [default];

CREATE SPATIAL INDEX sp1
    ON a..c (d)
    WITH  (
            BOUNDING_BOX = (4, -5.5, 6, -9)
          );

CREATE SPATIAL INDEX sp1
    ON a..c (d)
    USING GEOMETRY_GRID
    WITH  (
            BOUNDING_BOX = (XMIN = 2, YMIN = 4, XMAX = 6, YMAX = 8)
          );

CREATE SPATIAL INDEX sp1
    ON a..c (d)
    USING GEOMETRY_GRID
    WITH  (
            GRIDS = (LOW, HIGH, MEDIUM, HIGH)
          );

CREATE SPATIAL INDEX sp1
    ON a..c (d)
    USING GEOMETRY_GRID
    WITH  (
            BOUNDING_BOX = (2, 3, 4, 5),
            GRIDS = (LEVEL_1 = HIGH, LEVEL_2 = LOW, LEVEL_3 = MEDIUM, LEVEL_4 = LOW)
          );

CREATE SPATIAL INDEX sp1
    ON a..c (d)
    USING GEOGRAPHY_GRID
    WITH  (
            GRIDS = (LEVEL_1 = HIGH, LEVEL_2 = LOW, LEVEL_3 = MEDIUM, LEVEL_4 = LOW),
            PAD_INDEX = OFF,
            SORT_IN_TEMPDB = ON
          );

CREATE SPATIAL INDEX sp1
    ON a..c (d)
    USING GEOGRAPHY_GRID
    WITH  (
            CELLS_PER_OBJECT = 5,
            GRIDS = (LEVEL_1 = HIGH, LEVEL_2 = LOW, LEVEL_3 = MEDIUM, LEVEL_4 = LOW),
            PAD_INDEX = OFF,
            SORT_IN_TEMPDB = ON,
            MAXDOP = 5,
            ALLOW_ROW_LOCKS = OFF,
            IGNORE_DUP_KEY = OFF
          );