#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
if [[ -z $1 ]]
then
echo "Please provide an element as an argument."
else
    if [[  $1 =~ ^[0-9]*$ ]]
    then
        ELEMENT_ID=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = $1")
        ATOMIC_NUMBER=$($PSQL "SELECT atomic_number  FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number = $ELEMENT_ID")
        SYMBOL=$($PSQL "SELECT symbol FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number = $ELEMENT_ID")
        NAME=$($PSQL "SELECT name FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number = $ELEMENT_ID")
        TYPE=$($PSQL "SELECT  type FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number = $ELEMENT_ID")
        ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number = $ELEMENT_ID")
        MELTING_POINT_CELSIUS=$($PSQL "SELECT  melting_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number = $ELEMENT_ID")
        BOILING_POINT_CELSIUS=$($PSQL "SELECT  boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number = $ELEMENT_ID")

        echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
       
    
    else
        ELEMENT_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE symbol = '$1'")
        if [[ -z $ELEMENT_SYMBOL ]]
        then
        ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE name = '$1'")
            if [[ -z $ELEMENT_NAME ]]
            then
                echo "I could not find that element in the database."
            else
                ATOMIC_NUMBER=$($PSQL "SELECT atomic_number  FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE name = '$ELEMENT_NAME'")
                SYMBOL=$($PSQL "SELECT symbol FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE name = '$ELEMENT_NAME'")
                NAME=$($PSQL "SELECT name FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE name = '$ELEMENT_NAME'")
                TYPE=$($PSQL "SELECT  type FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE name = '$ELEMENT_NAME'")
                ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE name = '$ELEMENT_NAME'")
                MELTING_POINT_CELSIUS=$($PSQL "SELECT  melting_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE name = '$ELEMENT_NAME'")
                BOILING_POINT_CELSIUS=$($PSQL "SELECT  boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE name = '$ELEMENT_NAME'")

                echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
                
            fi
       
        else
            ATOMIC_NUMBER=$($PSQL "SELECT atomic_number  FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol = '$ELEMENT_SYMBOL'")
            SYMBOL=$($PSQL "SELECT symbol FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol = '$ELEMENT_SYMBOL'")
            NAME=$($PSQL "SELECT name FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol = '$ELEMENT_SYMBOL'")
            TYPE=$($PSQL "SELECT  type FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol = '$ELEMENT_SYMBOL'")
            ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol = '$ELEMENT_SYMBOL'")
            MELTING_POINT_CELSIUS=$($PSQL "SELECT  melting_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol = '$ELEMENT_SYMBOL'")
            BOILING_POINT_CELSIUS=$($PSQL "SELECT  boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol = '$ELEMENT_SYMBOL'")

            echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."

            
        fi
    fi

fi

