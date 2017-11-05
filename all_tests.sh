rm tests.out
for x in bulletserver gameserver keyval lobbyserver playerserver;
do
	cd $x
	echo "######### Testing $x ########" >> ../tests.out
	mix test >> ../tests.out
	cd ..
done
