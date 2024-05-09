#!/bin/bash
if [ "$1" == "--date" ]; then
    date
elif [ "$1" == "--logs" ]; then
    if [ -z "$2" ]; then
        num_logs=100
    else
        num_logs=$2
    fi
    for ((i=1; i<=$num_logs; i++)); do
        filename="log$i.txt"
        echo "Nazwa pliku: $filename" > "$filename"
        echo "Nazwa skryptu: $0" >> "$filename"
        echo "Data: $(date)" >> "$filename"
    done
elif [ "$1" == "--help" ]; then
    echo "Dostępne opcje:"
    echo "- skrypt.sh --date : Wyświetla dzisiejszą datę"
    echo "- skrypt.sh --logs [liczba] : Tworzy automatycznie podaną liczbę plików log.txt"
    echo "- skrypt.sh --help : Wyświetla dostępne opcje"
else
    echo "Nierozpoznana opcja. Użyj 'skrypt.sh --help' aby wyświetlić dostępne opcje."
fi
git tag 1.0
