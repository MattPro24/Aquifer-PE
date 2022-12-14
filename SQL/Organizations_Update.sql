USE [CnmPro]
GO
/****** Object:  StoredProcedure [dbo].[Organizations_Update]    Script Date: 8/17/2022 8:34:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Matt Prothero>
-- Create date: <20220705>
-- Description:	<Update an Organization >
-- Code Reviewer: Morgan Frost

-- MODIFIED BY: n/a
-- MODIFIED DATE: n/a 
-- Code Reviewer: 
-- Note: 
-- =============================================

	CREATE PROC [dbo].[Organizations_Update]
			@LocationTypeId int
			,@LineOne nvarchar(255)
			,@LineTwo nvarchar(255)
			,@City nvarchar(225)
			,@Zip nvarchar(50)
			,@StateId int
			,@Latitude float 
			,@Longitude float
		   
		   ,@OrganizationTypeId int 
           ,@Name nvarchar(200) 
           ,@Headline nvarchar(200) 
           ,@Description nvarchar(MAX) 
           ,@Logo nvarchar(255) 
		   ,@LocationId int
           ,@Phone nvarchar(50) 
           ,@SiteUrl nvarchar(255) 
		   ,@UserId int
		   ,@Id int
		    
		   

AS
/*------------------TEST CODE--------------------

	Declare			@Id int = 6

	Declare			@LocationTypeId int = '2'
					,@LineOne nvarchar(255) = 'SQL Test'
					,@LineTwo nvarchar(255) = 'SQL Test'
					,@City nvarchar(225) = 'Yuma'
					,@Zip nvarchar(50) = '85365'
					,@StateId int = '3'
					,@Latitude float = '423455'
					,@Longitude float = '432432'
	
				   ,@OrganizationTypeId int = 2
				   ,@Name nvarchar(200) = 'Final Test'
				   ,@Headline nvarchar(200) = 'Nikes Headline'
				   ,@Description nvarchar(MAX) = 'Nikes description'
				   ,@Logo nvarchar(255) = 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Logo_NIKE.svg/1200px-Logo_NIKE.svg.png'
				   ,@LocationId int = 3
				   ,@Phone nvarchar(50) = '928-269-8534'
				   ,@SiteUrl nvarchar(255) = 'website here'
				   ,@UserId int = '603'

	Execute	[dbo].[Organizations_Update] 

					@LocationTypeId
					,@LineOne 
					,@LineTwo 
					,@City 
					,@Zip
					,@StateId 
					,@Latitude  
					,@Longitude 

					,@OrganizationTypeId 
					,@Name 
					,@Headline 
					,@Description 
					,@Logo 
					,@LocationId
					,@Phone 
					,@SiteUrl 
					,@UserId 
					,@Id 
					

				Select *
				From [dbo].[Organizations]
				WHERE Id = @Id

*/------------------TEST CODE END----------------

BEGIN 

	UPDATE [dbo].[Organizations]

	   SET  [OrganizationTypeId] = @OrganizationTypeId
			,[Name] = @Name
			,[Headline] = @Headline
			,[Description] = @Description
			,[Logo] = @Logo
			,[LocationId] = @LocationId
			,[Phone] = @Phone
			,[SiteUrl] = @SiteUrl
			,[CreatedBy] = @UserId 
			

		WHERE Id = @Id
			
	UPDATE	[dbo].[Locations]

		SET	[LocationTypeId] = @LocationTypeId
			,[LineOne] = @LineOne
			,[LineTwo] = @LineTwo
			,[City] = @City
			,[Zip] = @Zip
			,[StateId] = @StateId
			,[Latitude] = @Latitude
			,[Longitude] = @Longitude
			,[CreatedBy] = @UserId 
			

	 WHERE Id = @LocationId
	
END


GO
