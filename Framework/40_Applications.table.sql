/*
© 2016 Andy Leonard
*/

Use SSISDB
go

-- create custom schema
print 'Custom Schema'
If Not Exists(Select name
              From sys.schemas 
			  Where name = 'custom')
 begin
  print ' - Creating custom schema'
  declare @sql varchar(100) = 'Create Schema custom'
  exec(@sql)
  print ' - Custom schema created'
 end
Else
 print ' - Custom schema already exists.'
print ''
go

 -- custom.Applications table
print 'Custom.Applications table'
If Not Exists(Select s.name + '.' + t.name
              From sys.tables t
		      Join sys.schemas s
		        On s.schema_id = t.schema_id
		      Where s.name = 'custom'
		        And t.name = 'Applications')
 begin
  print ' - Creating custom.Applications table'
  Create Table custom.Applications
  (ApplicationID int identity(1,1)
  ,ApplicationName nvarchar(130)
  )
  print ' - Custom.Applications table created'
 end
Else
 print ' - Custom.Applications table already exists.'
go

print ''
print 'UX_custom_Applications_ApplicationName'
If Not Exists(Select name
              From sys.key_constraints
			  Where name = 'UX_custom_Applications_ApplicationName')
 begin
  print ' - Adding UX_custom_Applications_ApplicationName unique constraint'
  Alter Table custom.Applications
   Add Constraint UX_custom_Applications_ApplicationName Unique(ApplicationName)
  print ' - UX_custom_Applications_ApplicationName unique constraint added'
 end
Else
 print ' - UX_custom_Applications_ApplicationName unique constraint already exists.'
go
