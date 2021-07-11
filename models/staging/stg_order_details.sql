with 
	source as (
			select
			/* primary key*/
			order_id,
			--Foreign key
			product_id,
			
			
			unit_price,
			quantity,
			discount,
			
			
			--Stich columns
			_sdc_extracted_at as last_etl_run,
			_sdc_batched_at,
			_sdc_table_version,
			_sdc_received_at,
			_sdc_sequence
			
			from {{source('northwind_postgree','order_details')}})
			
select * from source

