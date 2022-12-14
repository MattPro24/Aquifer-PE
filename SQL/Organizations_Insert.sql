USE [CnmPro]
GO
/****** Object:  StoredProcedure [dbo].[Organizations_Insert]    Script Date: 8/17/2022 8:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Matt Prothero>
-- Create date: <20220701>
-- Description:	<Insert an Organization >
-- Code Reviewer: Morgan Frost

-- MODIFIED BY: n/a
-- MODIFIED DATE: n/a
-- Code Reviewer: 
-- Note: 
-- =============================================

	CREATE   PROC [dbo].[Organizations_Insert]
		   
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
           ,@Phone nvarchar(50) 
           ,@SiteUrl nvarchar(255) 
		   ,@UserId int
		   ,@Id int OUTPUT
		

	AS
	
	/* -------- TEST CODE --------
		Declare		@Id int = 0;
	
		Declare		
					@LocationTypeId int = '3'
					,@LineOne nvarchar(255) = 'Insert test'
					,@LineTwo nvarchar(255) = 'SQL Test'
					,@City nvarchar(225) = 'Yuma'
					,@Zip nvarchar(50) = '85365'
					,@StateId int = '3'
					,@Latitude float = '423455'
					,@Longitude float = '432432'

					,@OrganizationTypeId int = 6
					,@Name nvarchar(200) = 'Test 7'
					,@Headline nvarchar(200) = 'Headline'
					,@Description nvarchar(MAX) = 'Description, this is a really good description for a fake organization.'
					,@Logo nvarchar(255) = 'NH Logo'
					,@Phone nvarchar(50) = 'NH 1800TESTCODE'
					,@SiteUrl nvarchar(255) = 'www.NH.com'
					,@UserId int = '2'

		Execute		[dbo].[Organizations_Insert]
					

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
					,@Phone 
					,@SiteUrl 
					,@UserId
					,@Id OUTPUT
					

			Select *
			From [dbo].[Organizations]
			WHERE Id = @Id

	*/ -------------------------

	BEGIN

	DECLARE	 @LocationId int 

	INSERT INTO		[dbo].[Locations] (
					LocationTypeId,
					LineOne,
					LineTwo,
					City,
					Zip
					,StateId
					,Latitude
					,Longitude
					,CreatedBy
					,ModifiedBy
					)
		VALUES			(@LocationTypeId
					,@LineOne 
					,@LineTwo
					,@City 
					,@Zip 
					,@StateId 
					,@Latitude 
					,@Longitude 
					,@UserId
					,@UserId 
					)
 
		 SET @LocationId = SCOPE_IDENTITY();
	INSERT INTO		[dbo].[Organizations]
					([OrganizationTypeId]
					,[Name]
					,[Headline]
					,[Description]
					,[Logo]
					,[LocationId]
					,[Phone]
					,[SiteUrl]
					,[CreatedBy])
    
		VALUES
					(@OrganizationTypeId
					,@Name
					,@Headline
					,@Description
					,@Logo
					,@LocationId
					,@Phone
					,@SiteUrl
					,@UserId)

			   SET @Id = SCOPE_IDENTITY();
	END


GO
