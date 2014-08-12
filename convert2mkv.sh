#!/bin/sh
#
#
export MALLOC_CHECK_=0

quality=6
audiobitrate=128000

ffmpeg=$HOME/Entwicklung/ffmpeg/ffmpeg

for i in $@
do
  cd $i
  if [ -e "ger.mp2" ]; then 
	ger="ger.mp2"
  else 
	ger="001.mp2"
  fi
  if [ -e "eng.mp2" ]; then 
	eng="eng.mp2"
  else 
	eng="001-02.mp2"
  fi
  videoname=`perl -e 'my $lpw = $ARGV[0]; $lpw =~ s/\/$//; $lpw =~ /.*\/(.*)$/; print $1' $i`
  echo "Starting $i @ `date`" | tee -a $videoname.log
  $ffmpeg -i 001.m2v -i $ger -i $eng -f matroska -vcodec libxvid -vlang ger -qscale $quality -acodec libmp3lame -ab $audiobitrate -alang ger $videoname.mkv -acodec libmp3lame -ab $audiobitrate -alang eng -newaudio | tee -a $videoname.log
  mv 001.ac3 $videoname.ac3 
  echo "End of $i @ `date`" | tee -a $videoname.log
  echo "$videoname">>/daten/filmdb.txt  
done

