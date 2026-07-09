TYPE=VIEW
query=select `d`.`dept_name` AS `dept_name`,sum(`s`.`weekly_sales`) AS `total_sales` from (`walmart_sales_db`.`sales` `s` join `walmart_sales_db`.`departments` `d` on(`s`.`dept_id` = `d`.`dept_id`)) group by `d`.`dept_name` order by sum(`s`.`weekly_sales`) desc limit 3
md5=027e69372121838b95615d33abadac58
updatable=0
algorithm=0
definer_user=root
definer_host=localhost
suid=2
with_check_option=0
timestamp=0001753966676838405
create-version=2
source=SELECT\n    d.dept_name,\n    SUM(s.weekly_sales) AS total_sales\nFROM\n    Sales s\nJOIN\n    Departments d ON s.dept_id = d.dept_id\nGROUP BY\n    d.dept_name\nORDER BY\n    total_sales DESC\nLIMIT 3
client_cs_name=utf8mb4
connection_cl_name=utf8mb4_unicode_ci
view_body_utf8=select `d`.`dept_name` AS `dept_name`,sum(`s`.`weekly_sales`) AS `total_sales` from (`walmart_sales_db`.`sales` `s` join `walmart_sales_db`.`departments` `d` on(`s`.`dept_id` = `d`.`dept_id`)) group by `d`.`dept_name` order by sum(`s`.`weekly_sales`) desc limit 3
mariadb-version=100432
