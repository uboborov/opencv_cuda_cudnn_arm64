#! /bin/sh

# find dependencies from CUDA libraries in OpenCV libraries and print

ROOT=$PWD

. $ROOT/color

CV_DIR=$ROOT/cuda-aarch64-cc-mxnet-opencv/opencv-4.5.3-cudnn/usr/local/lib
CU_DIR=/home/ubobrov/develop/projects/nvidia/jetson_nano/CUDA/lib/usr/local/cuda-10.2/targets/aarch64-linux/lib 
L_DIR=/home/ubobrov/develop/projects/nvidia/jetson_nano/CUDA/lib/usr/lib/aarch64-linux-gnu

set -- a b c d e f g h i j k l m n o p r s t u v w x y z 1 2 3 4 5 6 7 8 9

array() {
  _pos=$1
  _newval=$2
  _ARRAY= _i=-1 _val=
  shift 2
  
  for _val in "$@"
  do
	if [ $((_i+=1)) = $_pos ]; then
	_ARRAY="${_ARRAY}${_newval} "
	else
	_ARRAY="${_ARRAY}${_val} "
	fi
  done 

}

i=0

for F in $CV_DIR/*.so; do
	LIST=$(readelf -d $F | grep -Po "(?<=\[).*?(?=\])")
	#echo $LIST
	for L in $LIST; do
		#echo $L
		LIB=$(find $CU_DIR -name $L)
		if [ "$LIB" != "" ]; then
			S=`basename "$F"`
			D=`basename "$LIB"`
			#cecho g "$S -> $D" # print CUDA libs located in CU_DIR nedded by opencv
			array $i $LIB "$@"
			set -- ${_ARRAY}
			i=$((i+1))
		else
			LIB=$(find $L_DIR -name $L)
			if [ "$LIB" != "" ]; then
				S=`basename "$F"`
				D=`basename "$LIB"`
				cecho g "$S -> $D" # print CUDA libs located in L_DIR nedded by opencv
				array $i $LIB "$@"
				set -- ${_ARRAY}
				i=$((i+1))
			else
				LIB=$(find $CV_DIR -name $L)
				if [ "$LIB" != "" ]; then
					S=`basename "$F"`
					D=`basename "$LIB"`
					#cecho y "$S -> $D" # print opencv libs located in CV_DIR nedded by opencv 
				else
					S=`basename "$F"`
					#cecho r "$S -> $L" # print other needed libs
				fi	
			fi	
		fi	
	done
done

oldIFS=$IFS
IFS=""
set -- ${_ARRAY}
SORTED=$(echo "$@" | tr ' ' '\n' | sort | uniq | tr '\n' ' ' | sed -e 's/[[:space:]]*$//')

echo "$SORTED" | tr ' ' '\n' > /tmp/list.txt
cecho b "*********************** CUDA libs needed for OpenCV *******************************"
cecho b "$SORTED" | tr ' ' '\n'
cat /tmp/list.txt  | xargs -d \\n du -chL |tail -1

##################################################################
set -- a b c d e f g h i j k l m n o p r s t u v w x y z 1 2 3 4 5 6 7 8 9 
i=0

IFS=" 
"

for F in ${SORTED}; do
	LIST=$(readelf -d $F | grep -Po "(?<=\[).*?(?=\])")
	#echo "$LIST"
	for L in $LIST; do
		LIB=$(find $CU_DIR -name $L)
		if [ "$LIB" != "" ]; then
			RP=`readlink "$CU_DIR/$L"`
			#cecho r "$RP : $L"
			S=`basename "$F"`
			D=`basename "$LIB"`
			#cecho g "$S -> $D" # print CUDA libs located in CU_DIR nedded by opencv
			array $i $LIB "$@"
			set -- ${_ARRAY}
			i=$((i+1))
		else
			LIB=$(find $L_DIR -name $L)
			if [ "$LIB" != "" ]; then
				RP=`readlink "$L_DIR/$L"`
				S=`basename "$F"`
				D=`basename "$LIB"`
				#cecho g "$S -> $D" # print CUDA libs located in L_DIR nedded by opencv
				array $i $LIB "$@"
				set -- ${_ARRAY}
				i=$((i+1))
			fi
			
		fi
	done
done


oldIFS=$IFS
IFS=""
set -- ${_ARRAY}
SORTED=$(echo "$@" | tr ' ' '\n' | sort | uniq | tr '\n' ' ' | sed -e 's/[[:space:]]*$//')
cecho b "*********************** CUDA libs in CUDA symlinks *******************************"
cecho b "$SORTED" | tr ' ' '\n'

set -- a b c d e f g h i j k l m n o p r s t u v w x y z 1 2 3 4 5 6 7 8 9
i=0

IFS=" 
"
for F in ${SORTED}; do
	LIST=$(readelf -d $F | grep -Po "(?<=\[).*?(?=\])")
	#echo "$LIST"
	for L in $LIST; do
		LIB=$(find $CU_DIR -name $L)
		if [ "$LIB" != "" ]; then
			#cecho r "$RP : $L"
			S=`basename "$F"`
			D=`basename "$RP"`
			#cecho g "$S -> $D" # print CUDA libs located in CU_DIR nedded by opencv
			array $i "$CU_DIR/$RP" "$@"
			set -- ${_ARRAY}
			i=$((i+1))
		else
			LIB=$(find $L_DIR -name $L)
			if [ "$LIB" != "" ]; then
				RP=`readlink "$L_DIR/$L"`
				S=`basename "$F"`
				D=`basename "$RP"`
				#cecho g "$S -> $D" # print CUDA libs located in L_DIR nedded by opencv
				array $i "$L_DIR/$RP" "$@"
				set -- ${_ARRAY}
				i=$((i+1))
			fi
			
		fi
	done
done

IFS=""
set -- ${_ARRAY}
SORTED=$(echo "$@" | tr ' ' '\n' | sort | uniq | tr '\n' ' ' | sed -e 's/[[:space:]]*$//')
echo "$SORTED" | tr ' ' '\n' > /tmp/list.txt
cecho b "*********************** CUDA libs in CUDA dependencies *******************************"
cecho b "$SORTED" | tr ' ' '\n'
#cat /tmp/list.txt  | xargs -d \\n du -chL |tail -1
	
IFS=$oldIFS
