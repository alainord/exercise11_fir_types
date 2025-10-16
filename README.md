**# exercise11_fir_types**# Exercise 11 – FIR Filter Types (I–IV)

This MATLAB project explores **four types of linear-phase FIR filters** and visualizes their **magnitude**, **phase**, and **zero locations**.

---

## Impulse Responses

| Type | Description | Impulse Response |
|------|--------------|------------------|
| I | Even length, symmetric | `[1 2 3 4 4 3 2 1]` |
| II | Odd length, symmetric | `[1 2 3 4 3 2 1]` |
| III | Even length, antisymmetric | `[-1 -2 -3 -4 3 3 2 1]` |
| IV | Odd length, antisymmetric | `[-1 -2 -3 0 3 2 1]` |

---

## Outputs

Each figure shows:

- **Left:** Magnitude response `|H(e^{jω})|`
- **Middle:** Unwrapped phase response
- **Right:** Zero locations (z-plane)

Example layout:

