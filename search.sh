MONTHS=( 
	"agosto:2017-08-01,2017-08-31"
	"setembro:2017-09-01,2017-09-30"
	"outubro:2017-10-01,2017-10-31"
	"novembro:2017-11-01,2017-11-30"
	"dezembro:2017-12-01,2017-12-31"
	"janeiro:2018-01-01,2018-01-31"
	"fevereiro:2018-02-01,2018-02-28"
	"marco:2018-03-01,2018-03-31" 
)


if [ $# -eq 0 ]; then
    cards="cards"/*
else
	cards="cards/${1}.geojson"
fi

for card in $cards
do
	printf "\n${card}\n"
	for month in "${MONTHS[@]}" ; do
	    name="${month%%:*}"
	    dates="${month##*:}"
	    date_start="$(cut -d',' -f1 <<< ${dates})"
		date_end="$(cut -d',' -f2 <<< ${dates})"
		
		# content=$(planet data stats --item-type PSScene4Band --geom ${card} --date acquired gte $date_start --date acquired lte $date_end)
		# echo ${content} | underscore select '.buckets[0].count'
		content=$(planet data stats --item-type PSScene4Band --geom ${card} --date acquired gte $date_start --date acquired lte $date_end) 
		echo ${name} - ${content} #| cut -c66-69
	done
done