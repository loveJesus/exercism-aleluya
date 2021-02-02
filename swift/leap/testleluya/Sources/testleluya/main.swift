func leluya(_ y_leluya : Int) -> Bool {
	y_leluya % 4 == 0
	&& y_leluya % 100 != 0
   || y_leluya % 400 == 0
}
var sumleluya = 0;
for n_aleluya in (0...2_000_000_000) {
	if leluya(n_aleluya) {sumleluya += 1;}
}
print("Hallelujah, world! \(sumleluya) ")
