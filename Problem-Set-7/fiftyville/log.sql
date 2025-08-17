-- keep a log of any sql queries you execute as you solve the mystery. --
-- CRIME REPORTED ON GIVEN DATE AND STREET--
SELECT id, description FROM crime_scene_reports
WHERE year = 2024 AND
month = 7 AND day = 28 AND
street = 'Humphrey Street' AND
description LIKE '%cs50%';

-- WITNESSES INTERVIEWS --
SELECT * FROM interviews
WHERE year = 2024 AND
month = 7 AND day = 28 AND
transcript LIKE '%bakery%';

-- HUMPHREY STREET BAKERY'S SECURITY LOG (GIVES LISCENE PLATE)--
SELECT license_plate FROM bakery_security_logs
WHERE year = 2024 AND month = 7 AND
day = 28 AND activity = 'exit' AND hour = 10 AND minute BETWEEN 15 AND 25;

-- ATM TRANSACTIONS (GIVES ACCOUNT NUMBER)--
SELECT account_number FROM atm_transactions
WHERE year = 2024 AND month = 7 AND
day = 28 AND
transaction_type = 'withdraw' AND
atm_location = 'Leggett Street';


-- Phone CALLS (CALLERS NUMBER) --
SELECT caller FROM phone_calls
WHERE year = 2024 AND month = 7 AND
day = 28 AND duration < 60;

-- BANK ACCOUNTS AND PEOPLE (GIVES PERSON ID) --
SELECT person_id FROM bank_accounts
WHERE account_number IN (
    SELECT account_number
    FROM atm_transactions
    WHERE year = 2024 AND month = 7 AND
    day = 28 AND
    transaction_type = 'withdraw' AND
    atm_location = 'Leggett Street'
);

-- FIND NAME OF SUSPECTS FROM PEOPLE TABLE WITH ALL CONDITIONS TRUE --

SELECT *
FROM people
WHERE id IN (
    SELECT person_id
    FROM bank_accounts
    WHERE account_number IN (
        SELECT account_number
        FROM atm_transactions
        WHERE year = 2024
          AND month = 7
          AND day = 28
          AND transaction_type = 'withdraw'
          AND atm_location = 'Leggett Street'
    )
)
AND phone_number IN (
    SELECT caller
    FROM phone_calls
    WHERE year = 2024
      AND month = 7
      AND day = 28
      AND duration < 60
)
AND license_plate IN (
    SELECT license_plate
    FROM bakery_security_logs
    WHERE year = 2024
      AND month = 7
      AND day = 28
      AND activity = 'exit'
      AND hour = 10 AND minute BETWEEN 15 and 25
);

-- LEAVES TWO SUSPECTS --
-- NARROW IT DOWN TO ONE SUSPECT BY CHECKING THEIR FLIGHT HISTORY --
-- GIVES FLIGHT IDS so we can CHECK FOR RELEVANT DATE --

SELECT *
FROM passengers
WHERE passport_number IN (
    SELECT passport_number
    FROM people
    WHERE id IN (
        SELECT person_id
        FROM bank_accounts
        WHERE account_number IN (
            SELECT account_number
            FROM atm_transactions
            WHERE year = 2024
            AND month = 7
            AND day = 28
            AND transaction_type = 'withdraw'
            AND atm_location = 'Leggett Street'
        )
    )
    AND phone_number IN (
        SELECT caller
        FROM phone_calls
        WHERE year = 2024
        AND month = 7
        AND day = 28
        AND duration < 60
    )
    AND license_plate IN (
        SELECT license_plate
        FROM bakery_security_logs
        WHERE year = 2024
        AND month = 7
        AND day = 28
        AND activity = 'exit'
        AND hour = 10 AND minute BETWEEN 15 and 25
    )
);


-- CHECK FLIGHT HISTORY THROUGH FLIGHT IDS --
SELECT *
FROM flights
WHERE id IN (
SELECT flight_id
FROM passengers
WHERE passport_number IN (
    SELECT passport_number
    FROM people
    WHERE id IN (
        SELECT person_id
        FROM bank_accounts
        WHERE account_number IN (
            SELECT account_number
            FROM atm_transactions
            WHERE year = 2024
            AND month = 7
            AND day = 28
            AND transaction_type = 'withdraw'
            AND atm_location = 'Leggett Street'
        )
    )
    AND phone_number IN (
        SELECT caller
        FROM phone_calls
        WHERE year = 2024
        AND month = 7
        AND day = 28
        AND duration < 60
    )
    AND license_plate IN (
        SELECT license_plate
        FROM bakery_security_logs
        WHERE year = 2024
        AND month = 7
        AND day = 28
        AND activity = 'exit'
        AND hour = 10 AND minute BETWEEN 15 and 25
    )
)
)
AND day = 29
ORDER BY hour
LIMIT 1;

-- GETS CORRECT PASSPORT_ID AND FLIGH_ID THAT MATCHES --

SELECT passport_number
FROM passengers
WHERE passport_number IN (
    SELECT passport_number
    FROM people
    WHERE id IN (
        SELECT person_id
        FROM bank_accounts
        WHERE account_number IN (
            SELECT account_number
            FROM atm_transactions
            WHERE year = 2024
            AND month = 7
            AND day = 28
            AND transaction_type = 'withdraw'
            AND atm_location = 'Leggett Street'
        )
    )
    AND phone_number IN (
        SELECT caller
        FROM phone_calls
        WHERE year = 2024
        AND month = 7
        AND day = 28
        AND duration < 60
    )
    AND license_plate IN (
        SELECT license_plate
        FROM bakery_security_logs
        WHERE year = 2024
        AND month = 7
        AND day = 28
        AND activity = 'exit'
        AND hour = 10 AND minute BETWEEN 15 and 25
    )
) AND flight_id IN (
SELECT id
FROM flights
WHERE id IN (
SELECT flight_id
FROM passengers
WHERE passport_number IN (
    SELECT passport_number
    FROM people
    WHERE id IN (
        SELECT person_id
        FROM bank_accounts
        WHERE account_number IN (
            SELECT account_number
            FROM atm_transactions
            WHERE year = 2024
            AND month = 7
            AND day = 28
            AND transaction_type = 'withdraw'
            AND atm_location = 'Leggett Street'
        )
    )
    AND phone_number IN (
        SELECT caller
        FROM phone_calls
        WHERE year = 2024
        AND month = 7
        AND day = 28
        AND duration < 60
    )
    AND license_plate IN (
        SELECT license_plate
        FROM bakery_security_logs
        WHERE year = 2024
        AND month = 7
        AND day = 28
        AND activity = 'exit'
        AND hour = 10 AND minute BETWEEN 15 and 25
    )
)
)
AND day = 29
ORDER BY hour
LIMIT 1
);

-- GIVES THE THIEF --
SELECT name AS THIEF
FROM people
WHERE passport_number IN (
SELECT passport_number
FROM passengers
WHERE passport_number IN (
    SELECT passport_number
    FROM people
    WHERE id IN (
        SELECT person_id
        FROM bank_accounts
        WHERE account_number IN (
            SELECT account_number
            FROM atm_transactions
            WHERE year = 2024
            AND month = 7
            AND day = 28
            AND transaction_type = 'withdraw'
            AND atm_location = 'Leggett Street'
        )
    )
    AND phone_number IN (
        SELECT caller
        FROM phone_calls
        WHERE year = 2024
        AND month = 7
        AND day = 28
        AND duration < 60
    )
    AND license_plate IN (
        SELECT license_plate
        FROM bakery_security_logs
        WHERE year = 2024
        AND month = 7
        AND day = 28
        AND activity = 'exit'
        AND hour = 10 AND minute BETWEEN 15 and 25
    )
) AND flight_id IN (
SELECT id
FROM flights
WHERE id IN (
SELECT flight_id
FROM passengers
WHERE passport_number IN (
    SELECT passport_number
    FROM people
    WHERE id IN (
        SELECT person_id
        FROM bank_accounts
        WHERE account_number IN (
            SELECT account_number
            FROM atm_transactions
            WHERE year = 2024
            AND month = 7
            AND day = 28
            AND transaction_type = 'withdraw'
            AND atm_location = 'Leggett Street'
        )
    )
    AND phone_number IN (
        SELECT caller
        FROM phone_calls
        WHERE year = 2024
        AND month = 7
        AND day = 28
        AND duration < 60
    )
    AND license_plate IN (
        SELECT license_plate
        FROM bakery_security_logs
        WHERE year = 2024
        AND month = 7
        AND day = 28
        AND activity = 'exit'
        AND hour = 10 AND minute BETWEEN 15 and 25
    )
)
)
AND day = 29
ORDER BY hour
LIMIT 1
)
);

-- FINDING DESTINATION WITH FLIGHT ID --
SELECT city
FROM airports
WHERE id IN (
    SELECT destination_airport_id
    FROM flights
    WHERE id IN (
        SELECT flight_id
        FROM passengers
        WHERE passport_number IN (
            SELECT passport_number
            FROM people
            WHERE id IN (
                SELECT person_id
                FROM bank_accounts
                WHERE account_number IN (
                    SELECT account_number
                    FROM atm_transactions
                    WHERE year = 2024
                      AND month = 7
                      AND day = 28
                      AND transaction_type = 'withdraw'
                      AND atm_location = 'Leggett Street'
                )
            )
            AND phone_number IN (
                SELECT caller
                FROM phone_calls
                WHERE year = 2024
                  AND month = 7
                  AND day = 28
                  AND duration < 60
            )
            AND license_plate IN (
                SELECT license_plate
                FROM bakery_security_logs
                WHERE year = 2024
                  AND month = 7
                  AND day = 28
                  AND activity = 'exit'
                  AND hour = 10
                  AND minute BETWEEN 15 AND 25
            )
        )
    )
    AND day = 29
    ORDER BY hour
    LIMIT 1
);


-- FIND THE ACCOMPLICE FROM PHONE HISTORY --
SELECT DISTINCT receiver
FROM phone_calls
WHERE caller IN (
    SELECT phone_number
    FROM people
    WHERE passport_number IN (
        SELECT passport_number
        FROM passengers
        WHERE passport_number IN (
            SELECT passport_number
            FROM people
            WHERE id IN (
                SELECT person_id
                FROM bank_accounts
                WHERE account_number IN (
                    SELECT account_number
                    FROM atm_transactions
                    WHERE year = 2024
                      AND month = 7
                      AND day = 28
                      AND transaction_type = 'withdraw'
                      AND atm_location = 'Leggett Street'
                )
            )
            AND phone_number IN (
                SELECT caller
                FROM phone_calls
                WHERE year = 2024
                  AND month = 7
                  AND day = 28
                  AND duration < 60
            )
            AND license_plate IN (
                SELECT license_plate
                FROM bakery_security_logs
                WHERE year = 2024
                  AND month = 7
                  AND day = 28
                  AND activity = 'exit'
                  AND hour = 10
                  AND minute BETWEEN 15 AND 25
            )
        )
        AND flight_id IN (
            SELECT id
            FROM flights
            WHERE id IN (
                SELECT flight_id
                FROM passengers
                WHERE passport_number IN (
                    SELECT passport_number
                    FROM people
                    WHERE id IN (
                        SELECT person_id
                        FROM bank_accounts
                        WHERE account_number IN (
                            SELECT account_number
                            FROM atm_transactions
                            WHERE year = 2024
                              AND month = 7
                              AND day = 28
                              AND transaction_type = 'withdraw'
                              AND atm_location = 'Leggett Street'
                        )
                    )
                    AND phone_number IN (
                        SELECT caller
                        FROM phone_calls
                        WHERE year = 2024
                          AND month = 7
                          AND day = 28
                          AND duration < 60
                    )
                    AND license_plate IN (
                        SELECT license_plate
                        FROM bakery_security_logs
                        WHERE year = 2024
                          AND month = 7
                          AND day = 28
                          AND activity = 'exit'
                          AND hour = 10
                          AND minute BETWEEN 15 AND 25
                    )
                )
            )
            AND day = 29
            ORDER BY hour
            LIMIT 1
        )
    )
)
AND year = 2024
AND month = 7
AND day = 28
AND duration < 60;

-- FINALLY FIND THE ACCOMPLICE --
SELECT name as ACCOMPLICE
from people
where phone_number IN (
    SELECT DISTINCT receiver
FROM phone_calls
WHERE caller IN (
    SELECT phone_number
    FROM people
    WHERE passport_number IN (
        SELECT passport_number
        FROM passengers
        WHERE passport_number IN (
            SELECT passport_number
            FROM people
            WHERE id IN (
                SELECT person_id
                FROM bank_accounts
                WHERE account_number IN (
                    SELECT account_number
                    FROM atm_transactions
                    WHERE year = 2024
                      AND month = 7
                      AND day = 28
                      AND transaction_type = 'withdraw'
                      AND atm_location = 'Leggett Street'
                )
            )
            AND phone_number IN (
                SELECT caller
                FROM phone_calls
                WHERE year = 2024
                  AND month = 7
                  AND day = 28
                  AND duration < 60
            )
            AND license_plate IN (
                SELECT license_plate
                FROM bakery_security_logs
                WHERE year = 2024
                  AND month = 7
                  AND day = 28
                  AND activity = 'exit'
                  AND hour = 10
                  AND minute BETWEEN 15 AND 25
            )
        )
        AND flight_id IN (
            SELECT id
            FROM flights
            WHERE id IN (
                SELECT flight_id
                FROM passengers
                WHERE passport_number IN (
                    SELECT passport_number
                    FROM people
                    WHERE id IN (
                        SELECT person_id
                        FROM bank_accounts
                        WHERE account_number IN (
                            SELECT account_number
                            FROM atm_transactions
                            WHERE year = 2024
                              AND month = 7
                              AND day = 28
                              AND transaction_type = 'withdraw'
                              AND atm_location = 'Leggett Street'
                        )
                    )
                    AND phone_number IN (
                        SELECT caller
                        FROM phone_calls
                        WHERE year = 2024
                          AND month = 7
                          AND day = 28
                          AND duration < 60
                    )
                    AND license_plate IN (
                        SELECT license_plate
                        FROM bakery_security_logs
                        WHERE year = 2024
                          AND month = 7
                          AND day = 28
                          AND activity = 'exit'
                          AND hour = 10
                          AND minute BETWEEN 15 AND 25
                    )
                )
            )
            AND day = 29
            ORDER BY hour
            LIMIT 1
        )
    )
)
AND year = 2024
AND month = 7
AND day = 28
AND duration < 60
);
