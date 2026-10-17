#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -q -c"

echo -e "\n----SALON-----------\n"

echo -e "Welcome to the Salon, how can I help you?\n"


while true
do
  SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")

  echo "$SERVICES" | while IFS="|" read SERVICE_ID SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

  echo -e "\nWhich service would you like to do?"
    read SERVICE_ID_SELECTED || exit 0

    if [[ $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
    then
      SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")

      if [[ -n $SERVICE_NAME ]]
      then
        break
      fi
    fi

    echo -e "\nInvalid service. Please select a valid service.\n"
  done

echo -e "\nWhat's your phone number?"
read CUSTOMER_PHONE || exit 0

ESCAPED_PHONE=${CUSTOMER_PHONE//\'/\'\'}

CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$ESCAPED_PHONE'")

if [[ -z $CUSTOMER_ID ]]
then
  echo -e "\nI don't have a record for that phone number, what's your name? I'll add you to the database."
  read CUSTOMER_NAME || exit 0

  ESCAPED_NAME=${CUSTOMER_NAME//\'/\'\'}

  # NO ID because ID has an incremental attributes
  CUSTOMER_ID=$($PSQL "INSERT INTO customers(name, phone) VALUES('$ESCAPED_NAME', '$ESCAPED_PHONE') RETURNING customer_id")

    if [[ -z $CUSTOMER_ID ]]
  then
    echo "Unable to register customer."
    exit 1
  fi
else
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id = $CUSTOMER_ID")
fi

echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
read SERVICE_TIME || exit 0

ESCAPED_TIME=${SERVICE_TIME//\'/\'\'}

APPOINTMENT_ID=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$ESCAPED_TIME') RETURNING appointment_id")

if [[ -n $APPOINTMENT_ID ]]
then
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
else
  echo "Unable to schedule appointment."
  exit 1
fi


