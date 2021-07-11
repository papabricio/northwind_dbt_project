with 
	selected as (
			select
			
			
			/* primary key*/
			shipper_id as id_transportador,
			
			--data columns
			company_name as nome_da_empresa,
			phone as fone
			
			from {{ref('stg_shippers')}}
			
	),
			
	transformed as (				
			select
				row_number() over (order by id_transportador) as sk_transportador,
				*
				from selected
				
				
				
	)
			
select * from transformed

