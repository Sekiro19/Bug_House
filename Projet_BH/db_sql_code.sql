--BACKUP DATABASE BH
--TO DISK = 'C:\M\Bug_House\Projet_BH\BH.bak';
CREATE DATABASE BH
USE BH
GO
CREATE TABLE Users(
	UserId INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	DisplayName NVARCHAR (40) NOT NULL UNIQUE,
	PassHash BINARY(64) NOT NULL,
	CreationDate DATETIME NOT NULL,
	AboutMe NVARCHAR(255),
	Reputation INT NOT NULL,
	ProfileImage VARBINARY(MAX) NOT NULL)
GO
CREATE TABLE Posts(
	PostId INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	PostTypeId TINYINT NOT NULL,
	ParentId INT NOT NULL,
	UserId INT NOT NULL,
	CreationDate DATETIME NOT NULL,
	ViewCount INT NOT NULL,
	UpVotesCount INT NOT NULL,
	DownVotesCount INT NOT NULL,
	AnswerCount INT NOT NULL,
	Title NVARCHAR(250),
	BODY VARBINARY(MAX) NOT NULL)
GO
CREATE TABLE PostType(
	PostTypeId TINYINT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Name VARCHAR (10) NOT NULL)
GO
CREATE TABLE Tags(
	TagId INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	TagName VARCHAR (15) NOT NULL,
	UserUseCount INT NOT NULL,
	PostUseCount INT NOT NULL
	)
GO
CREATE TABLE Users_Tags(
	TagId INT NOT NULL,
	UserId INT NOT NULL
	PRIMARY KEY(TagId, UserId))
GO
CREATE TABLE Posts_Tags(
	TagId INT NOT NULL,
	PostId INT NOT NULL
	PRIMARY KEY(TagId, PostId))
GO
CREATE TABLE Visit(
	UserId INT NOT NULL,
	PostId INT NOT NULL,
	UpVote INT NOT NULL,
	DownVote INT NOT NULL,
	PRIMARY KEY(UserId, PostId))
GO
CREATE TABLE Flags(
	UserId INT NOT NULL,
	PostId INT NOT NULL,
	FlagType VARCHAR(50) NOT NULL,
	PRIMARY KEY(UserId, PostId))
GO
------------------------------RELATIONS--------------------------------
-- FK_Posts_Users
ALTER TABLE Posts
ADD CONSTRAINT FK_Posts_Users FOREIGN KEY (UserId)
REFERENCES Users (UserId)
GO
-- FK_Posts_PostType
ALTER TABLE Posts
ADD CONSTRAINT FK_Posts_PostType FOREIGN KEY (PostTypeId)
REFERENCES PostType (PostTypeId)
GO
-- FK_Users_Tags_Users
ALTER TABLE Users_Tags
ADD CONSTRAINT FK_Users_Tags_Users FOREIGN KEY (UserId)
REFERENCES Users (UserId)
GO
-- FK_Users_Tags_Tags
ALTER TABLE Users_Tags
ADD CONSTRAINT FK_Users_Tags_Tags FOREIGN KEY (TagId)
REFERENCES Tags (TagId)
GO
-- FK_Posts_Tags_Users
ALTER TABLE Posts_Tags
ADD CONSTRAINT FK_Posts_Tags_Users FOREIGN KEY (PostId)
REFERENCES Posts (PostId)
GO
-- FK_Posts_Tags_Tags
ALTER TABLE Posts_Tags
ADD CONSTRAINT FK_Posts_Tags_Tags FOREIGN KEY (TagId)
REFERENCES Tags (TagId)
GO
--FK_Visit_Users
ALTER TABLE Visit
ADD CONSTRAINT FK_Visit_Users FOREIGN KEY (UserId)
REFERENCES Users (UserId)
GO
--FK_Visit_Posts
ALTER TABLE Visit
ADD CONSTRAINT FK_Visit_Posts FOREIGN KEY (PostId)
REFERENCES Posts (PostId)
GO
--FK_Flags_Posts
ALTER TABLE Flags
ADD CONSTRAINT FK_Flags_Posts FOREIGN KEY (PostId)
REFERENCES Posts (PostId)
GO
--FK_Flags_Users
ALTER TABLE Flags
ADD CONSTRAINT FK_Flags_Users FOREIGN KEY (UserId)
REFERENCES Users (UserId)
GO
------------------------------TableView----------------------------------------
ALTER VIEW View_Posts_Q
AS
	SELECT	Posts.Title, 
			Posts.AnswerCount, 
			COUNT(Visit.PostId) AS ViewCount,
			ISNULL((SUM(Visit.UpVote) + SUM(Visit.DownVote)), 0) AS Votes,
			T.Tags,
			Users.DisplayName,
			Posts.CreationDate,
			Users.Reputation, 
			Users.ProfileImage, 
			ISNULL(Posts.PostId, -1) AS PostId,
			Posts.BODY,
			Users.UserId
	FROM dbo.Posts JOIN dbo.Users ON Posts.UserId = Users.UserId
				FULL JOIN dbo.Visit ON Visit.PostId = Posts.PostId
				FULL JOIN (SELECT dbo.Posts_Tags.PostId, ISNULL(dbo.GROUP_CONCAT(dbo.Tags.TagName), '') AS Tags FROM dbo.Posts_Tags JOIN dbo.Tags ON dbo.Posts_Tags.TagId = dbo.Tags.TagId GROUP BY dbo.Posts_Tags.PostId) AS T ON Posts.PostId = T.PostId
	WHERE Posts.PostTypeId = 1
	GROUP BY Posts.Title, Posts.AnswerCount, Posts.CreationDate, 
				Users.Reputation, Users.DisplayName, T.Tags, 
				Users.ProfileImage, Posts.PostId,
				Posts.BODY, Users.UserId
GO
-----
ALTER VIEW View_UsersInfo
AS
	SELECT U.UserId, 
		   U.DisplayName, 
		   U.CreationDate,
		   U.AboutMe,
		   U.Reputation, 
		   U.ProfileImage,
		   ISNULL(P.Questions, 0) AS Questions, 
		   ISNULL(P.Answers, 0) AS Answers,
		   ISNULL(T.Tags, '') AS Tags,
		   ISNULL(V.ViewsCount, 0) AS ViewsCount,
		   ISNULL(V.UpVotesCount, 0) AS UpVotesCount,
		   ISNULL(V.DownVotesCount, 0) AS DownVotesCount
	FROM 
	(SELECT dbo.Users.UserId,
			dbo.Users.DisplayName, 
			dbo.Users.CreationDate, 
			dbo.Users.AboutMe,
			dbo.Users.Reputation,
			dbo.Users.ProfileImage
	FROM dbo.Users) AS U
	FULL JOIN 
	(SELECT  dbo.Posts.UserId,
			COUNT(IIF(dbo.Posts.PostTypeId = 1, 1, NULL)) AS Questions,
			COUNT(IIF(dbo.Posts.PostTypeId = 2, 1, NULL)) AS Answers
	FROM dbo.Posts JOIN dbo.Users ON dbo.Posts.UserId = dbo.Users.UserId
	GROUP BY dbo.Posts.UserId) AS P
	ON U.UserId = P.UserId
	FULL JOIN
	(SELECT dbo.Users_Tags.UserId, ISNULL(dbo.GROUP_CONCAT(dbo.Tags.TagName), '') AS Tags
	FROM dbo.Users_Tags JOIN dbo.Tags ON dbo.Users_Tags.TagId = dbo.Tags.TagId
	GROUP BY dbo.Users_Tags.UserId) AS T
	ON U.UserId = T.UserId
	FULL JOIN 
	(SELECT dbo.Posts.UserId, 				
			COUNT(dbo.Visit.PostId) AS ViewsCount,
			ISNULL(SUM(dbo.Visit.UpVote), 0) AS UpVotesCount, 
			ISNULL(SUM(dbo.Visit.DownVote), 0) AS DownVotesCount
	FROM dbo.Posts JOIN dbo.Visit ON dbo.Posts.PostId = dbo.Visit.PostId
	GROUP BY dbo.Posts.UserId) AS V
	ON U.UserId = V.UserId
GO
------------------------------Triggers-----------------------------------------
--------CHECK PostType AND Title when inserting
ALTER TRIGGER TR_CheckPostType_INSERT 
ON  Posts  
AFTER INSERT, UPDATE
AS  
BEGIN
	IF (SELECT PostTypeId FROM inserted) = 2
		BEGIN
			UPDATE Posts
			SET Title = NULL, AnswerCount = 0
			FROM Posts INNER JOIN inserted ON inserted.PostId = Posts.PostId
		END
	IF (SELECT PostTypeId FROM inserted) = 1
		BEGIN
			UPDATE Posts
			SET ParentId = -1
			FROM Posts INNER JOIN inserted ON inserted.PostId = Posts.PostId
		END
END  
GO
------------------------------Stored Procedures--------------------------------
--------def_checkUser
ALTER PROCEDURE def_checkUser (@DisplayName NVARCHAR(40), @Password VARCHAR(20))
AS 
DECLARE @UserId INT = NULL;
BEGIN
SET NOCOUNT ON;
	SET @UserId = (SELECT dbo.Users.UserId FROM dbo.Users WHERE dbo.Users.DisplayName = @DisplayName AND dbo.Users.PassHash = HASHBYTES('MD5', @Password))
	IF @UserId IS NOT NULL
		begin
			SELECT 1 AS Result, @UserId AS UserId;
			EXEC setReputation @UserId;
		end
	IF (SELECT UserId FROM Users WHERE DisplayName = @DisplayName) IS NULL
		SELECT 'DisplayName Incorrect' AS ErrorCatch;
	IF (SELECT UserId FROM Users WHERE DisplayName = @DisplayName) IS NOT NULL AND (SELECT UserId FROM Users WHERE DisplayName = @DisplayName AND PassHash = HASHBYTES('MD5', @Password)) IS NULL
		SELECT 'Password Incorrect' AS ErrorCatch;
END
GO
--------CATCH_ERROR
ALTER PROCEDURE CatchError
AS
BEGIN
SET NOCOUNT ON;
	SELECT
    ERROR_MESSAGE() AS ErrorMessage;
END
GO
----------------- CREATE USER ACCOUNT
ALTER PROCEDURE InsertUserData
	@DisplayName NVARCHAR(40),
	@Password NVARCHAR(20),
	@Tags NVARCHAR(100),
	@ProfileImageUrl NVARCHAR(100)
AS
DECLARE @SendIt NVARCHAR(1000);
DECLARE @is_error BIT = 0;
BEGIN
SET NOCOUNT ON;
	IF @DisplayName IS NULL
		BEGIN
			SELECT 'Enter your displayName' AS ErrorCatch
			SET @is_error = 1;
		END
	IF (LEN(@DisplayName) < 2 OR @DisplayName NOT LIKE '%[a-zA-Z]%')
		BEGIN
			SELECT 'DisplayName does not match regex format' AS ErrorCatch
			SET @is_error = 1;
		END
	ELSE
	IF (@Password NOT LIKE '%[a-zA-Z0-9]%' OR @Password LIKE '%[ §~!#$%^&*()+-={}\[\]:"|\;,./<>?'']%' ESCAPE '\' OR LEN(@Password) < 8)
		BEGIN
			SELECT 'Password does not match regex format' AS ErrorCatch
			SET @is_error = 1;
		END
	ELSE
		SET @SendIt = N'INSERT INTO dbo.Users (dbo.Users.DisplayName, dbo.Users.PassHash, dbo.Users.AboutMe, dbo.Users.CreationDate, dbo.Users.Reputation, dbo.Users.ProfileImage)
					SELECT +'''+@DisplayName+''', HASHBYTES(''MD5'', '''+@Password+'''), '''', getdate(), 5, * FROM OPENROWSET(BULK '''+@ProfileImageUrl+''', SINGLE_BLOB) AS img
					INSERT INTO dbo.Users_Tags (TagId, UserId)
					SELECT TagId, SCOPE_IDENTITY() FROM dbo.Tags WHERE TagName in (SELECT VALUE FROM  dbo.STRING_SPLIT('''+@Tags+''', '',''))
					UPDATE dbo.Tags SET UserUseCount = UserUseCount+1 WHERE TagName in (SELECT VALUE FROM  dbo.STRING_SPLIT('''+@Tags+''', '',''))' 
	BEGIN TRY
		EXEC sp_executesql @SendIt;
		
	END TRY
	BEGIN CATCH
		EXEC CatchError;
		SET @is_error = 1;
	END CATCH
	IF @is_error = 0
		SELECT 1 AS result, IDENT_CURRENT('dbo.Users') AS UserId
END
GO
----------------- UPDATE USER ACCOUNT
ALTER PROCEDURE UpdateUserData
	@UserId INT,
	@DisplayName NVARCHAR(40),
	@Password NVARCHAR(20),
	@AboutMe NVARCHAR(800),
	@Tags NVARCHAR(100),
	@ProfileImageUrl NVARCHAR(100)
AS
DECLARE @SendIt NVARCHAR(1000)
DECLARE @is_error BIT = 0
BEGIN
SET NOCOUNT ON;
	IF @DisplayName IS NULL OR @DisplayName = ''
		BEGIN
			SELECT 'Enter your displayName' AS ErrorCatch
			SET @is_error = 1;
		END
	ELSE
	IF (LEN(@DisplayName) < 2 OR @DisplayName NOT LIKE '%[a-zA-Z]%')
		BEGIN
			SELECT 'DisplayName does not match regex format' AS ErrorCatch
			SET @is_error = 1;
		END
	ELSE
	IF (@Password NOT LIKE '%[a-zA-Z0-9]%' OR @Password LIKE '%[ §~!#$%^&*()+-={}\[\]:"|\;,./<>?'']%' ESCAPE '\' OR LEN(@Password) < 8)
		BEGIN
			SELECT 'Password does not match regex format' AS ErrorCatch
			SET @is_error = 1;
		END
	ELSE
		SET @SendIt = N'UPDATE Users SET DisplayName = '''+@DisplayName+''', 
										 PassHash = HASHBYTES(''MD5'', '''+@Password+'''), 
										 AboutMe = '''+@AboutMe+''', 
										 ProfileImage = (SELECT * FROM OPENROWSET(BULK '''+@ProfileImageUrl+''', SINGLE_BLOB) AS img)
									 WHERE UserId = '+CAST(@UserId AS NVARCHAR(10))+';
					DELETE Users_Tags WHERE UserId = '+CAST(@UserId AS NVARCHAR(10))+'
					INSERT INTO Users_Tags (TagId, UserId)
					SELECT TagId, '+CAST(@UserId AS NVARCHAR(10))+' FROM Tags WHERE TagName in (SELECT VALUE FROM  dbo.STRING_SPLIT('''+@Tags+''', '',''))
					UPDATE Tags SET UserUseCount = UserUseCount+1 WHERE TagName in (SELECT VALUE FROM  dbo.STRING_SPLIT('''+@Tags+''', '','')) 
					UPDATE dbo.Posts_Q
					SET	dbo.Posts_Q.ProfileImage = (SELECT * FROM OPENROWSET(BULK '''+@ProfileImageUrl+''', SINGLE_BLOB) AS img),dbo.Posts_Q.DisplayName = '''+@DisplayName+'''
					WHERE dbo.Posts_Q.UserId = '+CAST(@UserId AS NVARCHAR(10))+';'
			
	BEGIN TRY
		EXEC sp_executesql @SendIt;
	END TRY
	BEGIN CATCH
		EXEC CatchError;
		SET @is_error = 1;
	END CATCH
	IF @is_error = 0
		SELECT 1 AS result
END
GO
----------------- INSERT POST Q/A
ALTER PROCEDURE InsertPostData
	@UserId INT,
	@PostTypeId TINYINT,
	@ParentId INT,
	@Title NVARCHAR(250),
	@BodyFileDir NVARCHAR(100),
	@Tags NVARCHAR(100) NULL
AS
DECLARE @SendIt NVARCHAR(MAX), @PostId INT
DECLARE @is_error BIT = 0
BEGIN
SET NOCOUNT ON;
	IF @UserId IS NULL
		BEGIN
			SELECT 'Error: UserName not found' AS ErrorCatch
			SET @is_error = 1;
		END
	ELSE
	IF (@PostTypeId = 1) AND (@Title IS NULL OR @Title = '') 
		BEGIN
			SELECT 'Must Fill Title' AS ErrorCatch
			SET @is_error = 1;
		END
	ELSE
	IF @BodyFileDir IS NULL OR @BodyFileDir = ''
		BEGIN
			SELECT 'Must Fill Body' AS ErrorCatch
			SET @is_error = 1;
		END
	IF @is_error = 0
		BEGIN
			SET @SendIt = N'INSERT INTO dbo.Posts (PostTypeId, ParentId, UserId, CreationDate, AnswerCount, Title, BODY)
							SELECT '''+CAST(@PostTypeId AS NVARCHAR(10))+''', '''+CAST(@ParentId AS NVARCHAR(10))+''', '''+CAST(@UserId AS NVARCHAR(10))+''', GETDATE(), 0, '''+@Title+''', * FROM OPENROWSET(BULK '''+@BodyFileDir+''', SINGLE_BLOB) AS body
							IF '''+CAST(@PostTypeId AS NVARCHAR(10))+''' = 1
								BEGIN
									INSERT INTO Posts_Tags (TagId, PostId)
									SELECT TagId, SCOPE_IDENTITY() FROM Tags WHERE TagName in (SELECT VALUE FROM  dbo.STRING_SPLIT('''+@Tags+''', '',''))
									UPDATE Tags SET PostUseCount = PostUseCount+1 WHERE TagName in (SELECT VALUE FROM  dbo.STRING_SPLIT('''+@Tags+''', '',''))
								END
							IF '''+CAST(@PostTypeId AS NVARCHAR(10))+''' = 2
								BEGIN
									UPDATE Posts
									SET Posts.AnswerCount += 1
									WHERE Posts.PostId = '''+CAST(@ParentId AS NVARCHAR(10))+'''
								END'
		
		END
	BEGIN TRY
		EXEC sp_executesql @SendIt;
		IF @PostTypeId = 1
			SET @PostId = IDENT_CURRENT('Posts')
		ELSE SET @PostId = @ParentId;
		EXEC Generate_Post_Q @PostId;
	END TRY
	BEGIN CATCH
		SET @is_error = 1;
		EXEC CatchError;
	END CATCH
	IF @is_error = 0
		SELECT 1 AS result
END
GO
ALTER PROCEDURE MassInsert_AdminOnly
	@UserId INT,
	@PostId INT,
	@PostTypeId TINYINT,
	@ParentId INT,
	@Title NVARCHAR(250),
	@BodyFileDir NVARCHAR(100),
	@Tags NVARCHAR(100) NULL
AS
DECLARE @SendIt NVARCHAR(1000)
DECLARE @is_error BIT = 0
BEGIN
SET NOCOUNT ON;
SET IDENTITY_INSERT Posts ON
	IF @UserId IS NULL
		BEGIN
			SELECT 'Error: UserName not found' AS ErrorCatch
			SET @is_error = 1;
		END
	ELSE
	IF (@PostTypeId = 1) AND (@Title IS NULL OR @Title = '') 
		BEGIN
			SELECT 'Must Fill Title' AS ErrorCatch
			SET @is_error = 1;
		END
	ELSE
	IF @BodyFileDir IS NULL OR @BodyFileDir = ''
		BEGIN
			SELECT 'Must Fill Body' AS ErrorCatch
			SET @is_error = 1;
		END
	IF @is_error = 0
		BEGIN
			IF @PostTypeId = 1
				SET @SendIt = N'
								INSERT INTO Posts (PostId, PostTypeId, ParentId, UserId, CreationDate, AnswerCount, Title, BODY)
								SELECT '''+CAST(@PostId AS NVARCHAR(10))+''', '''+CAST(@PostTypeId AS NVARCHAR(10))+''', '''+CAST(@ParentId AS NVARCHAR(10))+''', '''+CAST(@UserId AS NVARCHAR(10))+''', GETDATE(), 0, '''+@Title+''', * FROM OPENROWSET(BULK '''+@BodyFileDir+''', SINGLE_BLOB) AS body
								INSERT INTO Posts_Tags (TagId, PostId)
								SELECT TagId, SCOPE_IDENTITY() FROM Tags WHERE TagName in (SELECT VALUE FROM  dbo.STRING_SPLIT('''+@Tags+''', '',''))
								UPDATE Tags SET PostUseCount = PostUseCount+1 WHERE TagName in (SELECT VALUE FROM  dbo.STRING_SPLIT('''+@Tags+''', '',''))'
			IF @PostTypeId = 2
				SET @SendIt = N'
								INSERT INTO Posts (PostId, PostTypeId, ParentId, UserId, CreationDate, AnswerCount, Title, BODY)
								SELECT '''+CAST(@PostId AS NVARCHAR(10))+''', '''+CAST(@PostTypeId AS NVARCHAR(10))+''', '''+CAST(@ParentId AS NVARCHAR(10))+''', '''+CAST(@UserId AS NVARCHAR(10))+''', GETDATE(), 0, '''+@Title+''', * FROM OPENROWSET(BULK '''+@BodyFileDir+''', SINGLE_BLOB) AS body
								UPDATE Posts
								SET Posts.AnswerCount += 1
								WHERE Posts.PostId = '''+CAST(@ParentId AS NVARCHAR(10))+''''
		END
	BEGIN TRY
		EXEC sp_executesql @SendIt;
	END TRY
	BEGIN CATCH
		SET @is_error = 1;
		EXEC CatchError;
	END CATCH
	IF @is_error = 0
		SELECT 1 AS result
END
GO
----------------- UPDATE POST Q/A
ALTER PROCEDURE UpdatePostData
	@PostId INT,
	@Title NVARCHAR(250),
	@BodyFileDir NVARCHAR(100),
	@Tags NVARCHAR(100)
AS
DECLARE @SendIt NVARCHAR(1000)
DECLARE @is_error BIT = 0
BEGIN
SET NOCOUNT ON;
	IF (SELECT PostTypeId FROM Posts WHERE PostId = @PostId) = 2
		BEGIN
			SET @Tags = ''
			SET @Title = ''
		END
	ELSE
		IF (SELECT PostTypeId FROM Posts WHERE PostId = @PostId) = 1
				IF @Title IS NULL OR @Title = ''
					BEGIN
						SELECT 'Must Fill Title' AS ErrorCatch
						SET @is_error = 1;
					END
		IF @BodyFileDir IS NULL OR @BodyFileDir = ''
			BEGIN
				SELECT 'Must Fill Body' AS ErrorCatch
				SET @is_error = 1;
			END
	IF @is_error = 0
		BEGIN
			SET @SendIt = N'UPDATE dbo.Posts SET 
								dbo.Posts.Title = '''+@Title+''',
								dbo.Posts.BODY = (SELECT * FROM OPENROWSET(BULK '''+@BodyFileDir+''', SINGLE_BLOB) AS img)
							WHERE dbo.Posts.PostId = '+CAST(@PostId AS NVARCHAR(10))+';
							DELETE Posts_Tags WHERE PostId = '+CAST(@PostId AS NVARCHAR(10))+'
							INSERT INTO Posts_Tags (TagId, PostId)
							SELECT TagId, '+CAST(@PostId AS NVARCHAR(10))+' FROM Tags WHERE TagName in (SELECT VALUE FROM  dbo.STRING_SPLIT('''+@Tags+''', '',''))
							UPDATE dbo.Posts_Q SET 
								dbo.Posts_Q.Title = '''+@Title+''',
								dbo.Posts_Q.BODY = (SELECT * FROM OPENROWSET(BULK '''+@BodyFileDir+''', SINGLE_BLOB) AS img)
							WHERE dbo.Posts_Q.PostId = '+CAST(@PostId AS NVARCHAR(10))+';'
		END
	BEGIN TRY
		EXEC sp_executesql @SendIt;
	END TRY
	BEGIN CATCH
		SET @is_error = 1;
		EXEC CatchError;
	END CATCH
	IF @is_error = 0
		SELECT 1 AS result
END
GO
-----------------Delete Posts
ALTER PROCEDURE DeletePost(@PostId INT)
AS
SET NOCOUNT ON;
DECLARE @ParentId INT, @Acount INT, @Vcount INT
BEGIN
	(SELECT @Acount = dbo.Posts.AnswerCount, @Vcount = ISNULL((SUM(Visit.UpVote) + SUM(Visit.DownVote)), 0) FROM dbo.Posts FULL JOIN dbo.Visit ON Visit.PostId = Posts.PostId WHERE dbo.Posts.PostId = @PostId GROUP BY dbo.Posts.AnswerCount)
	IF (@Acount > 0) OR (@Vcount > 0)
	BEGIN
		UPDATE dbo.Posts
		SET dbo.Posts.UserId =  56
		WHERE dbo.Posts.PostId = @PostId;
		EXEC Generate_Post_Q @PostId;
		SELECT 1 AS Result
	END
	ELSE
		BEGIN
			IF (SELECT Posts.PostTypeId FROM dbo.Posts WHERE Posts.PostId = @PostId) = 1
				BEGIN
					DELETE dbo.Flags WHERE Flags.PostId = @PostId;
					DELETE dbo.Visit WHERE Visit.PostId = @PostId;
					DELETE dbo.Posts_Tags WHERE Posts_Tags.PostId = @PostId;
					DELETE dbo.Posts WHERE Posts.PostId = @PostId;
					DELETE dbo.Posts_Q WHERE Posts_Q.PostId = @PostId;
					SELECT 1 AS Result
				END
			ELSE
				BEGIN
					(SELECT @ParentId = Posts.ParentId FROM dbo.Posts WHERE Posts.PostId = @PostId)
					(SELECT @Acount = COUNT(*) 
									FROM dbo.Posts JOIN dbo.Users ON Posts.UserId = Users.UserId 
									FULL JOIN dbo.Visit ON Visit.PostId = Posts.PostId WHERE Posts.ParentId = @PostId)
					UPDATE Posts
					SET Posts.AnswerCount = @Acount
					WHERE Posts.PostId = @ParentId;
					UPDATE Posts_Q
					SET Posts_Q.AnswerCount = @Acount
					WHERE Posts_Q.PostId = @ParentId;
					DELETE dbo.Visit WHERE Visit.PostId = @PostId;
					DELETE dbo.Posts_Tags WHERE Posts_Tags.PostId = @PostId;
					DELETE dbo.Posts WHERE Posts.PostId = @PostId;
					SELECT 1 AS Result
				END
		END
END
GO
-----------------Delete User
ALTER PROCEDURE DeleteUser(@UserId INT)
AS
SET NOCOUNT ON;
DECLARE @PostId INT
BEGIN
	-- CHECK Post Value
	DECLARE PostsOwner_cursor CURSOR FOR 
		SELECT dbo.Posts.PostId FROM dbo.Posts LEFT JOIN dbo.Posts_Q ON dbo.Posts.PostId = dbo.Posts_Q.PostId WHERE dbo.Posts.UserId = @UserId
	OPEN PostsOwner_cursor
	FETCH NEXT FROM PostsOwner_cursor INTO @PostId
	WHILE @@FETCH_STATUS = 0
	BEGIN
		EXEC DeletePost @PostId
		FETCH NEXT FROM PostsOwner_cursor INTO @PostId
	END
	CLOSE PostsOwner_cursor
	DEALLOCATE PostsOwner_cursor
	-- drop user
	DELETE dbo.Flags WHERE dbo.Flags.UserId = @UserId;
	DELETE dbo.Visit WHERE dbo.Visit.UserId = @UserId;
	DELETE dbo.Users_Tags WHERE dbo.Users_Tags.UserId = @UserId;
	DELETE dbo.Users WHERE dbo.Users.UserId = @UserId;
END
GO
----------------- GetTags
ALTER PROCEDURE GetTags
AS
BEGIN
	SELECT dbo.GROUP_CONCAT(TagName) AS Tags FROM Tags
END
GO
----------------- GetUserPosts
ALTER PROCEDURE GetUserInfo(@UserId INT = NULL)
AS
SET NOCOUNT ON;
BEGIN
	IF @UserId IS NULL
		SELECT  dbo.View_UsersInfo.UserId,
				dbo.View_UsersInfo.DisplayName,
				dbo.View_UsersInfo.CreationDate,
				dbo.View_UsersInfo.AboutMe,
				dbo.View_UsersInfo.Reputation,
				dbo.View_UsersInfo.ProfileImage,
				dbo.View_UsersInfo.Questions,
				dbo.View_UsersInfo.Answers,
				dbo.View_UsersInfo.Tags,
				dbo.View_UsersInfo.ViewsCount,
				dbo.View_UsersInfo.UpVotesCount,
				dbo.View_UsersInfo.DownVotesCount FROM dbo.View_UsersInfo ORDER BY dbo.View_UsersInfo.Reputation DESC
	ELSE
	SELECT * FROM (
		SELECT  dbo.View_UsersInfo.UserId,
				dbo.View_UsersInfo.DisplayName,
				dbo.View_UsersInfo.CreationDate,
				dbo.View_UsersInfo.AboutMe,
				dbo.View_UsersInfo.Reputation,
				dbo.View_UsersInfo.ProfileImage,
				dbo.View_UsersInfo.Questions,
				dbo.View_UsersInfo.Answers,
				dbo.View_UsersInfo.Tags,
				dbo.View_UsersInfo.ViewsCount,
				dbo.View_UsersInfo.UpVotesCount,
				dbo.View_UsersInfo.DownVotesCount, RANK() OVER (ORDER BY dbo.View_UsersInfo.Reputation DESC) AS "Rank" FROM dbo.View_UsersInfo) AS t WHERE UserId = @UserId
END
GO
EXEC GetUserInfo 58
GO
----------------- showPostData
ALTER PROCEDURE showPostData(@UserId INT, @PostTypeId INT)
AS
BEGIN
	IF @PostTypeId = 1
		SELECT DISTINCT Top 100 Title, 
								AnswerCount, 
								ISNULL(SUM(Visit.UpVote), 0) AS UpVotesCount, 
								ISNULL(SUM(Visit.DownVote), 0) AS DownVotesCount, 
								COUNT(Visit.PostId) AS ViewCount, dbo.GROUP_CONCAT(TagName) AS TagName,
								Posts.PostId
		FROM Posts FULL JOIN Posts_Tags ON Posts.PostId = Posts_Tags.PostId 
				   FULL JOIN Tags ON Posts_Tags.TagId = Tags.TagId 
				   FULL JOIN dbo.Visit ON Visit.PostId = Posts.PostId
		WHERE Posts.UserId = @UserId AND PostTypeId = 1 
		GROUP BY Posts.PostId, Title, AnswerCount
	IF @PostTypeId = 2
		SELECT Top 100 Parent.Title AS [Question Asked], 
					   ISNULL(SUM(Visit.UpVote), 0) AS UpVotesCount, 
					   ISNULL(SUM(Visit.DownVote), 0) AS DownVotesCount,
					   Posts.PostId,
					   Posts.ParentId
		FROM Posts FULL JOIN (SELECT PostId, Title FROM Posts) AS Parent ON Posts.ParentId = Parent.PostId 
				   FULL JOIN dbo.Visit ON Visit.PostId = Posts.PostId
		WHERE Posts.UserId = @UserId AND PostTypeId = 2
		GROUP BY Posts.PostId, Parent.Title, Posts.AnswerCount, Posts.ParentId
END
GO
EXEC showPostData 58, 2
GO
----------------- showQA
ALTER PROCEDURE showQA(@PostId INT)
AS
BEGIN
	SELECT DISTINCT ISNULL(dbo.Posts.Title, '') AS Title,
					dbo.Posts.BODY, 
					ISNULL(dbo.GROUP_CONCAT(dbo.Tags.TagName), '') AS TagName
	FROM dbo.Posts FULL JOIN Posts_Tags ON Posts.PostId = Posts_Tags.PostId FULL JOIN Tags ON Posts_Tags.TagId = Tags.TagId 
	WHERE Posts.PostId = @PostId
	GROUP BY Posts.PostId, Title, BODY
END
GO
EXEC showQA 41449
GO
----------------- question count
ALTER PROCEDURE QCount
AS
	SELECT COUNT(*) AS QCount FROM dbo.Posts_Q
GO
----------------- NewVisiter
ALTER PROCEDURE NewVisit(@UserId INT, @PostId INT, @UpV SMALLINT=-1, @DownV SMALLINT=-1)
AS
DECLARE @Error BIT = 0;
SET NOCOUNT ON;
BEGIN
	BEGIN TRY
		-- if first time visiter	
		IF (SELECT COUNT(*) FROM dbo.Visit WHERE dbo.Visit.UserId = @UserId AND dbo.Visit.PostId = @PostId) = 0
			begin
				INSERT INTO dbo.Visit VALUES (@UserId, @PostId, 0, 0)
				UPDATE dbo.Posts_Q SET dbo.Posts_Q.ViewCount += 1 WHERE Posts_Q.PostId = @PostId
			end
		-- if he voted
		IF (@UpV != -1 OR @DownV != -1)
			begin
				-- if voted his post
				IF (SELECT UserId FROM Posts WHERE PostId = @PostId) = @UserId
					SET @Error = 1;
				ELSE
					BEGIN
						UPDATE dbo.Visit SET Visit.UpVote = @UpV, Visit.DownVote = @DownV
						WHERE dbo.Visit.UserId = @UserId AND dbo.Visit.PostId = @PostId
						UPDATE dbo.Posts_Q SET dbo.Posts_Q.Votes = (SELECT dbo.View_Posts_Q.Votes FROM dbo.View_Posts_Q WHERE dbo.View_Posts_Q.PostId = @PostId)
						WHERE dbo.Posts_Q.PostId = @PostId
					END
			end
	SELECT @Error
	END TRY 
	BEGIN CATCH
		EXEC CatchError;
	END CATCH
END
GO
EXEC NewVisit 58, 173, 1, 0
GO
----------------- set rep
ALTER PROCEDURE setReputation (@UserId INT)
AS
DECLARE @rep INT
SET NOCOUNT ON;
BEGIN
	SET @rep = (SELECT (ISNULL((SUM(Visit.UpVote) + SUM(Visit.DownVote)), 0) * 10) + 5 AS VoteCount
							FROM dbo.Users JOIN dbo.Posts ON dbo.Users.UserId = dbo.Posts.UserId 
										   JOIN dbo.Visit ON Visit.PostId = Posts.PostId
							WHERE dbo.Users.UserId = @UserId)
	UPDATE Users
	SET Reputation = @rep
	WHERE Users.UserId = @UserId
	UPDATE dbo.Posts_Q 
	SET dbo.Posts_Q.Reputation = @rep
	WHERE dbo.Posts_Q.UserId = @UserId
END
GO
----------------- showAllQuestions
ALTER PROCEDURE showAllQuestions(@OrderBy NVARCHAR(MAX) = 'Posts.CreationDate DESC',
									@TagsFilter NVARCHAR(MAX) = '', 
									@FetchFrom INT = 0, 
									@Filter NVARCHAR(MAX) = '', @GoToPost INT = -1)
AS 
DECLARE @SendIt NVARCHAR(MAX);
BEGIN
SET NOCOUNT ON;
	-------------
	IF @GoToPost > -1
		SET @SendIt = 'SELECT Posts.Title, 
									Posts.AnswerCount, 
									CONCAT(Posts.ViewCount, '' views'') AS ViewCount, 
									Posts.Votes,  
									Posts.Tags, 
									Posts.DisplayName,
									CONCAT(''asked '', FORMAT(Posts.CreationDate,N''d-MMM-yyyy hh:mm'')) AS PostCreationDate,
									Posts.Reputation, 
									Posts.ProfileImage, 
									Posts.PostId,
									Posts.UserId
							FROM dbo.Posts_Q AS Posts WHERE Posts.PostId = '+CAST(@GoToPost AS NVARCHAR)+''
	ELSE
		BEGIN
			IF @TagsFilter = ''
			BEGIN
				IF @Filter = ''
					SET @SendIt = 'SELECT Posts.Title, 
										Posts.AnswerCount, 
										CONCAT(Posts.ViewCount, '' views'') AS ViewCount, 
										Posts.Votes,  
										Posts.Tags, 
										Posts.DisplayName,
										CONCAT(''asked '', FORMAT(Posts.CreationDate,N''d-MMM-yyyy hh:mm'')) AS PostCreationDate,
										Posts.Reputation, 
										Posts.ProfileImage, 
										Posts.PostId,
										Posts.UserId
								FROM dbo.Posts_Q AS Posts
								ORDER BY '+@OrderBy+'
								 OFFSET '+CAST(@FetchFrom AS NVARCHAR)+' ROWS FETCH NEXT 100 ROWS ONLY'
				ELSE
					SET @SendIt = 'SELECT Posts.Title, 
									Posts.AnswerCount, 
									CONCAT(Posts.ViewCount, '' views'') AS ViewCount, 
									Posts.Votes,  
									Posts.Tags, 
									Posts.DisplayName,
									CONCAT(''asked '', FORMAT(Posts.CreationDate,N''d-MMM-yyyy hh:mm'')) AS PostCreationDate,
									Posts.Reputation, 
									Posts.ProfileImage, 
									Posts.PostId,
									Posts.UserId
							FROM dbo.Posts_Q AS Posts 
							WHERE CONTAINS(Posts.Title, N'''+@Filter+''')
							ORDER BY '+@OrderBy+'
							 OFFSET '+CAST(@FetchFrom AS NVARCHAR)+' ROWS FETCH NEXT 100 ROWS ONLY'
			END
		ELSE
			IF CHARINDEX(N' ', @TagsFilter) > 0
				BEGIN
					IF @Filter = ''
						SET @SendIt = 'SELECT Posts.Title, 
										Posts.AnswerCount, 
										CONCAT(Posts.ViewCount, '' views'') AS ViewCount, 
										Posts.Votes,  
										Posts.Tags, 
										Posts.DisplayName,
										CONCAT(''asked '', FORMAT(Posts.CreationDate,N''d-MMM-yyyy hh:mm'')) AS PostCreationDate,
										Posts.Reputation, 
										Posts.ProfileImage, 
										Posts.PostId,
										Posts.UserId
								FROM dbo.Posts_Q AS Posts
								WHERE CONTAINS(Posts.Tags, N'''+@TagsFilter+''')
								ORDER BY '+@OrderBy+'
								 OFFSET '+CAST(@FetchFrom AS NVARCHAR)+' ROWS FETCH NEXT 100 ROWS ONLY'
					ELSE
						SET @SendIt = 'SELECT Posts.Title, 
										Posts.AnswerCount, 
										CONCAT(Posts.ViewCount, '' views'') AS ViewCount, 
										Posts.Votes,  
										Posts.Tags, 
										Posts.DisplayName,
										CONCAT(''asked '', FORMAT(Posts.CreationDate,N''d-MMM-yyyy hh:mm'')) AS PostCreationDate,
										Posts.Reputation, 
										Posts.ProfileImage, 
										Posts.PostId,
										Posts.UserId
								FROM dbo.Posts_Q AS Posts
								WHERE CONTAINS(Posts.Tags, N'''+@TagsFilter+''') AND CONTAINS(Posts.Title, N'''+@Filter+''')
								ORDER BY '+@OrderBy+'
								 OFFSET '+CAST(@FetchFrom AS NVARCHAR)+' ROWS FETCH NEXT 100 ROWS ONLY'
				END
			ELSE
				BEGIN
					IF @Filter = ''
						SET @SendIt = 'SELECT Posts.Title, 
									Posts.AnswerCount, 
									CONCAT(Posts.ViewCount, '' views'') AS ViewCount, 
									Posts.Votes,  
									Posts.Tags, 
									Posts.DisplayName,
									CONCAT(''asked '', FORMAT(Posts.CreationDate,N''d-MMM-yyyy hh:mm'')) AS PostCreationDate,
									Posts.Reputation, 
									Posts.ProfileImage, 
									Posts.PostId,
									Posts.UserId
							FROM dbo.Posts_Q AS Posts
							WHERE Posts.Tags = N'''+@TagsFilter+'''
							ORDER BY '+@OrderBy+'
							 OFFSET '+CAST(@FetchFrom AS NVARCHAR)+' ROWS FETCH NEXT 100 ROWS ONLY'
					ELSE
						SET @SendIt = 'SELECT Posts.Title, 
									Posts.AnswerCount, 
									CONCAT(Posts.ViewCount, '' views'') AS ViewCount, 
									Posts.Votes,  
									Posts.Tags, 
									Posts.DisplayName,
									CONCAT(''asked '', FORMAT(Posts.CreationDate,N''d-MMM-yyyy hh:mm'')) AS PostCreationDate,
									Posts.Reputation, 
									Posts.ProfileImage, 
									Posts.PostId,
									Posts.UserId
							FROM dbo.Posts_Q AS Posts
							WHERE Posts.Tags = N'''+@TagsFilter+''' AND CONTAINS(Posts.Title, N'''+@Filter+''')
							ORDER BY '+@OrderBy+'
							 OFFSET '+CAST(@FetchFrom AS NVARCHAR)+' ROWS FETCH NEXT 100 ROWS ONLY'
				END
		END
		BEGIN TRY
			EXEC sp_executesql @SendIt
		END TRY
		BEGIN CATCH
			SELECT TOP 1	ERROR_MESSAGE() AS ErrorMessage,
							Posts.Title, 
							Posts.AnswerCount, 
							CONCAT(Posts.ViewCount, ' views') AS ViewCount, 
							Posts.Votes,  
							Posts.Tags, 
							Posts.DisplayName,
							CONCAT('asked ', FORMAT(Posts.CreationDate,N'd-MMM-yyyy hh:mm')) AS PostCreationDate,
							Posts.Reputation, 
							Posts.ProfileImage, 
							Posts.PostId,
							Posts.UserId
			FROM dbo.Posts_Q AS Posts
		END CATCH
	END
GO
EXEC showAllQuestions 'Posts.CreationDate DESC', '', 0, N'', -1
GO
----------------- generate Post_Q
ALTER PROCEDURE Generate_Post_Q(@PostId INT)
AS
BEGIN
	DELETE Posts_Q WHERE Posts_Q.PostId = @PostId
	INSERT INTO dbo.Posts_Q
	SELECT  dbo.View_Posts_Q.Title,
			dbo.View_Posts_Q.AnswerCount,
			dbo.View_Posts_Q.ViewCount,
			dbo.View_Posts_Q.Votes,
			dbo.View_Posts_Q.Tags,
			dbo.View_Posts_Q.DisplayName,
			dbo.View_Posts_Q.CreationDate,
			dbo.View_Posts_Q.Reputation,
			dbo.View_Posts_Q.ProfileImage,
			dbo.View_Posts_Q.PostId,
			dbo.View_Posts_Q.BODY, 
			dbo.View_Posts_Q.UserId 
			FROM dbo.View_Posts_Q  WHERE View_Posts_Q.PostId = @PostId;

	--ALTER TABLE dbo.Posts_Q Add FileExtension As '.html'
	--ALTER TABLE dbo.Posts_Q ADD CONSTRAINT PK_Posts_Q PRIMARY KEY (PostId);
	--CREATE FULLTEXT INDEX ON dbo.Posts_Q (Title LANGUAGE 1033, Tags LANGUAGE 1033, BODY TYPE COLUMN FileExtension)
	--	KEY INDEX PK_Posts_Q ON FT_Posts
	--	WITH CHANGE_TRACKING AUTO;
	-------droping noise words--------
	--sp_configure 'show advanced options', 1;
	--	RECONFIGURE;
	--	GO
	--	sp_configure 'transform noise words', 1;
	--	RECONFIGURE;
	--	GO
	--ALTER FULLTEXT INDEX ON dbo.Post_Q
	--   SET STOPLIST OFF;
	--GO
END
GO
----------------- CheckUserVisit
ALTER PROCEDURE CheckUserVisit(@UserId INT, @PostId INT)
AS
BEGIN
	SELECT * FROM dbo.Visit WHERE dbo.Visit.UserId = @UserId AND dbo.Visit.PostId = @PostId	
END
GO
----------------- GetPost_Answers
ALTER PROCEDURE GetPost_Answers(@PostId INT, @OrderBy NVARCHAR(MAX) = N'VoteCount DESC')
AS
DECLARE @SendIt NVARCHAR(MAX)
BEGIN
	SET @SendIt = N'SELECT  CONCAT(''Answered '', FORMAT(Posts.CreationDate,N''d-MMM-yyyy hh:mm''), '' by User: '', Users.DisplayName) AS Answers,
							ISNULL((SUM(Visit.UpVote) + SUM(Visit.DownVote)), 0) AS VoteCount,  
							Users.DisplayName,
							CONCAT(''answered '', FORMAT(Posts.CreationDate,N''d-MMM-yyyy hh:mm'')) AS PostCreationDate,
							Users.Reputation, 
							Users.ProfileImage, 
							Posts.PostId,
							Posts.BODY,
							Posts.UserId
					FROM dbo.Posts JOIN dbo.Users ON Posts.UserId = Users.UserId
							  FULL JOIN dbo.Visit ON Visit.PostId = Posts.PostId
					WHERE Posts.ParentId = '+CAST(@PostId AS NVARCHAR)+'
					GROUP BY Users.DisplayName, Posts.PostId, Users.Reputation, Users.ProfileImage, Posts.BODY, Posts.CreationDate, Posts.UserId
					ORDER BY '+@OrderBy+''
	EXEC sp_executesql @SendIt
END
GO
----------------- GetVotes
ALTER PROCEDURE GetVotes(@PostId INT)
AS 
begin
	SELECT ISNULL((SUM(dbo.Visit.UpVote) + SUM(dbo.Visit.DownVote)), 0) AS Votes 
	FROM dbo.Posts FULL JOIN dbo.Visit ON dbo.Visit.PostId = dbo.Posts.PostId
	WHERE dbo.Posts.PostId = @PostId
end
GO
----------------- GetUserPosts
ALTER PROCEDURE GetUserPosts(@UserId INT)
AS
SET NOCOUNT ON;
BEGIN
		SELECT TOP 100 ISNULL(Posts.Title, Parent.Title) AS Title,
						ISNULL((SUM(Visit.UpVote) + SUM(Visit.DownVote)), 0) AS Votes,
						ISNULL(dbo.GROUP_CONCAT(TagName), '') AS Tags,
						Posts.PostId, Posts.PostTypeId, Posts.ParentId
		FROM Posts FULL JOIN (SELECT PostId, Title FROM Posts) AS Parent ON Posts.ParentId = Parent.PostId 
				   FULL JOIN Posts_Tags ON Posts.PostId = Posts_Tags.PostId 
				   FULL JOIN Tags ON Posts_Tags.TagId = Tags.TagId 
				   FULL JOIN dbo.Visit ON Visit.PostId = Posts.PostId
		WHERE Posts.UserId = @UserId
		GROUP BY Posts.PostId, Posts.Title, Parent.Title, AnswerCount, Posts.PostTypeId, Posts.ParentId
		ORDER BY Votes DESC
END
GO
EXEC GetUserPosts 58
GO
----------------- FlagPost
ALTER PROCEDURE FlagPost(@UserId INT, @PostId INT, @FlagType VARCHAR(50))
AS 
begin 
	IF (SELECT COUNT(dbo.Flags.PostId) FROM dbo.Flags WHERE dbo.Flags.PostId = @PostId) > 25
		BEGIN
			EXEC DeletePost @PostId;
			DELETE dbo.Flags WHERE dbo.Flags.PostId = @PostId
		END
	ELSE
		BEGIN TRY
			INSERT INTO dbo.Flags VALUES (@UserId, @PostId, @FlagType);
			SELECT 1 AS Result;
		END TRY
		BEGIN CATCH
			EXEC CatchError;
		END CATCH
end
GO
------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM Visit
SELECT * FROM View_Posts_Q WHERE PostId = 69116811
SELECT * FROM Posts_Q WHERE PostId = 69116811
SELECT * FROM Posts WHERE PostId = 69116811
SELECT * FROM Posts_Tags WHERE PostId = 70294331
SELECT * FROM Users
SELECT * FROM Users_Tags
SELECT * FROM Tags
SELECT * FROM PostType
SELECT * FROM Flags
GO
EXEC InsertUserData 'ADMIN', '147895623', '', 'C:\M\Bug_House\app_main\img\dp_img\808a1df0839de4bacb9354497fa4b942.png'
EXEC UpdateUserData 
					    42, 
					   'Sekiro', 
					   '147895623', 
					   'official account !', 
					   'python,Sql-Server', 
					   'C:\M\Bug_House\app_main\img\dp_img\808a1df0839de4bacb9354497fa4b942.png'
EXEC InsertPostData 58, 1, -1, 'test', 'C:\M\Bug_House\app_main_delphi\doc\out.html', 'sql-server'
EXEC InsertPostData 58, 2, 70294331, '', 'C:\M\Bug_House\app_main_delphi\doc\out.html', ''
EXEC UpdatePostData 70294331, 'Get size of all tables in database ?', 'C:\M\Bug_House\app_main_delphi\doc\out.html', 'sql-server'
GO


