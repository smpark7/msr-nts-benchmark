for ((inner = 1; inner<=3; inner++))
do
  for ((outer=1; outer<=3;outer++))
  do
    sides=$(($inner + $outer))
    echo $sides
    apple="test${inner}"
    echo $apple
  done
done
