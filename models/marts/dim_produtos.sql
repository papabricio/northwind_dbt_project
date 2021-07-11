with 
	selected as (
			select
			/* primary key*/
			product_id,
			--Foreign key
			category_id,
			supplier_id,
			
			unit_price,
			quantity_per_unit,
			product_name,
			units_in_stock,
			units_on_order,
			is_discontinued,
			reorder_level,

			
			from {{ref('stg_products')}}
			
	),
			
	transformed as (				
			select
				row_number() over (order by product_id) as sk_product,
				*
				from selected
				
				
				
	)
			
select * from transformed

