USE [CnmPro]
GO
/****** Object:  StoredProcedure [dbo].[OrganizationTypes_Insert]    Script Date: 8/17/2022 8:35:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Matt Prothero>
-- Create date: <20220705>
-- Description:	<Insert an OrganizationType>
-- Code Reviewer: Morgan Frost

-- MODIFIED BY: n/a
-- MODIFIED DATE: n/a
-- Code Reviewer: 
-- Note: 
-- =============================================

	CREATE   PROC [dbo].[OrganizationTypes_Insert]
			
           @Name nvarchar(50) 
		   ,@Id int OUTPUT

	AS

	/* -------- TEST CODE --------
		Declare @Id int = 1;
	
		Declare @Name nvarchar(200) = 'Youth Development'

		Execute [dbo].[OrganizationTypes_Insert]
				@Name 
				,@Id

			Select *
			From [dbo].[OrganizationTypes]
			WHERE Id = @Id

	*/ -------------------------

		BEGIN
 
		INSERT INTO [dbo].[OrganizationTypes]
				   ([Name])
    
		VALUES
			   (@Name)
			   SET @Id = SCOPE_IDENTITY();

	END


GO
