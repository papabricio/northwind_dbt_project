with 
	source as (
			select
			/* primary key*/
			shipper_id,
			
			
			
			
			company_name,
			phone,

			
						
			
			--Stich columns
			_sdc_extracted_at as last_etl_run,
			_sdc_batched_at,
			_sdc_table_version,
			_sdc_received_at,
			_sdc_sequence
			
			from {{source('northwind_postgree','shippers')}})
			
select * from source


