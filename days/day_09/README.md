# Day 08

## **Topic: Transactions and Isolation Levels**

Today's exercises focus on understanding **transactions** and exploring different **isolation levels** (part of the ACID properties). You will use PostgreSQL's `psql` to simulate how changes in one session are visible to others based on isolation levels. Two parallel sessions are required for all exercises.

---

## **Exercise 00: Simple Transaction**

1. Use two sessions:
   - **Session #1**: Update the rating for "Pizza Hut" to 5 in a transaction. Verify the change in this session.
   - **Session #2**: Ensure the change is not visible until the transaction in Session #1 is committed.
   - **Session #1**: Commit the changes.
   - **Session #2**: Verify the change is now visible.

---

## **Exercise 01: Lost Update Anomaly**

1. Simulate the "Lost Update" anomaly under the default `READ COMMITTED` isolation level:
   - **Session #1**: Update "Pizza Hut" rating to 4.
   - **Session #2**: Concurrently update "Pizza Hut" rating to 3.6.
   - Demonstrate how the second update overwrites the first.

---

## **Exercise 02: Lost Update with Repeatable Read**

1. Repeat the "Lost Update" scenario under the `REPEATABLE READ` isolation level:
   - **Session #1**: Update "Pizza Hut" rating to 4.
   - **Session #2**: Update the rating to 3.6.
   - Show how `REPEATABLE READ` prevents one session from seeing uncommitted changes by another.

---

## **Exercise 03: Non-Repeatable Reads**

1. Demonstrate the "Non-Repeatable Reads" anomaly under `READ COMMITTED`:
   - **Session #1**: Check the rating for "Pizza Hut".
   - **Session #2**: Update the rating to 3.6.
   - **Session #1**: Recheck the rating and observe how it has changed.

---

## **Exercise 04: Non-Repeatable Reads with Serializable**

1. Simulate the same scenario as Exercise 03 but under the `SERIALIZABLE` isolation level.
   - Show how this strict isolation level handles the anomaly.

---

## **Exercise 05: Phantom Reads**

1. Demonstrate the "Phantom Reads" anomaly under `READ COMMITTED`:
   - **Session #1**: Calculate the sum of ratings for all pizzerias.
   - **Session #2**: Insert a new pizzeria ("Kazan Pizza", rating 5).
   - **Session #1**: Recheck the sum and observe the change due to the phantom row.

---

## **Exercise 06: Phantom Reads with Repeatable Read**

1. Simulate the same scenario as Exercise 05 under `REPEATABLE READ` isolation.
   - Highlight how this isolation level behaves in preventing phantom reads.

---

## **Exercise 07: Deadlock**

1. Reproduce a **deadlock** scenario:
   - Use two sessions and conflicting SQL statements to simulate a deadlock, where both sessions wait for the other to release locks.

---

### **Deliverables**

- SQL scripts (`.sql` files) with comments for each session.
- Screenshots of psql output for both sessions.
