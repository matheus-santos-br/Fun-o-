CREATE PROCEDURE [JUST A SELECT](@LETTER VARCHAR(MAX))
AS

	SET @LETTER = @LETTER
	
	SELECT NAME = AA.FirstName + ' ' + AA.LastName,
		PHONE_NUMBER = CAST(BB.PhoneNumber AS varchar(MAX)) + 
		'-' + (SELECT TOP 1 CC.Name FROM Person.PhoneNumberType CC WHERE BB.PhoneNumberTypeID = CC.PhoneNumberTypeID),
		EMAIL_ADDRESS =  DD.EmailAddress,
		PASSWORD = EE.PasswordSalt
	FROM PERSON.Person AA,
		 PERSON.PersonPhone BB,
		 Person.EmailAddress DD,
		 Person.Password EE
WHERE
		AA.BusinessEntityID = BB.BusinessEntityID
		AND AA.BusinessEntityID = DD.BusinessEntityID
		AND AA.BusinessEntityID = EE.BusinessEntityID
		AND AA.FirstName LIKE +@LETTER+'%'


EXEC [JUST A SELECT] 'M'

ALTER PROCEDURE TT(@NUMBER INT)
AS
	SET @NUMBER = @NUMBER

	WHILE @NUMBER <= '16' BEGIN
		
		IF @NUMBER % 2 = 0 BEGIN
			SELECT @NUMBER
		END
		ELSE BEGIN
			SELECT 'Not even!'
		END
		SET @NUMBER += 1
	END

	EXEC TT '0'

	