#!/bin/bash
if [ "$1" == "--date" ] || [ "$1" == "-d" ]; then
    date
elif [ "$1" == "--logs" ] || [ "$1" == "-l" ]; then
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
elif [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
    echo "Dostępne opcje:"
    echo "- skrypt.sh --date (-d) : Wyświetla dzisiejszą datę"
    echo "- skrypt.sh --logs (-l) [liczba] : Tworzy automatycznie podaną liczbę plików log.txt"
    echo "- skrypt.sh --help (-h) : Wyświetla dostępne opcje"
    echo "- skrypt.sh --init : Klonuje całe repozytorium do katalogu bieżącego i ustawia ścieżkę w zmiennej środowiskowej PATH"
    echo "- skrypt.sh --error (-e) [liczba] : Tworzy errorx/errorx.txt, domyślnie tworzy 100 plików"
elif [ "$1" == "--init" ]; then
    git clone <adres_repozytorium> . # podmień <adres_repozytorium> na właściwy adres
    export PATH=$PATH:$(pwd)
elif [ "$1" == "--error" ] || [ "$1" == "-e" ]; then
    if [ -z "$2" ]; then
        num_errors=100
    else
        num_errors=$2
    fi
    for ((i=1; i<=$num_errors; i++)); do
        mkdir -p "error$i"
        touch "error$i/error$i.txt"
    done
else
    echo "Nierozpoznana opcja. Użyj 'skrypt.sh --help' aby wyświetlić dostępne opcje."
fi
echo "error*/" >> .gitignore
if [ "$1" != "--help" ] && [ "$1" != "-h" ]; then
    git add .
    git commit -m "Zaktualizowano skrypt"
    git push
fi

