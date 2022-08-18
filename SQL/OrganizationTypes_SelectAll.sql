USE [CnmPro]
GO
/****** Object:  StoredProcedure [dbo].[OrganizationTypes_SelectAll]    Script Date: 8/17/2022 8:36:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Matt Prothero>
-- Create date: <20220705>
-- Description:	<Select All OrganizationTypes>
-- Code Reviewer:

-- MODIFIED BY: n/a
-- MODIFIED DATE: n/a
-- Code Reviewer: 
-- Note: 
-- =============================================

	CREATE PROC [dbo].[OrganizationTypes_SelectAll] 

	AS

	/*------Test Code------
		
	Execute [dbo].[OrganizationTypes_SelectAll]


	*/---------------------

	BEGIN


	SELECT [Id]
		  ,[Name]

	  FROM [dbo].[OrganizationTypes]

	END


GO
