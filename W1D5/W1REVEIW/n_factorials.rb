def n_factorial(n)
return [1] if n == 1
facs = n_factorial(n-1)
new_fac = facs[-1] * (n-1)
facs << new_fac
end