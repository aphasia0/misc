#!/bin/bash

# Verifica che siano passati i parametri richiesti
if [ "$#" -ne 3 ]; then
    echo "Uso: $0 input.pdf output.pdf password"
    exit 1
fi

input_pdf="$1"
output_pdf="$2"
password="$3"

# Rimuove la password dal PDF
qpdf --password="$password" --decrypt "$input_pdf" "$output_pdf"

if [ $? -eq 0 ]; then
    echo "La password è stata rimossa con successo dal PDF."
else
    echo "Si è verificato un errore durante la rimozione della password."
fi
