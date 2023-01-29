#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

SERVICES=$($PSQL "SELECT service_id, name FROM services")

echo -e "\n~~~~~ Welcome To Our Salon ~~~~~\n"

# Main Menu

MAIN_MENU() {

  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  # Display available services
  echo "Choose your service :" 
  echo -e "\n1. cut\n2. shampoo\n3. broshing"
  read MAIN_MENU_SELECTION
  case $MAIN_MENU_SELECTION  in
    1) BOOK_SERVICE "1" ;;
    2) BOOK_SERVICE "2" ;;
    3) BOOK_SERVICE "3" ;;
    4) EXIT ;;
    *) MAIN_MENU "Please Enter a valid option" ;;
  esac

}

BOOK_SERVICE(){



}
# Choose one 
# if not exist back to menu
# else rent a service

EXIT() {

  echo -e "\nThank you for visiting us !"
}
  MAIN_MENU