/*
© 2016 Andy Leonard
*/

Use SSISDB
go

Update custom.ApplicationPackages
Set FailApplicationOnPackageFailure = 0--1
Where ApplicationPackageID = 3

