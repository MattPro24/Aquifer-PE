USE [CnmPro]
GO
/****** Object:  StoredProcedure [dbo].[Organizations_Delete_ById]    Script Date: 8/17/2022 8:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Matt Prothero>
-- Create date: <20220705>
-- Description:	<Delete an Organization >
-- Code Reviewer: Morgan Frost

-- MODIFIED BY: n/a
-- MODIFIED DATE: n/a
-- Code Reviewer: 
-- Note: 
-- =============================================

CREATE proc [dbo].[Organizations_Delete_ById]
	@Id int

/*------TEST CODE------

		Declare @Id int = 3

		Select *
		From dbo.Organizations
		Where Id = @Id

		Execute dbo.Organizations_Delete_ById
			@Id

		Select *
		From dbo.Organizations
		Where Id = @Id
*/

AS

BEGIN

DELETE FROM [dbo].[Organizations]
	Where Id = @Id

END


GO
