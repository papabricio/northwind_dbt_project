with 
	source as (
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

			
						
			
			--Stich columns
			_sdc_extracted_at as last_etl_run,
			_sdc_batched_at,
			_sdc_table_version,
			_sdc_received_at,
			_sdc_sequence
			
			from {{source('northwind_postgree','suppliers')}})
			
select * from source


