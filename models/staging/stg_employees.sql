with 
	source as (
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
			home_phone,
			
						
			
			--Stich columns
			_sdc_extracted_at as last_etl_run,
			_sdc_batched_at,
			_sdc_table_version,
			_sdc_received_at,
			_sdc_sequence
			
			from {{source('northwind_postgree','employees')}})
			
select * from source


