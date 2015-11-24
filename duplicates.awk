BEGIN { FS = "\t" }

{
	count[$3]++;

	if (count[$3] == 1)
		first[$3] = $0;

	if (count[$3] == 2)
		print first[$3];

	if (count[$3] > 1)
		print
}
