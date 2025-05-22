declare @myOption as varchar(10) = 'Option B'

select case when  @myOption = 'Option A' then 'First Option' 
             when @myOption = 'Option B' then 'Second Option'
			 else 'No Option' END as MyOptions