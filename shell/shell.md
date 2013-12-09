###array push
ARRAY=()
ARRAY+=('foo')
ARRAY+=('bar')

###number range
for i in {0..10}; do; echo $i; done;
for i in `seq 10`; do; echo $i; done;

###EOF
cat <<EOF!!
echo 1
EOF!!
ls
