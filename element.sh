PSQL="psql -X --username=freecodecamp --dbname=periodic_table  --no-align --tuples-only -c"

if [[ $1 ]]
  then
    if [[ $1 =~ ^[0-9]+$ ]]
      then ATOMIC_NUMBER=$1
    fi
    # if atomic_number not provided
    if [[ -z $ATOMIC_NUMBER ]]
    then
      ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$1'")
    fi
    # if symbol not provided
    if [[ -z $ATOMIC_NUMBER ]]
    then
      ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name = '$1'")
    fi
    #if element not found
    if [[ -z $ATOMIC_NUMBER ]]
    then
      echo -e  "I could not find that element in the database."
    else
      ELEMENT_PROPERTIES=$($PSQL "SELECT e.name, e.symbol, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius, t.type FROM elements e INNER JOIN properties p ON e.atomic_number=p.atomic_number INNER JOIN types t ON p.type_id=t.type_id WHERE e.atomic_number=$ATOMIC_NUMBER;")

      echo "$ELEMENT_PROPERTIES" | while IFS='|' read -r ELEMENT_NAME ELEMENT_SYMBOL ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE
      do
        echo -e "The element with atomic number $ATOMIC_NUMBER is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $ELEMENT_NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
      done
    fi

    
  else
    echo -e  "Please provide an element as an argument."
fi

