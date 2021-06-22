/*
© 2016 Andy Leonard
*/

Use SSISDB
go

 -- Add FailApplicationOnPackageFailure to custom.ApplicationPackages table
print 'Custom.ApplicationPackagesFailApplicationOnPackageFailure column'
If Not Exists(Select s.name + '.' + t.name + '.' + c.name
              From sys.columns c
			  Join sys.tables t
			    On t.object_id = c.object_id
		      Join sys.schemas s
		        On s.schema_id = t.schema_id
		      Where s.name = 'custom'
		        And t.name = 'ApplicationPackages'
				And c.name = 'FailApplicationOnPackageFailure')
 begin
  print ' - Adding custom.ApplicationPackages.FailApplicationOnPackageFailure column'
  Alter Table custom.ApplicationPackages
   Add FailApplicationOnPackageFailure bit
  print ' - Custom.ApplicationPackages.FailApplicationOnPackageFailure column created'
 end
Else
 print ' - Custom.ApplicationPackages.FailApplicationOnPackageFailure column already exists.'
go

Update custom.ApplicationPackages
Set FailApplicationOnPackageFailure = 1

Update custom.ApplicationPackages
Set FailApplicationOnPackageFailure = 0
Where ApplicationPackageID = 2
