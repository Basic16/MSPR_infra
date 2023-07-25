Windows
```pg_dump -U postgres -C -E UTF8 -W -F p -d paye_ton_kawa -f init.sql```

Linux
```./pg_dump.exe -U postgres -C -E UTF8 -W -F p -d paye_ton_kawa -f init.sql```


Télécharger les images
```docker compose pull```

Demarrer
```docker compose up -d```

S'arreter
```docker compose down```