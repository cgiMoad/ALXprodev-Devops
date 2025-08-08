
#!/bin/bash

# Fetch Pikachu data from PokeAPI
curl -s -o data.json -w "%{http_code}" https://pokeapi.co/api/v2/pokemon/pikachu > status_code.txt

# Check if the request was successful (HTTP 200)
if [ "$(cat status_code.txt)" -ne 200 ]; then
    echo "Failed to fetch Pikachu data. HTTP status: $(cat status_code.txt)" >> errors.txt
    rm -f data.json   # remove partial file if error
fi

# Clean up temp file
rm -f status_code.txt
