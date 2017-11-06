rm tests.out
for x in `find . -maxdepth 1 -execdir -type d`;
do
	cd $x
	echo "######## Testing $x ########" >> ../tests.out
	mix test >> ../tests.out
	cd ..
done
