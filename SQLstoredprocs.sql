IF OBJECT_ID('spAddContact') IS NOT NULL
	DROP PROC spAddContact
GO
CREATE PROC spAddContact
	@email varchar(260),
	@text text,
	@contactDate datetime,
	@empAssigned int
AS
	INSERT INTO contact
	VALUES (@email, @text, @contactDate, @empAssigned);
	go




	IF OBJECT_ID('spAddNewsletter') IS NOT NULL
	DROP PROC spAddNewsletter
GO
CREATE PROC spAddNewsletter
	@email varchar(60),
	@fName varchar(20),
	@lName varchar(30),
	@startDate datetime
AS
	INSERT INTO emailList
	VALUES (@email, @fName, @lName, @startDate);
	go


use outdoorSite;
go

CREATE LOGIN [EJApp] WITH PASSWORD='Pa$$w0rd', DEFAULT_DATABASE=[outdoorSite]
go
use outdoorSite
go
CREATE USER [EJApp] FOR LOGIN [EJApp] WITH DEFAULT_SCHEMA=[dbo]
GO
grant execute on spAddContact to EJApp
go