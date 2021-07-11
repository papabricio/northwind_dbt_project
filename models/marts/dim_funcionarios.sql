with 
	selected as (
			select
			/* primary key*/
			employee_id,
			
			
			
			first_name,
			last_name,
			title,
			title_of_courtesy,
			reports_to,
			country,
			region,
			city,
			address,
			postal_code,
			hire_date,
			birth_date,
			extension,
			notes,
			photo_path,
			home_phone
			
			from {{ref('stg_employees')}}
			
	),
			
	transformed as (				
			select
				row_number() over (order by employee_id) as sk_employee,
				*
				from selected
				
				
				
	)
			
select * from transformed

