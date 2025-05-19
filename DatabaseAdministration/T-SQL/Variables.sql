DECLARE  @myvar AS int = 2 --Intial value

SET @myvar = 3
SET @myvar = @myvar + 1  --You are simply adding the value to your declared value
SET @myvar = 2.9   ---It truncates simply taking an integer and leaving out numbers after that(after decimal points)

SELECT @myvar AS myVariable