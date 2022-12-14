USE [CnmPro]
GO
/****** Object:  StoredProcedure [dbo].[OrganizationTypes_SelectAll_Paginated]    Script Date: 8/17/2022 8:37:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Matt Prothero>
-- Create date: <20220705>
-- Description:	<Select All OrganizationTypes Paginated>
-- Code Reviewer:

-- MODIFIED BY: n/a
-- MODIFIED DATE: n/a
-- Code Reviewer: 
-- Note: 
-- =============================================

	CREATE PROC [dbo].[OrganizationTypes_SelectAll_Paginated] 
		@PageIndex int 
		,@PageSize int

	AS

	/*------Test Code------

	DECLARE  @PageIndex int = 0
			 ,@PageSize int = 2
		
	Execute [dbo].[OrganizationTypes_SelectAll_Paginated]
			@PageIndex 
			,@PageSize 

	*/---------------------

	BEGIN
		Declare @offset int = @PageIndex * @PageSize

	SELECT [Id]
		  ,[Name]

	  FROM [dbo].[OrganizationTypes]

	  ORDER BY Id

	  OFFSET @offSet Rows
	Fetch Next @PageSize Rows ONLY

	END


GO
