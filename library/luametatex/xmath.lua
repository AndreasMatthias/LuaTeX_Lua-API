---@meta
xmath = {}

---
---Compute the principal value of the arc cosine of `a`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L26-L30](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L26-L30)
---* cppreference.com: [numeric/math/acos](https://en.cppreference.com/w/c/numeric/math/acos)
---
---@param a number
---
---@return number
function xmath.acos(a) end

---
---Compute the inverse hyperbolic cosine of `a`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L32-L36](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L32-L36)
---* cppreference.com: [numeric/math/acosh](https://en.cppreference.com/w/c/numeric/math/acosh)
---
---@param a number
---
---@return number
function xmath.acosh(a) end

---
---Compute the principal values of the arc sine of `a`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L38-L42](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L38-L42)
---* cppreference.com: [numeric/math/asin](https://en.cppreference.com/w/c/numeric/math/asin)
---
---@param a number
---
---@return number
function xmath.asin(a) end

---
---Compute the inverse hyperbolic sine of `a`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L44-L48](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L44-L48)
---* cppreference.com: [numeric/math/asinh](https://en.cppreference.com/w/c/numeric/math/asinh)
---
---@param a number
---
---@return number
function xmath.asinh(a) end

---
---Compute the principal value of the arc tangent of `a`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L50-L58](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L50-L58)
---* cppreference.com: [numeric/math/atan](https://en.cppreference.com/w/c/numeric/math/atan)
---
---@param a number
---
---@return number
function xmath.atan(a, b) end

---
---Compute the arc tangent of `y / x` using the signs of arguments to determine the correct quadrant.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L60-L64](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L60-L64)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/atan2)
---
---@param a number
---
---@return number
function xmath.atan2(a, b) end

---
---Compute the inverse hyperbolic tangent of `a`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L66-L70](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L66-L70)
function xmath.atanh(a) end
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/)
---
---@param a number
---
---@return number
function xmath.atanh(a) end

---
---Compute the cube root of `a`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L72-L76](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L72-L76)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/cbrt)
---
---@param a number
---
---@return number
function xmath.cbrt(a) end

---
---Compute the smallest integer value not less than `a`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L78-L82](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L78-L82)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/ceil)
---
---@param a number
---
---@return number
function xmath.ceil(a) end

---
---Compose a floating point value with the magnitude of `a` and the sign of `b`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L84-L88](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L84-L88)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/copysign)
---
---@param a number
---@param b number
---
---@return number
function xmath.copysign(a, b) end

---
---Compute the cosine of `a` (measured in radians).
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L90-L94](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L90-L94)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/cos)
---
---@param a number
---
---@return number
function xmath.cos(a) end

---
---Computes the hyperbolic cosine of `a`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L96-L100](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L96-L100)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/cosh)
---
---@param a number
---
---@return number
function xmath.cosh(a) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L102-L106](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L102-L106)
---
---@param a number
---
---@return number
function xmath.deg(a) end

---
---Compute the error function of `a`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L108-L112](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L108-L112)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/erf)
---
---@param a number
---
---@return number
function xmath.erf(a) end

---
---Computes the complementary error function of `a`, that is `1.0 - erf(a)`, but without loss of precision for large `a`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L114-L118](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L114-L118)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/erfc)
---
---@param a number
---
---@return number
function xmath.erfc(a) end

---
---Computes the `e` (Euler's number, `2.7182818`) raised to the given power `a`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L120-L124](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L120-L124)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/exp)
---
---@param a number
---
---@return number
function xmath.exp(a) end

---
---Compute `2` raised to the given power `a`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L126-L130](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L126-L130)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/exp2)
---
---@param a number
---
---@return number
function xmath.exp2(a) end

---
---Compute the `e` (Euler's number, `2.7182818`) raised to the given power `a`, minus `1.0`.
---
---This function is more accurate than the expression `exp(arg)-1.0` if `a` is close to zero.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L132-L136](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L132-L136)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/expm1)
---
---@param a number
---
---@return number
function xmath.expm1(a) end

---
---Compute the absolute value of a floating point value `a`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L138-L142](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L138-L142)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/fabs)
---
---@param a number
---
---@return number
function xmath.fabs(a) end

---
---Returns the positive difference between `a` and `b`, that is, if `a > b`, returns `a - b`, otherwise (if `a <= b`), returns `+0`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L144-L148](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L144-L148)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/fdim)
---
---@param a number
---
---@return number
function xmath.fdim(a, b) end

---
---Compute the largest integer value not greater than `a`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L150-L154](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L150-L154)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/floor)
---
---@param a number
---
---@return number
function xmath.floor(a) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L156-L160](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L156-L160)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/fma)
---
---@param a number
---
---@return number
function xmath.fma(a, b, c) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L162-L171](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L162-L171)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/)
---
---@param ... number
---
---@return number
function xmath.fmax(...) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L173-L182](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L173-L182)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/)
---
---@param ... number
---
---@return number
function xmath.fmin(...) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L184-L188](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L184-L188)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/)
---
---@param a number
---
---@return number
function xmath.fmod(a, b) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L190-L196](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L190-L196)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/)
---
---@param a number
---
---@return number
function xmath.frexp(a, b) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L205-L209](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L205-L209)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/)
---
---@param a number
---
---@return number
function xmath.gamma(a) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L211-L215](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L211-L215)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/)
---
---@param a number
---
---@return number
function xmath.hypot(a, b) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L217-L221](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L217-L221)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/)
---
---@param a number
---
---@return number
function xmath.isfinite(a) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L223-L227](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L223-L227)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/)
---
---@param a number
---
---@return number
function xmath.isinf(a) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L229-L233](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L229-L233)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/)
---
---@param a number
---
---@return number
function xmath.isnan(a) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L235-L239](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L235-L239)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/)
---
---@param a number
---
---@return number
function xmath.isnormal(a) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L241-L245](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L241-L245)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/)
---
---@param a number
---
---@return number
function xmath.j0(a) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L247-L251](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L247-L251)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/)
---
---@param a number
---
---@return number
function xmath.j1(a) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L253-L257](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L253-L257)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/)
---
---@param a number
---
---@return number
function xmath.jn(a, b) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L259-L263](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L259-L263)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/)
---
---@param a number
---
---@return number
function xmath.ldexp(a, b) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L265-L269](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L265-L269)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/)
---
---@param a number
---
---@return number
function xmath.lgamma(a) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L271-L287](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L271-L287)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/)
---
---@param a number
---
---@return number
function xmath.log(a, b) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L289-L293](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L289-L293)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/)
---
---@param a number
---
---@return number
function xmath.log10(a) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L295-L299](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L295-L299)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/)
---
---@param a number
---
---@return number
function xmath.log1p(a) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L301-L305](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L301-L305)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/)
---
---@param a number
---
---@return number
function xmath.log2(a) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L307-L311](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L307-L311)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/)
---
---@param a number
---
---@return number
function xmath.logb(a) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L313-L320](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L313-L320)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/)
---
---@param a number
---
---@return number
function xmath.modf(a, b) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L322-L326](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L322-L326)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/)
---
---@param a number
---
---@return number
function xmath.nearbyint(a) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L328-L332](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L328-L332)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/)
---
---@param a number
---
---@return number
function xmath.nextafter(a, b) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L334-L338](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L334-L338)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/)
---
---@param a number
---
---@return number
function xmath.pow(a, b) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L340-L344](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L340-L344)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/)
---
---@param a number
---
---@return number
function xmath.rad(a) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L346-L350](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L346-L350)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/)
---
---@param a number
---
---@return number
function xmath.remainder(a, b) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L197-L203](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L197-L203)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/)
---
---@param a number
---
---@return number
function xmath.remquo(a, b) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L352-L356](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L352-L356)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/)
---
---@param a number
---
---@return number
function xmath.round(a) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L358-L362](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L358-L362)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/)
---
---@param a number
---
---@return number
function xmath.scalbn(a, b) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L364-L368](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L364-L368)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/)
---
---@param a number
---
---@return number
function xmath.sin(a) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L370-L374](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L370-L374)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/)
---
---@param a number
---
---@return number
function xmath.sinh(a) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L376-L380](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L376-L380)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/)
---
---@param a number
---
---@return number
function xmath.sqrt(a) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L382-L386](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L382-L386)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/)
---
---@param a number
---
---@return number
function xmath.tan(a) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L388-L392](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L388-L392)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/)
---
---@param a number
---
---@return number
function xmath.tanh(a) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L394-L398](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L394-L398)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/)
---
---@param a number
---
---@return number
function xmath.tgamma(a) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L400-L404](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L400-L404)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/)
---
---@param a number
---
---@return number
function xmath.trunc(a) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L406-L410](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L406-L410)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/)
---
---@param a number
---
---@return number
function xmath.y0(a) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L412-L416](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L412-L416)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/)
---
---@param a number
---
---@return number
function xmath.y1(a) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L418-L422](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L418-L422)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/)
---
---@param a number
---
---@return number
function xmath.yn(a) end
