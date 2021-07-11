with 
	source as (
			select
			/* primary key*/
			order_id,
			--Foreign key
			employee_id,
			customer_id,
			
			order_date ,
			ship_country,
			ship_region,
			ship_name,
			ship_city,
			ship_via as ship_id,
			ship_address,
			ship_postal_code,
			shipped_date ,
			freight,
			required_date ,
			
			
			--Stich columns
			_sdc_extracted_at as last_etl_run,
			_sdc_batched_at,
			_sdc_table_version,
			_sdc_received_at,
			_sdc_sequence
			
			from {{source('northwind_postgree','orders')}})
			
select * from source

