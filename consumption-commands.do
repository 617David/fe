* Data exploration

describe
sum
inspect
list year c y st tr ft

* Scatter plots

scatter c y
scatter c st
scatter c tr
scatter c ft

* Estimation of the model

regress c y st tr ft

* Testing a reduction of the model with the F-test

regress c y st
display ((.1594234-.141293465)/2)/(.141293465/(25-5))
display Ftail(2,20,1.2831404)

regress c y st tr ft
test tr=ft=0

* Testing a reduction of the model with the LM-test

regress c y st
predict test, resid
regress test y st tr ft
scalar lm=25*0.1137
display lm
display chi2tail(2,lm)

* Testing a reduction of the model with the LR-test

regress c y st tr ft
scalar llb=e(ll)
display llb
display -25/2*(ln(2*_pi)+ln(0.141293465/25)+1)
regress c y st
scalar llr=e(ll)
display llr
display -25/2*(ln(2*_pi)+ln(0.1594234/25)+1)
display 2*(llb-llr)
display chi2tail(2, 2*(llb-llr))

qui regress c y st tr ft
estimates store mb
qui regress c y st
estimates store mr
lrtest mr mb
