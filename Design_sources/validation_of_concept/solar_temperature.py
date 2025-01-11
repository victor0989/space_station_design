import numpy as np
import matplotlib.pyplot as plt

def solar_temperature(distance):
    # Constante de Stefan-Boltzmann en W/(m^2·K^4)
    sigma = 5.6703e-8
    # Temperatura del Sol en Kelvin
    T_sun = 5778 
    # Radio del Sol en metros
    R_sun = 6.96e8 
    # Potencia irradiada
    power = 4 * np.pi * (R_sun**2) * sigma * (T_sun**4)
    # Temperatura en función de la distancia
    T_object = (power / (4 * np.pi * (distance**2) * sigma))**(1/4)
    return T_object

# Distancias en metros (de 0.1 AU a 1 AU)
distances = np.linspace(0.1 * 1.496e11, 1 * 1.496e11, 500)
temperatures = solar_temperature(distances)

plt.figure(figsize=(10, 6))
plt.plot(distances / 1.496e11, temperatures)
plt.title('Temperatura en función de la distancia al Sol')
plt.xlabel('Distancia al Sol (UA)')
plt.ylabel('Temperatura (K)')
plt.grid(True)
plt.show()
