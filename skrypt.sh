#!bin/bash

SCRIPT_NAME=$(basename "$0")
show_help() {
	echo "Użycie: ./SCRIPT_NAME [OPCJE}"
	echo " --date 	Wyświetla dzisiejszą date"
	echo " --logs [N] Tworzy N plików log ( domyślnie 100)"
	echo " --help	Wyświetla pomoc"
}
if [ "$1" == "--help" ] || [ $# -eq 0 ];then
	show help
elif ["$`" == "--date" ]; then
	date
elif [ "$1" == "--logs" ]; then
	NUM=100
	if [[ -n "$2" && "$2" =~ ^[0-9+$ ]]; then
	NUM="$2"
fi
for ((i=1; i<=NUM; i++)); do
	FILENAME="log${i}.txt"
	echo "Nazwa pliku: $Nazwa pliku: $FILENAME" > "$FILENAME"
	echo "Skrypt: $SCRIPT_NAME" >> "$FILENAME"
	echo "Data: $(date)" >> "$FILENAME"
	done
fi
