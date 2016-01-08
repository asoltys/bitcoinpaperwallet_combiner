# Bitcoin Paper Wallet Combine

This script can be used to combine multiple PDF's generated from bitcoinpaperwallet.com into a single PDF that can be taken to a printer for two-up double-sided printing of multiple wallets.

## Instructions for Ubuntu linux

The script assumes that the wallet fronts will be named "1.pdf", "2.pdf", "3.pdf", etc. and that were will be a single file named "back.pdf".  Each file should contain a single landscape-oriented wallet that you'd get from choosing "Print to PDF" from the bitcoinpaperwallet.com website.

    sudo apt-get install pdftk
    chmod +x combine.sh
    ./combine.sh

