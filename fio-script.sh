dir_res="./fio-results-bs-4k-local"
dir_mount="./results/$1"
disk_type="$1"
file_size="100M"
bs="4k"
for i in 1 10 64; do fio --filename=$dir_mount/randread --rw=randread --bs=$bs --ioengine=libaio --iodepth=$i --direct=1 --name=fio-test-job --filesize=$file_size --output=$dir_res/$disk_type-randread-$i ; done
for i in 1 10 64; do fio --filename=$dir_mount/randwrite --rw=randwrite --bs=$bs --ioengine=libaio --iodepth=$i --direct=1 --name=fio-test-job --filesize=$file_size --output=$dir_res/$disk_type-randwrite-$i ; done
for i in 1 10 64; do fio --filename=$dir_mount/randrw --rw=randrw --bs=$bs --ioengine=libaio --iodepth=$i --direct=1 --name=fio-test-job --filesize=$file_size --output=$dir_res/$disk_type-randrw-$i ; done
for i in 1 10 64; do fio --filename=$dir_mount/read --rw=read --bs=$bs --ioengine=libaio --iodepth=$i --direct=1 --name=fio-test-job --filesize=$file_size --output=$dir_res/$disk_type-read-$i ; done
for i in 1 10 64; do fio --filename=$dir_mount/write --rw=write --bs=$bs --ioengine=libaio --iodepth=$i --direct=1 --name=fio-test-job --filesize=$file_size --output=$dir_res/$disk_type-write-$i ; done
for i in 1 10 64; do fio --filename=$dir_mount/rw --rw=rw --bs=$bs --ioengine=libaio --iodepth=$i --direct=1 --name=fio-test-job --filesize=$file_size --output=$dir_res/$disk_type-rw-$i ; done
