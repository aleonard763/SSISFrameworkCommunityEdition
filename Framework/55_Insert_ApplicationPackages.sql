/*
© 2016 Andy Leonard
*/

Use SSISDB
go

If Not Exists(Select *
              From custom.ApplicationPackages
			  Where ApplicationPackageID = 1)
Insert Into custom.ApplicationPackages
(ApplicationID, PackageID, ExecutionOrder)
Values
  (1, 1, 10)
, (1, 3, 20)
, (1, 2, 30)

Select * From custom.ApplicationPackages
