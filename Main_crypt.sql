Use Client

declare @sum int
declare @id int
declare @name varchar(max)

set @sum = 0


declare cursor_1 cursor for
select id from Employee

open cursor_1 

fetch next from cursor_1 into @id

while @@FETCH_STATUS = 0
	begin
		update Employee
		set first_name = (select dbo.RSA_crypt(first_name) from Employee where id = @id),
			last_name = (select dbo.RSA_crypt(last_name) from Employee where id = @id)
		where id = @id

		fetch next from cursor_1 into @id
	end 

close cursor_1
deallocate cursor_1


select * from Employee