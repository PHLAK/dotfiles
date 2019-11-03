function btc() {
    ssh -p 22200 -fqMNT -S btc-tunnel -L 8332:localhost:8332 \
    jetfire.phlak.net && bitcoin-cli "$@" && ssh -q -S btc-tunnel \
    -O exit jetfire.phlak.net
}
