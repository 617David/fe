* Data exploration

describe
sum
inspect
list life exp tobacco alco

* Scatter plots

scatter life exp
scatter life tobacco
scatter life alco

* Estimation of the model for Exercises a, b and c

regress life exp tobacco
ereturn list

* Testing hypotheses by applying the t-test in scalar notation (Exercises a, b and c)

estat vce
display 2*ttail(29, abs(-2.81))

display ttail(29, 1.78)

display 2*ttail(29, abs(-0.16))

* Testing hypotheses by applying the t-test in matrix notation (Exercises b and c)

matrix beta=(e(b))'
matrix list beta
matrix vcm=e(V)
matrix list vcm

matrix c=(100\0\0)
matrix list c
matrix varcb=c'*vcm*c
matrix list varcb
scalar secb=sqrt(varcb[1,1])
display secb
matrix tb=(c'*beta-0.167)/secb
matrix list tb
display ttail(29, 1.7853439)

matrix c=(100\1\0)
matrix list c
matrix varcb=c'*vcm*c
matrix list varcb
scalar secb=sqrt(varcb[1,1])
display secb
matrix tc=(c'*beta-0)/secb
matrix list tc
display 2*ttail(29, abs(-.16121158))

* Testing a hypothesis by applying the F-test (Exercise c)

gen x_transf=exp-100*tobacco
regress life x_transf
display Ftail(1,29,0.026)

regress life exp tobacco
test 100*exp+tobacco=0
