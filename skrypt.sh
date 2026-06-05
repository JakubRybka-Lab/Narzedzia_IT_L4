#!bin/bash

SCRIPT_NAME=$(basename "$0")
show_help() {
	echo "Użycie: ./SCRIPT_NAME [OPCJE}"
	echo " -d, --date 	Wyświetla dzisiejszą date"
	echo " -l, --logs [N] Tworzy N plików log ( domyślnie 100)"
	echo " -h, --help	Wyświetla pomoc"
}
if [ $# -eq 0 ]; then show_help; exit 0; fi
while [[ $# -gt 0 ]]; do
    case "$1" in
	-d|--date) date; shift ;;
	-l|--logs)
	    NUM=100
	if [[ -n "$2" && "$2" =~ ^[0-9+$ ]]; then NUM="$2"; shift; fi
for ((i=1; i<=NUM; i++)); do
	FILENAME="log${i}.txt"
	echo "Nazwa pliku: $Nazwa pliku: $FILENAME" > "$FILENAME"
	echo "Skrypt: $SCRIPT_NAME" >> "$FILENAME"
	echo "Data: $(date)" >> "$FILENAME"
done
    shift ;;
    -h|--help) show_help; shift ::
    *) shift ;;
 esac
done
