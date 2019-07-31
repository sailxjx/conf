# Interval / Time delta to number

`SELECT EXTRACT(epoch FROM my_interval)/3600`

# Int to datetime

https://stackoverflow.com/questions/39815425/how-to-convert-epoch-to-datetime-redshift
`select timestamp 'epoch' + your_timestamp_column * interval '1 second' AS your_column_alias`

