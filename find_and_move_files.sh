G_root_dir='/cygdrive/e/班级 1'
G_tmp_dir="/cygdrive/e/tmp"
function move(){
	filename=$1
	if [ -f "$filename" ];then
		mv "$filename" "$G_tmp_dir"
		echo "$filename"
	else
		echo "dir:$filename"
		cd "$filename"
		ls | while read dir;do
			move "$dir"
		done
		cd ..
	fi
}
mkdir "$G_tmp_dir"
cd "$G_root_dir"
move "$G_root_dir"