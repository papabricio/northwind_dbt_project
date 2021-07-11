with 
	selected as (
			select
			/* primary key*/
			supplier_id,
			
			
			
			contact_name,
			company_name,
			contact_title,
			country,
			region,
			city,
			address,
			postal_code,
			fax,
			phone,
			homepage,

			
			from {{ref('stg_suppliers')}}
			
	),
			
	transformed as (				
			select
				row_number() over (order by supplier_id) as sk_supplier,
				*
				from selected
				
				
				
	)
			
select * from transformed

