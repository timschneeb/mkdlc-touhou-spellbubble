#!/bin/bash

# Prerequisites:
#   * Place your extracted console keys in ~/.switch/prod.keys
#   * Install hacpack (https://github.com/The-4n/hacPack) and add it into $PATH

# Number of the first DLC to generate
firstDlcId=1
# Title ID of the first DLC to generate
firstDlcTitleId=0100ae7012b5f001
# Generate x DLCs
maxDlcs=100

if ! command -v hacpack &> /dev/null
then
    echo "'hacpak' could not be found. Make sure to the program is installed and in \$PATH."
    exit 1
fi

rm -rf tmp_nca/
for ((id = $firstDlcId ; id <= maxDlcs ; id++)); do
    echo -e "\033[0;36m\033[1mMaking DLC #$id (TID $firstDlcTitleId)\033[0m"

    # Write DLC unlock file
    mkdir -p 0/
    printf "\r\n" >> 0/TPZ_DLC${id}.dat

    # Pack data NCA
    hacpack --type nca -o tmp_nca -k ~/.switch/prod.keys --titleid $firstDlcTitleId --ncatype publicdata --romfsdir 0/
    # Pack meta NCA
    hacpack --type nca -o tmp_nca -k ~/.switch/prod.keys --titleid $firstDlcTitleId --ncatype meta --titletype addon --publicdatanca $(ls tmp_nca/*.nca | head -n1)
    # Pack DLC NSP
    hacpack --type nsp -o . -k ~/.switch/prod.keys --titleid $firstDlcTitleId --ncadir tmp_nca

    # Cleanup working directory
    rm tmp_nca/*.nca
    rm -rf 0/

    # Next TID
    firstDlcTitleId=$(printf "%016x" $((0x$firstDlcTitleId+1)))
done

# Remove temporary files
rm -rf tmp_nca
rm -rf hacpack_backup
