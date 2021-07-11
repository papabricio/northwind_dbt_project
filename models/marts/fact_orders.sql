with 
	customers as(
		select * from {{ref('dim_clientes')}}
	),
	
	employees as (
		select * from {{ref('dim_funcionarios')}}
	),
	
	suppliers as (
		select * from {{ref('dim_fornecedor')}}
	),
	
	shippers as (
		select * from {{(ref('dim_transportadores'))}}
	),
	
	products as (
		select * from {{ref('dim_produtos')}}
	),
	
	orders_with_sk as (
		select
			/* primary key*/
			order_id,
			--Foreign key
			employees.sk_employee as employee_fk,
			customers.sk_customers as customers_fk,
			shippers.sk_transportador as shipper_fk,
			order_date ,
			ship_country,
			ship_region,
			ship_name,
			ship_city,
			ship_address,
			ship_postal_code,
			shipped_date ,
			freight,
			required_date
		from {{ref('stg_orders')}} as orders
		left join employees on orders.employee_id = employees.employee_id
		left join customers on orders.customer_id = customers.customer_id
		left join shippers on orders.ship_id = shippers.id_transportador
		
	),
	
	prod_with_suppliers as (
		select products.product_id, suppliers.*  from suppliers
		left join products on suppliers.supplier_id = products.supplier_id
	),
	
	order_detail_with_sk as (
		select
			/* primary key*/
			order_detail.order_id,
			products.sk_product as product_fk,
			order_detail.unit_price,
			order_detail.quantity,
			order_detail.discount,
			prod_with_suppliers.sk_supplier as supplier_fk
		from {{ref('stg_order_details')}} as order_detail
		left join products on order_detail.product_id =  products.product_id
		left join prod_with_suppliers on order_detail.product_id = prod_with_suppliers.product_id
		
	),
	
	final as (
		select
			
			order_detail_with_sk.order_id,
			orders_with_sk.employee_fk,
			orders_with_sk.customers_fk,
			orders_with_sk.shipper_fk,
			order_detail_with_sk.product_fk,
			order_detail_with_sk.supplier_fk,
			orders_with_sk.order_date ,
			orders_with_sk.ship_country,
			orders_with_sk.ship_region,
			orders_with_sk.ship_name,
			orders_with_sk.ship_city,
			orders_with_sk.ship_address,
			orders_with_sk.ship_postal_code,
			orders_with_sk.shipped_date ,
			orders_with_sk.freight,
			orders_with_sk.required_date,
			order_detail_with_sk.unit_price,
			order_detail_with_sk.quantity,
			order_detail_with_sk.discount,
		from orders_with_sk
		left join order_detail_with_sk
			on orders_with_sk.order_id = order_detail_with_sk.order_id
	)
	
select * from final