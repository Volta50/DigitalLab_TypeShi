# Informe Lab 01

## Datasheets

### TTL-SN74LS04
<img width="998" height="666" alt="TTL_DataSheet" src="https://github.com/user-attachments/assets/6d239c45-b573-4402-b3db-2d10c1cccbaa" />
<img width="1017" height="201" alt="TTL_switch" src="https://github.com/user-attachments/assets/1e935513-b894-4632-8376-ac4ee22ce62d" />

### CMOS-CD4069

<img width="592" height="573" alt="CD4069_Datasheet" src="https://github.com/user-attachments/assets/b68ed569-cb5d-4968-86bb-239ade0691cb" />
<img width="623" height="271" alt="CD4069_prop" src="https://github.com/user-attachments/assets/530a43a3-183a-479b-9e2d-9193c5bb9c78" />

## Trabajo previo

## 1. Comparacion de especificaciones tecnicas

## Comparación de parámetros: 74LS04 (TTL) vs CD4069 (CMOS)

| Parámetro | 74LS04 (TTL) | CD4069 (CMOS) | Unidad |
|----------|--------------|--------------|-------|
| **V<sub>IH</sub>** (mín. tensión nivel alto) | 2.0 | 1.5 | V |
| **V<sub>IL</sub>** (máx. tensión nivel bajo) | 0.8 | 1.0 | V |
| **V<sub>OH</sub>** (salida nivel alto)       | 3.4 | 5.0 | V |
| **V<sub>OL</sub>** (salida nivel bajo)       | 0.25 | 0.05 | V |
| **t<sub>PLH</sub>** (retardo bajo→alto)      | 9   | 55  | ns |
| **t<sub>PHL</sub>** (retardo alto→bajo)      | 10  | 55  | ns |

Los dispotisitvos CMOS son mas tolerantes al ruido y cambios en la señal de entrada, entregan una señal de salida mayor calidad.

74LS04 (TTL) es 5 veces mas rapido en conmutacion que el CD4069 (CMOS) , util para altas frecuencias. 

## 2. Circuito equivalente 



## 4. Simulación de comportamiento ante señales de entrada
### CMOS

**1 MHz**  
<img width="1899" height="418" alt="image" src="https://github.com/user-attachments/assets/f6937552-9411-47d6-8071-1a23343b5976" />

**100 kHz**  
<img width="1899" height="418" alt="image" src="https://github.com/user-attachments/assets/4ff11ec4-0284-4fb0-ada8-847f8edcda20" />

**1 Hz**  
<img width="1899" height="418" alt="image" src="https://github.com/user-attachments/assets/fa250bc1-fc00-4073-a36e-9bb4436f1db0" />



### TTL
**1 MHz**  
<img width="1899" height="418" alt="image" src="https://github.com/user-attachments/assets/2089fb51-b3b3-4b26-bdf8-55fc55c9d746" />  
**100 kHz**  
<img width="1899" height="418" alt="image" src="https://github.com/user-attachments/assets/4fcc4c43-f9f5-4080-9621-c7eb0263952e" />  

**1 Hz**  
<img width="1899" height="418" alt="image" src="https://github.com/user-attachments/assets/15893dfb-8c16-415c-8a82-9f6899af44b6" />  

**Observaciones**
Los tiempos de conmutación difieren al cambiar las frecuencias.
## 5. Función de transferencia
**CMOS**  
<img width="1899" height="413" alt="image" src="https://github.com/user-attachments/assets/54bfc8d8-3ee5-49a6-959e-a69a8a73c2e4" />

$V_{IH}-min = 2.6$ V  
$V_{IL}-max = 2.4$ V  
$V_{OH}-min = 4.975$ V  
$V_{OL}-max = 0$ V  

**TTL**  
<img width="1899" height="413" alt="image" src="https://github.com/user-attachments/assets/6bc3165d-7c8f-447c-a4cb-23a0e515a47b" />

$V_{IH}-min = 2.6$ V  
$V_{IL}-max = 2.4$ V  
$V_{OH}-min = 4.975$ V  
$V_{OL}-max = 0$ V  

## 6. Estimación de tiempos de conmutación  
### CMOS  

<img width="1897" height="719" alt="image" src="https://github.com/user-attachments/assets/fcfc18e7-81ff-4661-8846-5c312972ad86" />  

$t_{pHL} = 80$ ns
<img width="1897" height="719" alt="image" src="https://github.com/user-attachments/assets/2efe2687-ec48-4d66-8a61-7d32650dccc0" />  

$t_{pLH} = 48$ ns

### TTL
<img width="1898" height="412" alt="image" src="https://github.com/user-attachments/assets/e17e4579-644b-4a6f-acf9-97f1f18a29ec" />  

$t_{pHL} = 15$ ns  

<img width="1898" height="584" alt="image" src="https://github.com/user-attachments/assets/bd0132e6-da80-49b8-8613-fcbc350ab6fc" />  

$t_{pLH} = 15$ ns  

## 7. Estimación del consumo de potencia

### Cálculo teórico — Potencia estática

La **potencia estática** corresponde a la potencia consumida por el dispositivo cuando **no está conmutando** (entradas y salidas en estado lógico constante). Se calcula mediante la expresión:

$P_{estática} = V_{CC} \cdot I_{CC}$

> Donde:
>
> * $V_{CC}$ (o $V_{DD}$ en CMOS) es el voltaje de alimentación.
> * $I_{CC}$ (o $I_{DD}$ en CMOS) es la corriente de alimentación en reposo (quiescent supply current) tomada del datasheet.

#### 1) 74LS04 (TTL)


* Valores extraídos del datasheet:
  * Condiciones de operación tomadas: $V_{CC} = 5\ \text{V}$.
  * **ICCH (typ)** = 1.2 mA  (corriente de alimentación con entradas en nivel alto)
  * **ICCL (typ)** = 3.6 mA  (corriente de alimentación con entradas en nivel bajo)

$P_{estática\_74LS04} = V_{CC} \cdot I_{CCL} = 5\ \text{V} \cdot 3.6\ \text{mA} = 18\ \text{mW}$

Usando ICCH (1.2 mA) se obtendría $P = 6\ \text{mW}$, por lo que el consumo estático típico se encuentra entre **6 mW** y **18 mW** por puerta dependiendo del estado lógico.

Como criterio conservador se elige el **peor caso** (ICCL = 3.6 mA). Entonces la potencia estática por puerta (inversor) es:

$P_{estática\_74LS04} = 18\ \text{mW}$

---

#### 2) CD4069 (CMOS)

* Valor tomado del datasheet en condiciones típicas: **IDD = 1.0 $ \mu A$** (a $V_{DD} = 5\ \text{V}$, 25 °C).

Cálculo:

$P_{estática\_CD4069} = V_{DD} \cdot I_{DD} = 5\ \text{V} \cdot 1.0\times10^{-6}\ \text{A} = 5\ \mu\text{W}$


---

### Cálculo teórico — Potencia dinámica

La potencia dinámica corresponde a la energía consumida cuando las compuertas cambian de estado lógico. La expresión general:

$P_{dinámica} = C_{L} \cdot V_{CC}^{2} \cdot f \cdot \alpha$

> Donde:
>
> * $C_{L}$ es la capacitancia de carga efectiva (datasheet: Cpd o carga externa).
> * $V_{CC}$ o $V_{DD}$ es la tensión de alimentación.
> * $f$ es la frecuencia de conmutación.
> * $\alpha$ es el factor de actividad (para onda cuadrada se asume $\alpha = 0.5$).

#### 1) 74LS04 (TTL)

El datasheet proporciona tiempos de propagación ($t_{pLH} \approx 9\ \text{ns}$) que pueden usarse para estimar una capacitancia equivalente, pero de forma práctica se usa el valor típico de carga dinámica del fabricante. A modo de aproximación, se considera una carga de **10 pF** por salida.

Cálculo para $f = 1\ \text{MHz}$ y $V_{CC} = 5\ \text{V}$:

$P_{dinámica\_74LS04} = 10\ \text{pF} \cdot (5\ \text{V})^{2} \cdot 1\ \text{MHz} \cdot 0.5$

$P_{dinámica\_74LS04} = 0.125\ \text{mW}$

---

#### 2) CD4069 (CMOS)

El datasheet especifica una **capacitancia de potencia (Cpd)** de aproximadamente **12 pF**.

Cálculo para $f = 1\ \text{MHz}$ y $V_{DD} = 5\ \text{V}$:

$P_{dinámica\_CD4069} = 12\ \text{pF} \cdot (5\ \text{V})^{2} \cdot 1\ \text{MHz} \cdot 0.5$

$P_{dinámica\_CD4069} = 0.15\ \text{mW}$

---

### Cuadro comparativo (potencia estática y dinámica, $f = 1\ \text{MHz}$)

| Dispositivo   | VCC / VDD | Corriente (TYP) usada | P_estática (calculada) | P_dinámica (calculada, 1 MHz) |
| ------------- | --------- | --------------------- | ---------------------- | ----------------------------- |
| 74LS04 (TTL)  | 5 V       | 1.2 mA                | **6 mW**               | 0.125 mW                      |
| CD4069 (CMOS) | 5 V       | 1.0 µA                | **5 µW**               | 0.15 mW                       |


## Simulación por medio de LTspice

### Estático — 74LS04 (TTL)

Para medir el consumo **estático** se configuró el circuito de la siguiente forma:

- Alimentación: $V_{CC}=5\ \text{V}$.
- Entrada del inversor: fijada en $A = 0\ \text{V}$.
- Salida: libre (sin carga externa).

![Esquema en LTspice](Imag_sim/Circuito_TTL-estatico.png)

**Resultados y analsis:**  
La corriente medida en la fuente fue **24.8 µA** (microamperios), notablemente menor que el valor típico del datasheet para el SN74LS04.

![Corriente de entrada medida (LTspice)](Imag_sim/Circuito_TTL-estatico-corriente.png)

 Esto se puede deber a que el modelo SPICE utilizado prioriza la simulación lógica, sin incluir todas las corrientes internas de polarización. Por ello, la simulación muestra consumos en el rango de µA, mientras que el dispositivo real presenta corrientes de reposo en el orden de mA.

### Estático — CD4069 (CMOS)

Para el caso del **CD4069**, el procedimiento fue similar:

- Alimentación: $V_{DD}=5\ \text{V}$ (con $V_{SS}=0\ \text{V}$).  
- Entrada del inversor: fijada en $A = 0\ \text{V}$ (nivel lógico bajo).  
- Salida: libre (sin carga externa).  

![Esquema en LTspice](Imag_sim/Circuito_CMOS-estatico.png)

**Resultados y análisis:**  
La corriente medida en la fuente resultó prácticamente **nula (95.2 nA)** en la simulación, lo cual es coherente con la naturaleza CMOS, donde el consumo estático ideal es cercano a cero. Aun así, el valor obtenido es menor al teórico calculado.

![Corriente de entrada medida (LTspice)](Imag_sim/Circuito_CMOS-estatico-corriente.png)

Esto confirma que, en reposo, la tecnología CMOS presenta un consumo estático despreciable comparado con la lógica TTL, aunque los valores simulados no concuerdan con los teóricos, resultando mucho menores, como si LTspice no tuviera en cuenta este parámetro.

### Dinámico — 74LS04 (TTL)

Para la potencia **dinámica** en el 74LS04 se configuró el inversor en LTspice de la siguiente forma:

- Alimentación: $V_{CC} = 5\ \text{V}$.  
- Entrada: señal cuadrada de $1\ \text{MHz}$, generada con una fuente PULSE.  
- Salida: conectada a una carga capacitiva de **10 pF** a tierra, representando la carga típica de salida.

![Esquema en LTspice](Imag_sim/Circuito_TTL-dinamico.png)

**Resultados y Análisis:**  
- Potencia medida en simulación: **0.335 mW**.

![Corriente de entrada medida (LTspice)](Imag_sim/Circuito_TTL-dinamico-potencia.png)

El valor simulado resulta mayor al calculado teóricamente (0.335 mW vs. 0.125 mW). 

---

### Dinámico — CD4069 (CMOS)


Para el **CD4069**, el montaje fue equivalente:


- Alimentación: $V_{DD} = 5\ ext{V}$.
- Entrada: señal cuadrada de $1\ ext{MHz}$ (fuente PULSE).
- Salida: carga capacitiva de **12 pF** conectada a tierra (se usó la $C_{pd}$ especificada en el datasheet para aproximar la carga efectiva).


![Esquema en LTspice](Imag_sim/Circuito_CMOS-dinamico.png)

**Resultados y Análisis:**
- Potencia medida en simulación: **0.331 mW**.


![Corriente de entrada medida (LTspice)](Imag_sim/Circuito_CMOS-dinamico-potencia.png)



El valor simulado (**0.331 mW**) está por encima del cálculo teórico. 

El consumo de potencia depende tanto de la **frecuencia de operación** como de la **tecnología utilizada**. En **TTL (74LS04)** existe un consumo estático apreciable incluso en reposo, al que se suma una componente dinámica que crece aproximadamente de forma lineal con la frecuencia, debido a corrientes de conmutación internas y a la carga capacitiva. En cambio, en **CMOS (CD4069)** el consumo estático es prácticamente nulo y la potencia total está dominada por la componente dinámica, que sigue la relación:
$$
P \approx C \cdot V^2 \cdot f
$$

 Por ello, a bajas frecuencias CMOS es mucho más eficiente que TTL, mientras que a altas frecuencias el consumo de ambas tecnologías aumenta, siendo mayor en la que presente mayor capacitancia efectiva o tiempos de transición más largos.


---
## 8. Oscilador en anillo basado en compuertas NOT

El **oscilador en anillo** es un circuito digital que genera una señal periódica a partir de un número **impar** de inversores (compuertas NOT) conectados en serie y realimentados en un lazo cerrado. La oscilación surge porque cada inversor introduce un **retardo de propagación** $(t_{pd})$ en la transición de la señal, lo cual impide que el sistema alcance un estado estable. Como resultado, el valor lógico se propaga alrededor del anillo generando una onda cuadrada en las salidas.

La frecuencia de oscilación puede aproximarse mediante:

$$
f \approx \frac{1}{2 \cdot N \cdot t_{pd}}
$$

donde \(N\) es el número de inversores en el anillo. Este tipo de oscilador es común en circuitos integrados CMOS, ya que su simplicidad lo hace útil como **generador de reloj**, para caracterizar **tiempos de propagación** o como base de osciladores controlados por tensión (VCO).

## Simulación del oscilador en anillo (CMOS)

El oscilador en anillo se construyó en LTspice utilizando **3 inversores CMOS (CD4069)** conectados en serie, con la salida del último inversor realimentada a la entrada del primero. Se eligió un número impar de etapas para asegurar la inestabilidad lógica y, con ello, la generación de oscilaciones.

- Alimentación: $V_{DD} = 5\ \text{V}$  
- Número de inversores: $N = 3$  
- Carga: capacitores de **10 pF** en cada salida para representar la carga efectiva  
- Condición inicial: se aplicó `.ic V(n1)=5` en uno de los nodos, con el fin de romper la simetría inicial y permitir que el oscilador arrancara.

![Esquema en LTspice](Imag_sim/circuito_oscilador-ltspice.png)

### Resultados y Análisis 

La salida de cada inversor muestra una onda cuadrada con desfase entre etapas, lo que confirma el comportamiento esperado del oscilador. La frecuencia de oscilación medida fue de aproximadamente **1.6 MHz** (8 pulsos en 5 micro segundos).



![Forma de onda simulada](Imag_sim/Senal_oscilador-ltspice.png)


El circuito logra oscilar de manera autónoma gracias al retardo de propagación intrínseco de las compuertas CMOS.





## Parte 1(Comprobación de specs)
### NOT CMOS: CD4069ube
**Función de transferencia**
![TF_CD4069](https://github.com/user-attachments/assets/7469a495-12ad-466f-94b0-d7749f854982)
**Señales independientes**
![CMOS_image](https://github.com/user-attachments/assets/2da6ad6d-5bb7-4ff1-9692-2b64bf64f14e)

$V_{IH}-min = 2.4$ V  
$V_{IL}-max = 1.2$ V   
$V_{OH}-min = 4.8$ V  
$V_{OL}-max = 0$ V  
**NB!** Tomando en cuenta que la señal de salida cuenta con un pequeño offset negativo de 0.4V y el $V_P$ fue de 4.4 V, el $V_{OH}$ fue de 4.8 V 

**Análisis:** los valores de $V_{IH}$ y $V_{IL}$ difieren levemente de lo especficado en el datasheet. Esto se debe a que dichos valores solo definen las regiones en las que el fabricante garantiza que el voltaje será interpretado como nivel alto (H) o nivel bajo (L). La región intermedia se considera indeterminada. Lo importante en este caso es que los valores medidos se encuentran dentro del rango establecido.  
En cuanto a $V_{OH}$ difiere en un 1.4\% con el original, puede deberse a interferencias en el montaje y cambios de condiciones ambientales, esto mismo ocurre con el $V_{OL}$.

### NOT TTL: 74LS04
**Función de transferencia**
![TF_TTL](https://github.com/user-attachments/assets/4865f319-ed9e-4edd-a0b2-c83b38aaa4f9)
**NB!** faltó ajustar el trigger, por ello la función de transferencia no es clara, se recomienda observar las señales independientes ->>  
**Señales independientes**
![TTL-raw](https://github.com/user-attachments/assets/d66accf0-8cb1-4bdb-8f4c-52e8830aec28)

$V_{IH} = 2$ V  
$V_{IL} = 1.2$ V  
$V_{OH} = 4.8$ V  
$V_{OL} = 0.2$ V  

**Análisis:** los valores hallados de $V_{OH}$ y $V_{OL}$ resultan más altos que los especificados en el datasheet. Esto se debe a que, en la práctica, la compuerta no está entregando corriente de salida, por lo que las condiciones de prueba difieren de las utilizadas por el fabricante. En consecuencia, los voltajes medidos se aproximan más a los valores ideales.
Cabe destacar que las discrepancias en los valores $V_{IH}$ y $V_{IL}$ se deben a lo discutido previamente para CMOS, donde existe una región indeterminada y lo importante es que los valores dados por el fabricante yacen en los límites encontrados.

### Tiempos de conmutación
**TTL**
![WhatsApp Image 2025-09-19 at 16 22 37(1)](https://github.com/user-attachments/assets/f0376067-1ad3-4600-a8fc-113ee670736d)
**CMOS**
![WhatsApp Image 2025-09-19 at 16 22 37(2)](https://github.com/user-attachments/assets/f08a43f4-147e-465c-b863-c216d325530f)

#### TTL
$t_r = 112$ *us*
$t_f = 112$ *us*

#### CMOS
$t_r = 46$ *us*
$t_f = 46$ *us*

Según la datasheet el TTL debería ser más rápido que el CMOS, sin embargo para condiciones de carga ligera, la resistencia de salida más alta y asimétrica del TTL hacen que el CMOS sea más rápido.  

Los tiempos hallados muestran discrepancias significativas respecto al datasheet. Esto se debe al método de medición. El uso del osciloscopio introduce inadvertidamente un circuito RC parásito, cuya constante de tiempo (τ) afecta de forma inherente la respuesta en frecuencia del sistema, afectando las magnitudes de tiempo observadas y generando un error sistemático en las mediciones.
### Tiempos de propagación
Dado que los tiempos de propagación miden el tiempo que toma en reaccionar la compuerta ante un cambio de estado en la entrada, **i.e.** H-> L o L-> H, se precisa de un pulso para poder evaluar claramente el instante en el que la entrada cambia para determinar la reacción. Al usar una señal triangular no fue posible determinar este instante.

## Parte 2(Determinación de FAN-IN y FAN-OUT)
### TTL-SN74LS04
**Fan-out = min[ Iₒₗ(ₘₐₓ) / Iᵢₗ(ₘₐₓ) , Iₒₕ(ₘₐₓ) / Iᵢₕ(ₘₐₓ) ]**

| Parámetro | Símbolo | Valor |
|-----------|---------|-------|
| Corriente de Salida (Bajo) | Iₒₗ | 8 mA |
| Corriente de Entrada (Bajo) | Iᵢₗ | 0.4 mA |
| Corriente de Salida (Alto) | Iₒₕ | 0.4 mA |
| Corriente de Entrada (Alto) | Iᵢₕ | 20 μA |

**Fan-out(low) = 8 mA / 0.4 mA = 20**

**Fan-out(high) = 0.4 mA / 0.02 mA = 20**

**Fan-out máximo: 20 cargas**
### CMOS-CD4069
| Parámetro | Símbolo | Valor |
|-----------|---------|-------|
| Corriente de Salida (Bajo) | Iₒₗ | 0.5 mA |
| Corriente de Entrada (Bajo) | Iᵢₗ | 0.1 μA |

**Fan-out = 0.5 mA / 0.0001 mA = 5000**
Es prácticamente ilimitado para aplicaciones DC


## Parte 3(Oscilador de anillo)

Al inicio del laboratorio se implementó el oscilador en anillo siguiendo la misma configuración utilizada en la simulación. Una vez montado el circuito, se procedió a medir la señal de salida con el osciloscopio. En el caso de la configuración con tres compuertas, se registró una frecuencia de aproximadamente 75 kHz, 

![3 compuertas](Imag_lab/3_compuertas_anillo.jpg)

Al modificar el montaje a cinco compuertas, la frecuencia obtenida fue de alrededor de 36 kHz.

![5 compuertas](Imag_lab/5_compuertas_anillo.jpg)

 En contraste, al realizar la prueba con dos y cuatro compuertas, no se observó oscilación en la salida.

**Análisis**

De acuerdo con la teoría, un oscilador en anillo requiere un número impar de inversores para garantizar la inversión neta del lazo y, por lo tanto, la condición de oscilación. Esto explica que solo las configuraciones con tres y cinco etapas presentaran oscilación. Además, los resultados experimentales concuerdan con la relación teórica de que al incrementar el número de etapas, la frecuencia de oscilación disminuye, puesto que el delay total del incrementa.

## Referencias
1.  Brown, S., & Vranesic, Z. (2014). *Fundamentals of Digital Logic with VHDL Design* (3rd ed.). McGraw-Hill.
2.  Wakerly, J. F. (2005). *Digital Design: Principles and Practices* (4th ed.). Prentice Hall.
3.  Sedra, A. S., & Smith, K. C. (2020). *Microelectronic Circuits* (8th ed.). Oxford University Press.
4.  Texas Instruments. (2015). *CD4069UB CMOS Hex Inverter Datasheet* (Publication No. CD4069UB). Recuperado de https://www.ti.com/lit/ds/symlink/cd4069ub.pdf
5.  Texas Instruments. (2017). *SN74LS04 Hex Inverter Datasheet* (Publication No. SN74LS04). Recuperado de https://www.ti.com/lit/ds/symlink/sn74ls04.pdf
6.  Texas Instruments. (2016). *A Guide to Logic Labels and Packaging* (Publication No. SCEA026). Recuperado de https://www.ti.com/lit/an/scea026/scea026.pdf






