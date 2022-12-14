USE [CnmPro]
GO
/****** Object:  StoredProcedure [dbo].[Organizations_SelectById]    Script Date: 8/17/2022 8:32:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Matt Prothero>
-- Create date: <20220701>
-- Description:	<Select By Organization Id >
-- Code Reviewer: Morgan Frost

-- MODIFIED BY: n/a
-- MODIFIED DATE: n/a
-- Code Reviewer: 
-- Note: 
-- =============================================

	CREATE PROC [dbo].[Organizations_SelectById] 

	@Id int

	AS

	/*------Test Code------

	Declare @Id int = 2;
	
	Execute [dbo].[Organizations_SelectById] @Id


	Select *
	From [dbo].[Organizations]
	*/---------------------

	BEGIN

	SELECT	o.[Id] 
			,o.OrganizationTypeId
			,ot.Name as [OrganizationType]
			,o.[Name] as [OrganizationName]
			,o.[Headline]
			,o.[Description]
			,o.[Logo]
			,o.[LocationId] 
			,loct.[Id] as LocationTypeId
			,loct.[Name] as LocationType
			,loc.[LineOne]
			,loc.[LineTwo]
			,loc.[City]
			,loc.[Zip]
			,s.[Id] as StateId
			,s.[Name] as [State]
			,s.[Code]
			,loc.[Latitude] 
			,loc.[Longitude] 
			,o.[Phone]
			,o.[SiteUrl] as Website
			,o.[DateCreated]
			,o.[DateModified]
			,o.[CreatedBy]

			,TotalCount = COUNT(1) OVER()

	FROM		[dbo].[Organizations] as o 
			inner join [dbo].[OrganizationTypes] as ot
				on o.OrganizationTypeId = ot.Id
			inner join [dbo].[Locations] as loc				on o.LocationId = loc.Id
			inner join [dbo].States as s
				on loc.StateId = s.Id
			inner join [dbo].[LocationTypes] as loct
				on loct.Id = loc.LocationTypeId

	  WHERE o.Id = @Id

	END


GO
