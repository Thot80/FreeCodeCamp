#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

SERVICES=$($PSQL "SELECT service_id, name FROM services")

echo -e "\n~~~~~ Welcome To Our Salon ~~~~~\n"

TRIM(){

  if [[ ! -z $1 ]]
  then
    echo $1 | sed -E 's/^ *| *$//g'
  fi
}

MAIN_MENU() {

  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  # Display available services
  echo "$SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo  "$SERVICE_ID) $NAME"
  done

  # Choosing a service
  read SERVICE_ID_SELECTED
  SERVICE_ID_RESULT=$($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  
  if [[ -z $SERVICE_ID_RESULT ]]
  then
    MAIN_MENU "This service does not exist"
  # Service is valid
  else
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_RESULT")
    # Enter phone number   
    echo -e "\nEnter your phone number:"
    read CUSTOMER_PHONE
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

    # Customer is not in database
    if [[ -z $CUSTOMER_NAME ]]
    then
      # Prompt customer name
      echo -e "\nNot already client ! Please enter your name:"
      read CUSTOMER_NAME
      # Insert new customer in DB
      NEW_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers (phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    # cutomer phone and name exist at this point
    fi
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    # prompt appointment time
      echo -e "\nWhen will you come ?"
      read SERVICE_TIME
    #Insert appointment in DB
    APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  fi
  
  echo -e "\nI have put you down for a $(TRIM "$SERVICE_NAME") at $(TRIM "$SERVICE_TIME"), $(TRIM "$CUSTOMER_NAME")."
  
}

MAIN_MENU
