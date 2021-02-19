# Machine-Learning-Battery-SOC-Estimaton-Electric-Vehicles


This repository contains the codes to implement a data driven framework to predict the state-of-charge (SOC) of Lithium-Ion Batteries in Electric Vehicles applications. The codes provided in this repository have been developed as part of a project about Machine Learning applied to Lithium-Ion Batteries research at the University of Illinois at Chicago. The results illustrated in this repository have contributed to the paper "Data driven estimation of electric vehicle battery state-of-charge informed by automotive simulations and multi-physics modeling" published in the Journal of Powe Sources in 2020. 

We have been also invited to present the project at the ***PRiME 2020 ECS Meeting*** in the symposium *F03:  Modeling Electrochemical Systems for Transportation Applications*

If you are intended to use our code, please cite:

***Ragone M.***,*Yurkiv V.,Ramasubramanian A.,Kashir B.,Mashayek F.,Datadrivenestimationofelectricvehiclebatterystate-of-charge informed by automotive simulations and multi-physics modeling, Journal of Power Sources, 483 (2021) 229108*



![plot](./TOC.png)


# How to use it
## 1. Installation

**Matlab Installation**

Install MATLAB & Simulink version 2019 or above

https://www.mathworks.com/products/matlab.html

**Python Installtion**

Install Python 3.7 in Anaconda 

https://www.anaconda.com/

**Required Python packages**

**Pandas**:
```yaml
conda install -c anaconda pandas
```
**Scikit-Learn**:

```yaml
conda install -c conda-forge scikit-learn 
```

**Tensorflow 2.2.0**:
```yaml
pip3 install tensorflow==2.2.0
```

## 2. Matlab codes-Electric Vehicle Simulation

Matlab and Simulink are used to perform Electric Vehicle simulation. The dynamic EV model is built in Simulink usig the Power Train Blockset modules, which allows to simulate the component of the vehicles such as the battery pack, the electric motor, the differential etc. through appropriate blocks parametrized using lookup tables. In order to create the lookup tables needed by the Simulink EV model we need to run Matlab scripts. The scripts are implemented for two EV, TeslaS and Nissan Leaf. 

One of the main difference between these two vehicles is the battery pack. **TeslaS** has a battery pack of **8256 cylindrical cells**, managed in a **96s86p series/parallel connection**. A single cell is characterized by a **C-NMC chemistry** (anode material: Carbon,  cathode material: Nickel-Manganese-Cobalt) and it has a nominal capacity of 2.86 Ah and a nominal voltage of 4.2 V, resulting in a total capacity of 246 Ah and total energy of 100 kWh. This type of battery allows TeslaS to achieve **a driving range of ~ 600 km** before recharging the battery.

On the other hand, **Nissan Leaf** has a battery pack of 288 pouch cells, managed in a **96s86p series/parallel connection**. A single cell is characterized by a **C-NMC chemistry** (anode material: Carbon,  cathode material: Nickel-Manganese-Cobalt) and it has a nominal capacity of 2.86 Ah and a nominal voltage of 4.2 V, resulting in a total capacity of 246 Ah and total energy of 100 kWh. This type of battery allows TeslaS to achieve **a driving range of ~ 600 km** before recharging the battery.
1) Parametr

