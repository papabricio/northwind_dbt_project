with 
	source as (
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
			case
				when discontinued = 1 then TRUE
				else FALSE
			end as is_discontinued,
			reorder_level,
			
			--Stich columns
			_sdc_extracted_at as last_etl_run,
			_sdc_batched_at,
			_sdc_table_version,
			_sdc_received_at,
			_sdc_sequence
			
			from {{source('northwind_postgree','products')}})
			
select * from source

