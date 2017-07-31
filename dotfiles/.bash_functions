function my_phpunit() {
    if [[ -x "vendor/bin/phpunit" ]]; then
        vendor/bin/phpunit "$@"
    else
        phpunit "$@"
    fi
}

function btc() {
    ssh -p 22200 -M -S btc-tunnel -fqNT -L 8332:localhost:8332 jetfire.phlak.net && bitcoin-cli "$@" && ssh -qS btc-tunnel -O exit jetfire.phlak.net
}
