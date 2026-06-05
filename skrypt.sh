#!/bin/bash
SCRIPT_NAME=$(basename "$0")
show_help() {
        echo "Użycie: ./$SCRIPT_NAME [OPCJE]"
        echo "  -d, --date      Wyświetla dzisiejszą datę"
        echo "  -l, --logs [N]  Tworzy N plików log (domyślnie 100)"
        echo "  -e, --error [N] Tworzy N plików error (domyślnie 100)"
        echo "  --init          Klonuje repozytorium i ustawia PATH"
        echo "  -h, --help      Wyświetla pomoc"
}
if [ $# -eq 0 ]; then show_help; exit 0; fi
while [[ $# -gt 0 ]]; do
    case "$1" in
	-d|--date) date; shift ;;
	-l|--logs)
	-e|--error)
	    NUM=100
	if [[ -n "$2" && "$2" =~ ^[0-9+$ ]]; then NUM="$2"; shift; fi
for ((i=1; i<=NUM; i++)); do
	mkdir -p "error${i}"
	FILENAME="error${i}/error${i}.txt"
	echo "Nazwa pliku: $Nazwa pliku: $FILENAME" > "$FILENAME"
	echo "Skrypt: $SCRIPT_NAME" >> "$FILENAME"
	echo "Data: $(date)" >> "$FILENAME"
done
    shift ;;
 --init)
     REPO_URL=$(git remote get-url origin 2>/dev/null)
     git clone "$REPO_URL" "cloned_repo"
     echo "export PATH=\"\$PATH:$(pwd)\"" >> ~/.bashrc
     shift ;;
    -h|--help) show_help; shift ::
    *) shift ;;
 esac
        -d|--date) date; shift ;;
        -l|--logs)
            NUM=100
            if [[ -n "$2" && "$2" =~ ^[0-9]+$ ]]; then NUM="$2"; shift; fi
            for ((i=1; i<=NUM; i++)); do
                FILENAME="log${i}.txt"
                echo "Nazwa pliku: $FILENAME" > "$FILENAME"
                echo "Skrypt: $SCRIPT_NAME" >> "$FILENAME"
                echo "Data: $(date)" >> "$FILENAME"
            done
            shift ;;
        -e|--error)
            NUM=100
            if [[ -n "$2" && "$2" =~ ^[0-9]+$ ]]; then NUM="$2"; shift; fi
            for ((i=1; i<=NUM; i++)); do
                mkdir -p "error${i}"
                FILENAME="error${i}/error${i}.txt"
                echo "Nazwa pliku: $FILENAME" > "$FILENAME"
                echo "Skrypt: $SCRIPT_NAME" >> "$FILENAME"
                echo "Data: $(date)" >> "$FILENAME"
            done
            shift ;;
        --init)
            REPO_URL=$(git remote get-url origin 2>/dev/null)
            git clone "$REPO_URL" "cloned_repo"
            echo "export PATH=\"\$PATH:$(pwd)\"" >> ~/.bashrc
            shift ;;
        -h|--help) show_help; shift ;;
        *) shift ;;
    esac
done

