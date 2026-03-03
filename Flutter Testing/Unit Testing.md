
A **unit test** tests a single function, method, or class. The goal of a unit test is to verify the correctness of a unit of logic under a variety of conditions.

External dependencies of the unit under test are generally **mocked out**. Unit tests generally don't read from or write to disk, render to screen, or receive user actions from outside the process running the test.

Typically a unit test consists of three parts:
1. Initialization (Arrange)
2. Execution (Act)
3. Observation (Assert)

