function my_phpunit() {
    if [[ -x "vendor/bin/phpunit" ]]; then
        vendor/bin/phpunit "$@"
    else
        phpunit "$@"
    fi
}
