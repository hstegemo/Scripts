#!/usr/bin/bash

meta_dir='./.metafolder'
backupfile="./rMbackup`date +%F`.tar.gz"
logfile="/home/root/backups/tarbackup.log"
tarscript="tarscript"

#remarkable_dir='/home/root/.local/share/remarkable/xochitl'
remarkable_dir='/home/root/.local/share/remarkable/xochitl'

#empty tarscript
rm $tarscript
backupfile="rMbackup`date +%F`.tar.gz"
echo "tar -czf $backupfile \\" > $tarscript


for _x in `ls $remarkable_dir|grep 'metadata'`
do
    lastModified=`grep 'lastModified' "$remarkable_dir/$_x" |sed 's/.*Modified.: .//'|sed 's/\",//'`
    lastBackedUp=`grep 'lastModified' "$meta_dir/$_x" |sed 's/.*Modified.: .//'|sed 's/\",//'`

    if [ "$lastBackedUp" == "" ]; then
        lastBackedUp=0
    fi
    
    #echo "lastModified= $lastModified"
    #echo "lastBackedUp = '$lastBackedUp'"
            
    x=`echo "$_x"|sed "s/$meta_dir.//"` # removes the path from the file name
    # legg til sjekk for å se om det er en ny fil
    x=$_x
    file_exist_in_backup=`ls $meta_dir|grep $x`   # sjekker om backup file eksister
    
    # add file if it doesn't exist in backup
    if [ "$file_exist_in_backup" != "$x" ]; then
        cp "$remarkable_dir/$x" "$meta_dir\/"
        postfix=`echo $x|sed 's/.metadata//'`
        # copy files to backup dir (this folder has to be uploaded to server)
        echo "$remarkable_dir/$postfix* \\" >> $tarscript
        rm "$meta_dir/$postfix.metadata"
        cp "$remarkable_dir/$postfix.metadata" "$meta_dir/"
        # add new metafile for new file to metafolder
        echo "`date +%F`-$postfix added" >> $logfile
        
    # update file if lastModified value is newer(higher value) than the last one backed up
    elif [ "$lastModified" -gt $lastBackedUp ]; then # compare ages
        echo "dumme x = $x"
        postfix=`echo $x|sed 's/.metadata//'`
        echo "postfix = $postfix"
        echo "$remarkable_dir/$postfix* \\" >> $tarscript
        cp "$remarkable_dir/$postfix.metadata" "$meta_dir/"
        # update the metafile in the metafolder
        echo "`date +%F`: $postfix added" >> $logfile
        
     # nothing to do   
     else   
        echo "$x skipped"        
    fi
 
done
echo '/dev/null' >> $tarscript
sh tarscript
echo "Successfully run incremental backup"

# cleanup
rm tarscript
echo `pwd`
cp "/home/root/bin/$backupfile" "/home/root/backups/archives/"
rm "./$backupfile"
#echo "/home/root/backup/archives/"
#echo "$backupfile"

# run tarscript. Do this when it's changed to a scp or ftp script
# bash tarscript


# There's no check to see if last modified is older than the file backed up earlier,
# but this shouldn't really happen, unless there's an error and then it's unsure if
# if its a good idea to upload it to the server. 
# 
# Logging: consider writing to a log file. If this is done, then it might be a good 
# idea to check for files where the lastModified value is older than the value in 
# the backed up metafile.
