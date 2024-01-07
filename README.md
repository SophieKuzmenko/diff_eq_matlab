This is one of my university projects<br /> <br /> Experimenting with different ways to solve the following system of differential equations<br /> <br /> 
$`\begin{cases}
\frac{\partial y_1}{\partial t}= \frac{-26}{3}y_1(t) - \frac{10}{3}y_2(t) +x (t)\\
\frac{\partial y_2}{\partial t}= \frac{10}{3}y_1(t) - \frac{1}{3}y_2(t) +x (t)\\
\end{cases}`$ <br /> <br />
over the interval $`[0,8]`$ , where  $`x(t)=exp(-t)sin(t)`$ <br /> <br />
This project overviews and compares following methods: <br /> 
1. built-in Matlab functions dsolve and ode45
2. Adams–Bashforth method <br />  <br />
$`\boldsymbol{y}_n = \boldsymbol{y}_{n-1} + \frac{h}{2}\boldsymbol{[}3\boldsymbol{f}(t_{n-1}, \boldsymbol{y}_{n-1}) - \boldsymbol{f}(t_{n-2},\boldsymbol{y}_{n-2})\boldsymbol{]}`$ <br />  <br />
3. Adams-Moulton method <br />  <br />
$`\boldsymbol{y}_n = \boldsymbol{y}_{n-1} + \frac{h}{12}\boldsymbol{[}5\boldsymbol{f}(t_n,\boldsymbol{y}_n)+8\boldsymbol{f}(t_{n-1}, \boldsymbol{y}_{n-1}) - \boldsymbol{f}(t_{n-2},\boldsymbol{y}_{n-2})\boldsymbol{]} `$ <br />  <br />
4. implicit Runge-Kutta method<br />
  $`\boldsymbol{y}_n = \boldsymbol{y}_{n-1} + h\sum\limits_{k=1}^3w_k\boldsymbol{f}_k`$<br />
$`\boldsymbol{f}_k=\boldsymbol{f}(t_{n-1}+c_kh,\boldsymbol{y}_{n-1}+h\sum\limits_{K=1}^3a_{K,k}\boldsymbol{f}_k)`$ <br />
using Butcher's table:<br />

| $`\boldsymbol{c_i}`$ | $`\boldsymbol{a_{i,1}}`$ | $`\boldsymbol{a_{i,2}}`$ | $`\boldsymbol{a_{i,3}}`$ | 
|:---:|:---:|:---:|:---:|
0| 1/6|-1/6|0|
1/2 |1/6 |1/3|0|
1| 1/6| 5/6| 0|
|||||
||$`\boldsymbol{w_1}`$|$`\boldsymbol{w_2}`$|$`\boldsymbol{w_3}`$|$`\boldsymbol{w_4}`$|
|| 1/6| 2/3 | 1/6|<br /> <br />

It is taken that $`\boldsymbol{y}_n=[y_1(t_n),y_2(t_n)]^T`$ and $`\boldsymbol{f}(t_n, \boldsymbol{y}_n)`$ is defined as $`\frac{\partial{y(t)}}{\partial{t}}\rvert_{t=t_n}=\boldsymbol{f}(t_n, \boldsymbol{y}_n)`$ <br /> <br />
MORE DETAILED DESCRIPTION AND DISCUSSION OF THE RESULTS ARE PROVIDED (IN POLISH) IN THE FILE Raport_Project1.pdf
