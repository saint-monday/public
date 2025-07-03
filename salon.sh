#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ The Hair Salon ~~~~~\n"

SERVICES_MENU() {
  echo -e "\nWelcome to My Salon, how can I help you?\n"

  # display services list in correct format
  $PSQL "SELECT service_id, name FROM services ORDER BY service_id;" | while read SERVICE_ID BAR NAME
  do
    # skip empty lines
    if [[ -n $SERVICE_ID && -n $NAME ]]
    then
      echo "$SERVICE_ID) $NAME"
    fi
  done

  # prompt for input
  read SERVICE_ID_SELECTED

  BOOKING_MAKER $SERVICE_ID_SELECTED

}
  
BOOKING_MAKER() {

  SERVICE_ID_SELECTED=$1
  echo $SERVICE_ID_SELECTED
  # check service availability
  SERVICE_AVAILABILITY=$($PSQL "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  # if not available
  if [[ -z $SERVICE_AVAILABILITY ]]
  then
    # send to services menu
    echo -e "\nThat service does not exist."
    SERVICES_MENU 
    return
  fi
  # get service name
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  
  # get customer info
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE';")
  
  # if customer doesn't exist
  if [[ -z $CUSTOMER_NAME ]]
  then    
    # get new customer name
    echo -e "\nWhat's your name?"
    read CUSTOMER_NAME
    # insert new customer
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers (phone,name) VALUES ('$CUSTOMER_PHONE','$CUSTOMER_NAME');")
  fi
  
  # request service time
  echo -e "\nWhat time would you like to come in?"
  read SERVICE_TIME

  #create appt record
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';")
  echo $CUSTOMER_ID
  # get customer_id
  INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments (customer_id,service_id,time) VALUES ($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME');")
  
  # confirm appt and send to service menu
  echo -e "\nI have put you down for a $(echo $SERVICE_NAME |sed -E  's/^ *| *$//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME |sed -E  's/^ *| *$//g')."
  
  
}

SERVICES_MENU