TYPE=VIEW
query=select case when `walmart_sales_db`.`sales`.`holiday_flag` = 1 then \'Holiday Sales\' else \'Non-Holiday Sales\' end AS `sales_type`,sum(`walmart_sales_db`.`sales`.`weekly_sales`) AS `total_sales` from `walmart_sales_db`.`sales` group by case when `walmart_sales_db`.`sales`.`holiday_flag` = 1 then \'Holiday Sales\' else \'Non-Holiday Sales\' end
md5=48c74951b5f135d8494ea2e3b7f436d9
updatable=0
algorithm=0
definer_user=root
definer_host=localhost
suid=2
with_check_option=0
timestamp=0001753966957080618
create-version=2
source=SELECT\n    CASE\n        WHEN holiday_flag = TRUE THEN \'Holiday Sales\'\n        ELSE \'Non-Holiday Sales\'\n    END AS sales_type,\n    SUM(weekly_sales) AS total_sales\nFROM\n    Sales\nGROUP BY\n    sales_type
client_cs_name=utf8mb4
connection_cl_name=utf8mb4_unicode_ci
view_body_utf8=select case when `walmart_sales_db`.`sales`.`holiday_flag` = 1 then \'Holiday Sales\' else \'Non-Holiday Sales\' end AS `sales_type`,sum(`walmart_sales_db`.`sales`.`weekly_sales`) AS `total_sales` from `walmart_sales_db`.`sales` group by case when `walmart_sales_db`.`sales`.`holiday_flag` = 1 then \'Holiday Sales\' else \'Non-Holiday Sales\' end
mariadb-version=100432
