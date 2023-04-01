  
    #Coman Marius-Constantin
    #Corodescu Serban-Florin

    #!/bin/bash    

    subpunctul1() {
    echo " "
    echo "Acest exercitiu are nevoie de drept de sudo!"
    echo " "
    cd /home
    touch Fisier.txt
    echo "AAA BBB CCC DDD AAA BBB CCC DDD" >> Fisier.txt
    echo "AAA BBB CCC DDD AAA BBB CCC DDD" >> Fisier.txt
    echo "AAA BBB CCC DDD AAA BBB CCC DDD" >> Fisier.txt
    echo "AAA BBB CCC DDD AAA BBB CCC DDD" >> Fisier.txt
    echo "AAA BBB CCC DDD AAA BBB CCC DDD" >> Fisier.txt
    echo "Numele fisierului este: (EX: Fisier.txt) "
    v1="Fisier.txt"
    read v2
    if [[ "$v2" != "$v1" ]];then  
    #compara doua stringuri
    echo "Fisier inexistent!"
    else
    echo " "
    echo "Fisierul nemodificat: "
    cat Fisier.txt
    read -p "Introduceti sirul pe care il cautati: (EX:AAA) " v3
    read -p "Introduceti sirul cu care doriti sa il inlocuiti: (EX:ZZZ) " v4 
        if [[ "$v3" != "" && "$v4" != "" ]];then
            sed -i "s/$v3/$v4/" Fisier.txt
            echo " "
            echo "Fisierul modificat: "
            cat Fisier.txt
        else
            echo "Nu se poate inlocui!"
        fi
    fi
    sudo rm -r Fisier.txt
    sleep 1
    }

    subpunctul2() {
    echo " "
    cd "$(dirname "$0")"
    touch Script.sh
    echo "#!/bin/bash" >> Script.sh
    echo "echo 'It works!' " >> Script.sh
    chmod +x Script.sh
    ./Script.sh
    rm -r Script.sh
    sleep 1
    }

    subpunctul3() {
    echo " "
    echo "Acest exercitiu are nevoie de drept de sudo!"
    echo " "
    cd "$(dirname "$0")"
    echo -e "Aveti permisiunea sa adagati utilizatori!\n"
    echo "Numele noului utilizator:"
    read v5
    sudo adduser "$v5"
    cd /home
    cd "$v5"
    sudo mkdir Home/
    echo " "
    if [[ "$(sudo whoami)" = "root" ]]
    #compara ce afiseaza sudo whoami cu textul root
    then
    echo "Aveti drept de root!"
    else 
    echo "Nu aveti drept de root!"
    sudo whoami
    fi
    sleep 1
    }

    subpunctul4() {
    echo " "
    echo "Acest exercitiu are nevoie de drept de sudo!"
    echo " "
    echo -e "Aveti permisiunea sa stergeti utilizatori!\n"
    echo "Doriti sa stergeti home-ul utilizatorului? da|nu"
    read v6
    if [ "$v6" == "da" ]
    #compara ce introduce utilizatorul in v6 cu stringul da
    then
    cd /home
    cd "$v5"
    sudo rm -r Home/
    echo "Home-ul utilizatorului a fost sters!"
    else
    echo "Home-ul utilizator nu a fost sters!"
    fi
    }

    functie1(){ 
    echo " "
    echo " "
    echo -e "                   ***Meniu***\n"
    echo -e "            Puteti executa urmatoarele puncte: \n"
    echo -e "        1    2    3    4    q \n\n"
    echo -e "    1 - Schimbarea primului sir de caractere dintr-un fisier text.\n"
    echo -e "    2 - Crearea unui script si rularea lui automata.\n"
    echo -e "    3 - Oferirea permisiunii de adaugare a utilizatorilor, adaugarea unui utilizator si crearea unui folder home in el.\n"
    echo -e "    4 - Oferirea permisiunii de stergere a unui utiliziator si optiunea de stergere a directorului home al lui.\n"
    echo -e "    q - Inchiderea scriptului.\n"
    echo " "

    read -n 1 x
    case $x in
    1)  echo " " 
        subpunctul1
        functie1
        ;;
    2)  subpunctul2
        functie1
        ;;
    3)  subpunctul3
        functie1
        ;;
    4)  subpunctul4
        functie1
        ;;
    q)  exit 1
        ;;
    *)  functie1
        ;;
    esac
    }
    functie1
