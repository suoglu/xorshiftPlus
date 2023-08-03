# Xorshift+

## Contents of Readme

1. About
2. Modules
3. Interface Description
4. Simulation
5. Test
6. Status Information
7. Issues
8. Licence

[![Repo on GitLab](https://img.shields.io/badge/repo-GitLab-6C488A.svg)](https://gitlab.com/suoglu/xorshiftPlus)
[![Repo on GitHub](https://img.shields.io/badge/repo-GitHub-3D76C2.svg)](https://github.com/suoglu/xorshiftPlus)

---

## About

Uniform pseudorandom number generator in Verilog. More info in [vigna.di.unimi.it/ftp/papers/xorshiftplus.pdf](https://vigna.di.unimi.it/ftp/papers/xorshiftplus.pdf)

## Modules

Module `xorshiftPlus` is a parametrized pseudorandom number generator.

### Parameters

|   Parameter   | Default Value |  Description |
| :------: | :----: |  ------  |
| `BITSIZE` | 64 | Bit size for state and output |
| `SHIFT0` | 23 | left shift of xorshift+ |
| `SHIFT1` | 18 | first right shift of xorshift+ |
| `SHIFT2` | 5 | second right shift of xorshift+  |

## Interface Description

|   Port   | Type | Width |  Description |
| :------: | :----: | :----: |  ------  |
| `clk` | I | 1 | System Clock |
| `rst` | I | 1 | System Reset |
| `seed0` | I | `BITSIZE` | Seed for state 0 |
| `seed1` | I | `BITSIZE` | Seed for state 1 |
| `gen` | I | 1 | Generate new numbers |
| `randOut` | O | `BITSIZE` | Uniform random values |

I: Input  O: Output

## Simulation

A simple testbench is included in [tb.v](sim/tb.v). This testbench dumps generated values in output.txt. Output values are generated 64 bit, but only least significant 8 bits are dumped. [plot.py](scripts/plot.py) can be used to display the histogram of generated data from output.txt.

## Test

Modules in this repo is not tested on hardware yet.

## Status Information

**Last Simulation:** 17 April 2023

**Last Test:** -

## License

CERN Open Hardware Licence Version 2 - Weakly Reciprocal
