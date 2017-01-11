Use Client

if OBJECT_ID (N'dbo.RSA_crypt', N'FN') IS NOT NULL  
    drop function RSA_crypt; 

go

create function RSA_crypt(@string varchar(max))
returns varchar(max)

as
begin
	declare @e int
	declare @n int
	declare @d int
	
	declare @code varchar(max)
	declare @letter char
	declare @i int
	declare @length int
	
/*  задаем ключи  */	
	set @e = dbo.keygen_e(37,7)
	set @d = dbo.keygen_d(37,7,@e)
	set @n = 37 * 7

/*  кодируем посимвольно слово  */
	set @i = 1
	set @length = len(@string)
	
	while @i <= @length
		begin
			set @letter = substring(@string, @i, 1)
			if @code is null
			begin
				set @code = char(dbo.ModPow(ASCII(@letter),@e,@n))
			end
				else
			begin
				set @code = @code + char(dbo.ModPow(ASCII(@letter),@e,@n))
			end
						
			set @i = @i + 1
		end
			
	return @code
end

go

declare @e int
declare @n int
declare @d int
set @e = dbo.keygen_e(37,7)
set @d = dbo.keygen_d(37,7,@e)
set @n = 37 * 7
declare @value varchar(max) 
seT @value = (select first_name from Employee where id = 1)
print @value

select dbo.RSA_crypt(@value)