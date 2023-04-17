CREATE EVENT SESSION es1 ON SERVER 
ADD EVENT b.c;

CREATE EVENT SESSION es1 ON SERVER 
ADD EVENT b.c;

CREATE EVENT SESSION es1 ON SERVER 
ADD EVENT b.c 
ADD TARGET b.c.d;

CREATE EVENT SESSION es1 ON SERVER 
ADD EVENT b.c
    (
    SET b = -5.1
    ), 
ADD EVENT a.b.c
    (
    ACTION (b.c)
    ), 
ADD EVENT b.d
    (
    WHERE a.b.c = 5
    );

CREATE EVENT SESSION es1 ON SERVER 
ADD EVENT b.c
    (
    SET b = -5.1
    ), 
ADD EVENT a.b.c
    (
    ACTION (b.c)
    ), 
ADD EVENT a.b.d
    (
    SET b = 'ab'
    ACTION (b.c.d,
            b.c)
    WHERE a.b.c != 5
    );

CREATE EVENT SESSION es1 ON SERVER 
ADD EVENT b.c
    (
    SET b = -5.1
    ), 
ADD EVENT a.b.c
    (
    ACTION (b.c)
    ), 
ADD EVENT b.d
    (
    WHERE a.b.c = 5
    ) 
ADD TARGET a.b.c, 
ADD TARGET a.b.c
    (
    SET c = ('ab')
    )
WITH  (
        TRACK_CAUSALITY = ON
      );

CREATE EVENT SESSION es1 ON SERVER 
ADD EVENT b.c
    (
    SET b = -5.1
    )
WITH  (
        TRACK_CAUSALITY = ON
      );

CREATE EVENT SESSION es1 ON SERVER 
ADD EVENT b.c
    (
    SET b = -5.1
    ), 
ADD EVENT a.b.c
    (
    ACTION (b.c)
    ), 
ADD EVENT b.d
    (
    WHERE a.b.c = 5
    ) 
ADD TARGET a.b.c, 
ADD TARGET a.b.c
    (
    SET c = 'ab'
    )
WITH  (
        MAX_MEMORY = 4 MB,
        MAX_DISPATCH_LATENCY = 5 SECONDS
      );

CREATE EVENT SESSION es1 ON SERVER 
ADD EVENT b.c
    (
    SET b = -5.1
    )
WITH  (
        MEMORY_PARTITION_MODE = PER_CPU
      );

CREATE EVENT SESSION es1 ON SERVER 
ADD EVENT b.c
    (
    SET b = -5.1,
        c = 5
    );

CREATE EVENT SESSION es1 ON SERVER 
ADD EVENT b.c
    (
    SET b = -5.1,
        c = 5
    ) 
ADD TARGET c.d
    (
    SET a = 5,
        d = 'cd'
    );

CREATE EVENT SESSION es1 ON SERVER 
ADD EVENT b.c
    (
    SET b = -5.1
    ), 
ADD EVENT b.d
    (
    WHERE a.b (b.c, 5)
    );

CREATE EVENT SESSION es1 ON SERVER 
ADD EVENT b.c
    (
    SET b = -5.1
    ), 
ADD EVENT b.d
    (
    WHERE a.b (ab.c, 5)
    ), 
ADD EVENT b.d
    (
    WHERE a != 10
    );

CREATE EVENT SESSION es1 ON SERVER 
ADD EVENT b.c
    (
    SET b = -5.1,
        c = 5
    ), 
ADD EVENT a.b
    (
    SET a = 'ab'
    ), 
ADD EVENT b.c
    (
    ACTION (a.b,
            c.d,
            e.f)
    ), 
ADD EVENT c.d
    (
    ACTION (b.c)
    ), 
ADD EVENT d.f
    (
    WHERE b.c > 5
    ), 
ADD EVENT d.f.g
    (
    WHERE a.b != 4
    ) 
ADD TARGET a.b.c
    (
    SET b = 4
    )
WITH  (
        EVENT_RETENTION_MODE = ALLOW_MULTIPLE_EVENT_LOSS,
        MAX_EVENT_SIZE = 5 KB,
        STARTUP_STATE = ON
      );

CREATE EVENT SESSION es1 ON SERVER 
ADD EVENT b.d
    (
    WHERE a.b (b.c, 5)
          AND a.b = 5
    );

CREATE EVENT SESSION es1 ON SERVER 
ADD EVENT b.d
    (
    WHERE NOT a.b (b.c, 5)
    );

CREATE EVENT SESSION es1 ON SERVER 
ADD EVENT b.d
    (
    WHERE NOT a.b (b.c, 5)
          OR NOT a.b (b.c, 5)
    );

CREATE EVENT SESSION es1 ON SERVER 
ADD EVENT b.d
    (
    WHERE (a.b (b.c, 5))
          AND (a.b = 5)
    );

CREATE EVENT SESSION es1 ON SERVER 
ADD EVENT b.d
    (
    WHERE (NOT (a.b (f.c, 100))
           AND (a.d > 42))
    );

CREATE EVENT SESSION es1 ON SERVER 
ADD EVENT b.d
    (
    WHERE (NOT (a.b (f.c, 100))
           AND (a.d > 42)
           OR (c < 20))
    );

CREATE EVENT SESSION es1 ON SERVER 
ADD EVENT b.c, 
ADD EVENT b.c
    (
    ACTION (a.b,
            c.d,
            e.f)
    ), 
ADD EVENT b.d
    (
    WHERE NOT a.b (b.c, 5)
          OR NOT a.b (b.c, 5)
    ), 
ADD EVENT b.d
    (
    WHERE (NOT (a.b (f.c, 100))
           AND (a.d > 42)
           OR (c < 20))
    ) 
ADD TARGET c.d
    (
    SET a = 5,
        d = 'cd'
    )
WITH  (
        EVENT_RETENTION_MODE = ALLOW_MULTIPLE_EVENT_LOSS,
        MAX_EVENT_SIZE = 5 KB
      );

CREATE EVENT SESSION es1 ON SERVER 
ADD EVENT a.b
    (
    SET b = 5,
        c = 10
    ACTION (b.c,
            c.a)
    WHERE (a.c < 4)
    );


GO
ALTER EVENT SESSION es1 ON SERVER 
ADD EVENT a.b;

ALTER EVENT SESSION es1 ON SERVER 
ADD EVENT a.b, 
ADD EVENT c.f
WITH  (
        TRACK_CAUSALITY = ON
      );

ALTER EVENT SESSION es1 ON SERVER 
DROP EVENT a.b;

ALTER EVENT SESSION es1 ON SERVER 
DROP EVENT a.b,
DROP EVENT b.c
WITH  (
        MAX_MEMORY = 4 KB
      );

ALTER EVENT SESSION es1 ON SERVER 
ADD TARGET a.b
WITH  (
        MAX_MEMORY = 4 MB,
        MAX_DISPATCH_LATENCY = 5 SECONDS
      );

ALTER EVENT SESSION es1 ON SERVER 
DROP TARGET a.b,
DROP TARGET b.c,
DROP TARGET c.d
WITH  (
        MAX_MEMORY = 4 KB
      );

ALTER EVENT SESSION es1 ON SERVER 
WITH  (
        MEMORY_PARTITION_MODE = PER_CPU
      );

ALTER EVENT SESSION es1 ON SERVER 
STATE = START;

ALTER EVENT SESSION es1 ON SERVER 
STATE = STOP;


GO
DROP EVENT SESSION es1 ON SERVER;

CREATE EVENT SESSION es1 ON DATABASE 
ADD EVENT b.c;

CREATE EVENT SESSION es1 ON DATABASE 
ADD EVENT b.c;

CREATE EVENT SESSION es1 ON DATABASE 
ADD EVENT b.c 
ADD TARGET b.c.d;

CREATE EVENT SESSION es1 ON DATABASE 
ADD EVENT b.c
    (
    SET b = -5.1
    ), 
ADD EVENT a.b.c
    (
    ACTION (b.c)
    ), 
ADD EVENT b.d
    (
    WHERE a.b.c = 5
    );

CREATE EVENT SESSION es1 ON DATABASE 
ADD EVENT b.c
    (
    SET b = -5.1
    ), 
ADD EVENT a.b.c
    (
    ACTION (b.c)
    ), 
ADD EVENT a.b.d
    (
    SET b = 'ab'
    ACTION (b.c.d,
            b.c)
    WHERE a.b.c != 5
    );

CREATE EVENT SESSION es1 ON DATABASE 
ADD EVENT b.c
    (
    SET b = -5.1
    ), 
ADD EVENT a.b.c
    (
    ACTION (b.c)
    ), 
ADD EVENT b.d
    (
    WHERE a.b.c = 5
    ) 
ADD TARGET a.b.c, 
ADD TARGET a.b.c
    (
    SET c = ('ab')
    )
WITH  (
        TRACK_CAUSALITY = ON
      );

CREATE EVENT SESSION es1 ON DATABASE 
ADD EVENT b.c
    (
    SET b = -5.1
    )
WITH  (
        TRACK_CAUSALITY = ON
      );

CREATE EVENT SESSION es1 ON DATABASE 
ADD EVENT b.c
    (
    SET b = -5.1
    ), 
ADD EVENT a.b.c
    (
    ACTION (b.c)
    ), 
ADD EVENT b.d
    (
    WHERE a.b.c = 5
    ) 
ADD TARGET a.b.c, 
ADD TARGET a.b.c
    (
    SET c = 'ab'
    )
WITH  (
        MAX_MEMORY = 4 MB,
        MAX_DISPATCH_LATENCY = 5 SECONDS
      );

CREATE EVENT SESSION es1 ON DATABASE 
ADD EVENT b.c
    (
    SET b = -5.1
    )
WITH  (
        MEMORY_PARTITION_MODE = PER_CPU
      );

CREATE EVENT SESSION es1 ON DATABASE 
ADD EVENT b.c
    (
    SET b = -5.1,
        c = 5
    );

CREATE EVENT SESSION es1 ON DATABASE 
ADD EVENT b.c
    (
    SET b = -5.1,
        c = 5
    ) 
ADD TARGET c.d
    (
    SET a = 5,
        d = 'cd'
    );

CREATE EVENT SESSION es1 ON DATABASE 
ADD EVENT b.c
    (
    SET b = -5.1
    ), 
ADD EVENT b.d
    (
    WHERE a.b (b.c, 5)
    );

CREATE EVENT SESSION es1 ON DATABASE 
ADD EVENT b.c
    (
    SET b = -5.1
    ), 
ADD EVENT b.d
    (
    WHERE a.b (ab.c, 5)
    ), 
ADD EVENT b.d
    (
    WHERE a != 10
    );

CREATE EVENT SESSION es1 ON DATABASE 
ADD EVENT b.c
    (
    SET b = -5.1,
        c = 5
    ), 
ADD EVENT a.b
    (
    SET a = 'ab'
    ), 
ADD EVENT b.c
    (
    ACTION (a.b,
            c.d,
            e.f)
    ), 
ADD EVENT c.d
    (
    ACTION (b.c)
    ), 
ADD EVENT d.f
    (
    WHERE b.c > 5
    ), 
ADD EVENT d.f.g
    (
    WHERE a.b != 4
    ) 
ADD TARGET a.b.c
    (
    SET b = 4
    )
WITH  (
        EVENT_RETENTION_MODE = ALLOW_MULTIPLE_EVENT_LOSS,
        MAX_EVENT_SIZE = 5 KB,
        STARTUP_STATE = ON
      );

CREATE EVENT SESSION es1 ON DATABASE 
ADD EVENT b.d
    (
    WHERE a.b (b.c, 5)
          AND a.b = 5
    );

CREATE EVENT SESSION es1 ON DATABASE 
ADD EVENT b.d
    (
    WHERE NOT a.b (b.c, 5)
    );

CREATE EVENT SESSION es1 ON DATABASE 
ADD EVENT b.d
    (
    WHERE NOT a.b (b.c, 5)
          OR NOT a.b (b.c, 5)
    );

CREATE EVENT SESSION es1 ON DATABASE 
ADD EVENT b.d
    (
    WHERE (a.b (b.c, 5))
          AND (a.b = 5)
    );

CREATE EVENT SESSION es1 ON DATABASE 
ADD EVENT b.d
    (
    WHERE (NOT (a.b (f.c, 100))
           AND (a.d > 42))
    );

CREATE EVENT SESSION es1 ON DATABASE 
ADD EVENT b.d
    (
    WHERE (NOT (a.b (f.c, 100))
           AND (a.d > 42)
           OR (c < 20))
    );

CREATE EVENT SESSION es1 ON DATABASE 
ADD EVENT b.c, 
ADD EVENT b.c
    (
    ACTION (a.b,
            c.d,
            e.f)
    ), 
ADD EVENT b.d
    (
    WHERE NOT a.b (b.c, 5)
          OR NOT a.b (b.c, 5)
    ), 
ADD EVENT b.d
    (
    WHERE (NOT (a.b (f.c, 100))
           AND (a.d > 42)
           OR (c < 20))
    ) 
ADD TARGET c.d
    (
    SET a = 5,
        d = 'cd'
    )
WITH  (
        EVENT_RETENTION_MODE = ALLOW_MULTIPLE_EVENT_LOSS,
        MAX_EVENT_SIZE = 5 KB
      );

CREATE EVENT SESSION es1 ON DATABASE 
ADD EVENT a.b
    (
    SET b = 5,
        c = 10
    ACTION (b.c,
            c.a)
    WHERE (a.c < 4)
    );


GO
ALTER EVENT SESSION es1 ON DATABASE 
ADD EVENT a.b;

ALTER EVENT SESSION es1 ON DATABASE 
ADD EVENT a.b, 
ADD EVENT c.f
WITH  (
        TRACK_CAUSALITY = ON
      );

ALTER EVENT SESSION es1 ON DATABASE 
DROP EVENT a.b;

ALTER EVENT SESSION es1 ON DATABASE 
DROP EVENT a.b,
DROP EVENT b.c
WITH  (
        MAX_MEMORY = 4 KB
      );

ALTER EVENT SESSION es1 ON DATABASE 
ADD TARGET a.b
WITH  (
        MAX_MEMORY = 4 MB,
        MAX_DISPATCH_LATENCY = 5 SECONDS
      );

ALTER EVENT SESSION es1 ON DATABASE 
DROP TARGET a.b,
DROP TARGET b.c,
DROP TARGET c.d
WITH  (
        MAX_MEMORY = 4 KB
      );

ALTER EVENT SESSION es1 ON DATABASE 
WITH  (
        MEMORY_PARTITION_MODE = PER_CPU
      );

ALTER EVENT SESSION es1 ON DATABASE 
STATE = START;

ALTER EVENT SESSION es1 ON DATABASE 
STATE = STOP;


GO
DROP EVENT SESSION es1 ON DATABASE;