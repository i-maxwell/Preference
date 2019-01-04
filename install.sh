#/bin/sh

basepath=$(cd `dirname $0`; pwd)
date=`date +%Y%m%d`

filelist=(
".vimrc"
".bash_profile"
)

for file in ${filelist[@]}; do
    if [ -f ~/${file} ];then
        if [ -h ~/${file} ];then
            rm ~/${file}
        else
            mv ~/${file} ~/${file}_${date}
        fi
    fi
    ln -s ${basepath}/${file} ~/${file}
    echo 'Install done.['${file}']'
done
