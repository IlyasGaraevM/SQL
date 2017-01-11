Use Client


if OBJECT_ID (N'dbo.gcd', N'FN') IS NOT NULL  
    drop function gcd;  


go

create function gcd(@a int, @b int)
returns int

as
begin
	declare @c int
	set @c = 0
	while @b <> 0
		begin
			set @c = @a % @b
			set @a = @b
			set @b = @c
		end
	if @a < 0
		begin
			return -@a
		end
	return @a
end