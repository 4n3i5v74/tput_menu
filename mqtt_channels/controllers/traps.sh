function ctrl_c() {
        echo "** Trapped CTRL-C"
        echo -n "exit from here"
        # Restaurar pantalla
        tput rmcup
        exit
}