with 
	selected as (
			select
			
			
			/* primary key*/
			customer_id,
			
			
			contact_name,
			contact_title,
			company_name,
			phone,
			fax,
			country
			region,
			city,
			address,
			postal_code,
			
			from {{ref('stg_customers')}}
			
	),
			
	transformed as (				
			select
				row_number() over (order by customer_id) as sk_customers,
				*
				from selected
				
				
				
	)
			
select * from transformed

