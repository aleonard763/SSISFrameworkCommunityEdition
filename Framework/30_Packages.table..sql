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

 -- custom.Packages table
print 'Custom.Packages table'
If Not Exists(Select s.name + '.' + t.name
              From sys.tables t
		      Join sys.schemas s
		        On s.schema_id = t.schema_id
		      Where s.name = 'custom'
		        And t.name = 'Packages')
 begin
  print ' - Creating custom.Packages table'
  Create Table custom.Packages
  (PackageID int identity(1,1)
  ,PackageName nvarchar(130)
  ,ProjectName nvarchar(260)
  ,FolderName nvarchar(260)
  )
  print ' - Custom.Packages table created'
 end
Else
 print ' - Custom.Packages table already exists.'
go
