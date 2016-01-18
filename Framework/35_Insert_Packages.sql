/*
© 2016 Andy Leonard
*/

Use SSISDB
go

 -- truncate table custom.Packages

If Not Exists(Select *
              From custom.Packages
			  Where PackageID = 1)
Insert Into custom.Packages
(PackageName, Projectname, FolderName)
Values
  ('Child1.dtsx', 'FrameworkTest1', 'Test')
, ('Child2.dtsx', 'FrameworkTest1', 'Test')
, ('Child3.dtsx', 'FrameworkTest2', 'Test')

Select * From custom.Packages
