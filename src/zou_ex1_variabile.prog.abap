*&---------------------------------------------------------------------*
*& Report  ZOU_EX1_VARIABILE si constante
*& 30.09.2025 ountea
*&---------------------------------------------------------------------*
*&
*   Creează un program în SE38 care să facă următoarele:
*   1. Declară o constantă lc_discount de tip procent (10%).
*   2. Declară variabile pentru lv_product_name, lv_price și lv_price_with_discount.
*   3. Stochează în lv_product_name valoarea „Laptop”, iar în lv_price valoarea 3000.
*   4. Calculează lv_price_with_discount aplicând reducerea definită prin constantă.
*   5. Afișează pe ecran:
*     Numele produsului
*     Prețul inițial
*     Discount-ul aplicat
*     Prețul final
*&
*&---------------------------------------------------------------------*
REPORT zou_ex1_variabile.

CONSTANTS: lc_discount TYPE p DECIMALS 2 VALUE '0.1'.

DATA: lv_product_name        TYPE c LENGTH 20,
      lv_price               TYPE p DECIMALS 2,
      lv_price_with_discount TYPE p DECIMALS 2.

lv_product_name = 'Laptop'.
lv_price = '3000'.
lv_price_with_discount = lv_price - ( lv_price * lc_discount ).

WRITE: / 'Numele produsului: ', lv_product_name,
       / 'Pretul initial: ', lv_price,
       / 'Discount-ul aplicat: ', lc_discount,
       / 'Pretul final: ', lv_price_with_discount.
