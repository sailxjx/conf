###Operaters:
* `||=` b||=1, b不存在时设置b为1
* `<=>` 1<=>0=1, 1<=>1=0, 1<=>2=-1
* `===` (1..10) === 5 is true, 5 lies in range 1 to 10

###Procs: 
```
group_1 = [4.1, 5.5, 3.2, 3.3, 6.1, 3.9, 4.7]
group_2 = [7.0, 3.8, 6.2, 6.1, 4.4, 4.9, 3.0]
group_3 = [5.5, 5.1, 3.9, 4.3, 4.9, 3.2, 3.2]

over_4_feet = Proc.new do |height|
    height >= 4
end 

can_ride_1 = group_1.select(&over_4_feet)
can_ride_2 = group_2.select(&over_4_feet)
can_ride_3 = group_3.select(&over_4_feet) #这里select和()之间不能有空格
```