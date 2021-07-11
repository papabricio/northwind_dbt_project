with 
	source as (
			select
			/* primary key*/
			customer_id,
			
			
			contact_name,
			contact_title,
			company_name,
			phone,
			fax,
			country,
			region,
			city,
			address,
			postal_code,
						
			
			--Stich columns
			_sdc_extracted_at as last_etl_run,
			_sdc_batched_at,
			_sdc_table_version,
			_sdc_received_at,
			_sdc_sequence
			
			from {{source('northwind_postgree','customers')}})
			
select * from source


