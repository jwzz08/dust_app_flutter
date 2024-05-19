# dusty_dust

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# 수치상태 데이터

```dart
 /*
  1) 최고

  미세먼지 : 0 - 15
  초미세먼지 : 0 - 8
  오존(03) : 0 - 0.02
  이산화질소(N02) : 0 - 0.02
  일산화탄소(CO) : 0 - 0.02
  아황산가스(SO2) : 0 - 0.01


  2) 좋음

  미세먼지 : 16 - 30
  초미세먼지 : 9 - 15
  오존(03) : 0.02 - 0.03
  이산화질소(N02) : 0.02 - 0.03
  일산화탄소(CO) : 0.02 - 2
  아황산가스(SO2) : 0.01 - 0.02

  3) 양호

  미세먼지 : 31 - 40
  초미세먼지 : 16 - 20
  오존(03) : 0.03 - 0.06
  이산화질소(N02) : 0.03 - 0.05
  일산화탄소(CO) : 2 - 5.5
  아황산가스(SO2) : 0.02 - 0.04

  4) 보통

  미세먼지 : 41 - 50
  초미세먼지 : 21 - 25
  오존(03) : 0.06 - 0.09
  이산화질소(N02) : 0.05 - 0.06
  일산화탄소(CO) : 5.5 - 9
  아황산가스(SO2) : 0.04 - 0.05

  5) 나쁨

  미세먼지 : 51 - 75
  초미세먼지 : 26 - 37
  오존(03) : 0.09 - 0.12
  이산화질소(N02) : 0.06 - 0.13
  일산화탄소(CO) : 9 - 12
  아황산가스(SO2) : 0.05 - 0.1

  6) 상당히 나쁨

  미세먼지 : 76 - 100
  초미세먼지 : 36 - 50
  오존(03) : 0.12 - 0.15
  이산화질소(N02) : 0.13 - 0.2
  일산화탄소(CO) : 12 - 15
  아황산가스(SO2) : 0.1 - 0.15

  7) 매우 나쁨

  미세먼지 : 101 - 150
  초미세먼지 : 51 - 75
  오존(03) : 0.15 - 0.38
  이산화질소(N02) : 0.2 - 1.1
  일산화탄소(CO) : 15 - 32
  아황산가스(SO2) : 0.15 - 0.16

  8) 최악

  미세먼지 : 151~
  초미세먼지 : 76~
  오존(03) : 0.38~
  이산화질소(N02) : 1.1~
  일산화탄소(CO) : 32~
  아황산가스(SO2) : 0.16~

   */
```