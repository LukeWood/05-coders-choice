for x in bulletserver gameserver keyval lobbyserver playerserver;
do
	cd $x
	mix test >> ../tests.out
	cd ..
done
