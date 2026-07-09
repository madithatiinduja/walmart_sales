TYPE=VIEW
query=select `s`.`store_id` AS `store_id`,`st`.`location` AS `location`,date_format(`s`.`sale_date`,\'%Y-%m\') AS `sales_month`,sum(`s`.`weekly_sales`) AS `total_monthly_sales` from (`walmart_sales_db`.`sales` `s` join `walmart_sales_db`.`stores` `st` on(`s`.`store_id` = `st`.`store_id`)) group by `s`.`store_id`,`st`.`location`,date_format(`s`.`sale_date`,\'%Y-%m\') order by `s`.`store_id`,date_format(`s`.`sale_date`,\'%Y-%m\')
md5=c10cb7e603799ab0f0bc7bf46854fd71
updatable=0
algorithm=0
definer_user=root
definer_host=localhost
suid=2
with_check_option=0
timestamp=0001753966664559127
create-version=2
source=SELECT\n    s.store_id,\n    st.location,\n    DATE_FORMAT(s.sale_date, \'%Y-%m\') AS sales_month,\n    SUM(s.weekly_sales) AS total_monthly_sales\nFROM\n    Sales s\nJOIN\n    Stores st ON s.store_id = st.store_id\nGROUP BY\n    s.store_id, st.location, sales_month\nORDER BY\n    s.store_id, sales_month
client_cs_name=utf8mb4
connection_cl_name=utf8mb4_unicode_ci
view_body_utf8=select `s`.`store_id` AS `store_id`,`st`.`location` AS `location`,date_format(`s`.`sale_date`,\'%Y-%m\') AS `sales_month`,sum(`s`.`weekly_sales`) AS `total_monthly_sales` from (`walmart_sales_db`.`sales` `s` join `walmart_sales_db`.`stores` `st` on(`s`.`store_id` = `st`.`store_id`)) group by `s`.`store_id`,`st`.`location`,date_format(`s`.`sale_date`,\'%Y-%m\') order by `s`.`store_id`,date_format(`s`.`sale_date`,\'%Y-%m\')
mariadb-version=100432
