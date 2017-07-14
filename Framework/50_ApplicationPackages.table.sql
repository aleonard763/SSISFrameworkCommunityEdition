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

 -- custom.ApplicationPackages table
print 'Custom.ApplicationPackages table'
If Not Exists(Select s.name + '.' + t.name
              From sys.tables t
		      Join sys.schemas s
		        On s.schema_id = t.schema_id
		      Where s.name = 'custom'
		        And t.name = 'ApplicationPackages')
 begin
  print ' - Creating custom.ApplicationPackages table'
  Create Table custom.ApplicationPackages
  (ApplicationPackageID int identity(1,1)
  ,ApplicationID int
  ,PackageID int
  ,ExecutionOrder int
  )
  print ' - Custom.ApplicationPackages table created'
 end
Else
 print ' - Custom.ApplicationPackages table already exists.'
go

print ''
print 'UX_custom_ApplicationPackages_PackageId_Plus'
If Not Exists(Select name
              From sys.key_constraints
			  Where name = 'UX_custom_ApplicationPackages_PackageId_Plus')
 begin
  print ' - Adding UX_custom_ApplicationPackages_PackageId_Plus unique constraint'
  Alter Table custom.ApplicationPackages
   Add Constraint UX_custom_ApplicationPackages_PackageId_Plus Unique(ApplicationID, PackageID, ExecutionOrder)
  print ' - UX_custom_ApplicationPackages_PackageId_Plus unique constraint added'
 end
Else
 print ' - UX_custom_ApplicationPackages_PackageId_Plus unique constraint already exists.'
go
