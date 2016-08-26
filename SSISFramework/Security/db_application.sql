CREATE ROLE [db_application]
    AUTHORIZATION [dbo];
GO

--GRANT ALTER ANY SCHEMA TO [db_application];
--GO
GRANT DELETE TO [db_application];
GO
GRANT EXECUTE TO [db_application];
GO
GRANT INSERT TO [db_application];
GO
GRANT SELECT TO [db_application];
GO
GRANT UPDATE TO [db_application];
GO
GRANT SHOWPLAN TO [db_application];
GO
GRANT VIEW DATABASE STATE TO [db_application];
GO
GRANT VIEW DEFINITION TO [db_application];
GO
