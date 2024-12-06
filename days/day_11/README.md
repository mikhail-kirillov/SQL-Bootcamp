# Day 11: SQL for Data Analysis

## **Exercise 00** — Aggregated Transaction Volume

You need to write a query that:

- Summarizes the total transaction volume (`money`) for each user and balance type.
- Handles NULL values in the `User` and `Currency` tables.
- Calculates additional fields:
  - `last_rate_to_usd`: The most recent exchange rate (or defaults to `1` if NULL).
  - `total_volume_in_usd`: Multiplies `volume` by `last_rate_to_usd`.
- Outputs a table with aggregated data, sorted by user name (descending), last name, and balance type.

---

## **Exercise 01** — Detailed Query for Currencies

You need to write a query that:

- Lists all users with their balance transactions.
- Includes the corresponding currency name and calculates the value of the transaction in USD.
- Determines the exchange rate (`rate_to_usd`) for the next day:
  - Finds the nearest past rate (`t1`), or if unavailable, the nearest future rate (`t2`).
  - Uses this rate to calculate `currency_in_usd`.

---

### Sample Output

1. **Exercise 00 Output**:

   ```plaintext
   name     | lastname     | type | volume | currency_name | last_rate_to_usd | total_volume_in_usd
   ---------|--------------|------|--------|---------------|------------------|---------------------
   Петр     | not defined  | 2    | 203    | not defined   | 1                | 203
   Иван     | Иванов       | 1    | 410    | EUR           | 0.9              | 369
   ```

2. **Exercise 01 Output**:

   ```plaintext
   name     | lastname     | currency_name | currency_in_usd
   ---------|--------------|---------------|-----------------
   Иван     | Иванов       | EUR           | 150.1
   Иван     | Иванов       | EUR           | 17
   ```
