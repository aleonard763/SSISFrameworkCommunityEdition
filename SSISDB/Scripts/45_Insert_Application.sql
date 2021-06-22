/*
© 2016 Andy Leonard
*/

Use SSISDB
go

If Not Exists(Select *
              From custom.Applications
			  Where ApplicationID = 1)
Insert Into custom.Applications
(ApplicationName)
Values
  ('Framework Test')

Select * From custom.Applications
