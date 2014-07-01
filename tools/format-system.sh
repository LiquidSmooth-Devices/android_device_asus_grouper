#!/sbin/sh

# find out which partitions are formatted as F2FS
mount | grep -q 'data type f2fs'
DATA_F2FS=$?
mount | grep -q 'cache type f2fs'
CACHE_F2FS=$?
mount | grep -q 'system type f2fs'
SYSTEM_F2FS=$?

if [ $DATA_F2FS -eq 0 ] && [ $CACHE_F2FS -eq 0 ] && [ $SYSTEM_F2FS -eq 0 ]; then
  mkfs.f2fs /dev/block/platform/sdhci-tegra.3/by-name/APP
elif [ $DATA_F2FS -eq 0 ] && [ $CACHE_F2FS != 0 ] && [ $SYSTEM_F2FS != 0 ]; then
   mkfs.ext4 /dev/block/platform/sdhci-tegra.3/by-name/APP
elif [ $DATA_F2FS != 0 ] && [ $CACHE_F2FS != 0 ] && [ $SYSTEM_F2FS != 0 ]; then
    mkfs.ext4 /dev/block/platform/sdhci-tegra.3/by-name/APP
fi