
---

## 📚 **Types of Concurrency Anomalies (with examples like pics)**

---

### 1. **Dirty Read or Temporary Update**

**Definition:** A transaction reads data written by another uncommitted transaction.

🧠 **Problem:** If the first transaction rolls back, the second transaction has read a *non-permanent* value.

📌 **Diagram:**

```
Time ↓
        T1                    T2
       -----                 -----
   A = 10
   READ(A) → 10
   A = A + 10 → 20
   WRITE(A)

                        READ(A) → 20 ❌ (Dirty Read)

   ROLLBACK
```

💬 T2 reads 20, but T1 rolled back → A is still 10. Hence, **T2 read dirty data**.

---

### 2. **Lost Update**

**Definition:** Two transactions read the same value and update it, but one update is lost.

📌 **Diagram:**

```
Time ↓
        T1                    T2
       -----                 -----
   READ(X) → 100
                             READ(X) → 100
                             X = X - 25 → 75
                             WRITE(X)

   X = X + 15 → 115
   WRITE(X)     ❌ (Overwrites T2's update)
```

💬 T1 overwrote T2's update. **T2's subtraction is lost**.

---

### 3. **Unrepeatable Read**

**Definition:** A transaction reads the same row twice and gets different data because another transaction modified it in between.

📌 **Diagram:**

```
        T1                    T2
   READ(X) → 50

                            UPDATE X → 70
                            COMMIT

   READ(X) → 70 ❌ (Unrepeatable)
```

💬 T1 got **inconsistent values** during execution.

---

### 4. **Phantom Read**

**Definition:** A transaction reads a set of rows satisfying a condition, another transaction inserts/deletes a row matching the condition, and the first transaction reads again.

📌 **Diagram:**

```
        T1                        T2
   SELECT * FROM Students
   WHERE marks > 90

                                INSERT Student(marks=95)
                                COMMIT

   SELECT * FROM Students
   WHERE marks > 90   ❌ (Extra Row appears → Phantom)
```

💬 T1 saw **different sets of rows** → phantom data appeared.

---

### 5. **Write Skew**

**Definition:** Two transactions read the same data, make decisions based on it, and write different parts of the database. Their combination violates a constraint.

📌 **Example:**
Two doctors must not be off-duty at the same time.

```
Doctor A (T1):         Doctor B (T2):
READ(schedule)         READ(schedule)
Only 1 doctor on duty  Only 1 doctor on duty
Mark self off-duty     Mark self off-duty
COMMIT                 COMMIT
```

💬 Now **no doctor is on duty** → constraint violated.

---

