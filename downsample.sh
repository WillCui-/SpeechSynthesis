for i in {100..593};
do
	sox recordings/arctic_a0$i.wav -b16 -r 16k wav/arctic_a0$i.wav
done
