# Show table info

`\d+ table_name;`

# Get table size

`select pg_size_pretty(pg_total_relation_size('table_name'));`
